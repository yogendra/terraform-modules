#!/usr/bin/env python3
import argparse
import os
import sys
assert sys.version_info >= (3, 10)

def main():
  arg =_process_args()
  az_list = arg.az_list
  generate:str = arg.generate.lower()

  if generate == "default-az-list" :
      from json import dumps,loads
      print(dumps(loads(DEFAULT_AZ_LIST)))
  if generate == 'all' or generate == 'providers':
      print(generate_provider(az_list, arg.tags))
  if generate == 'all' or generate == 'vpc-config':
      print(generate_vpc_config(az_list, arg))
  if generate == 'all' or generate == 'vpc' :
      print(generate_vpc(az_list, prefix=arg.prefix, project_cidr=arg.project_cidr, module_source=arg.vpc_module_source))
  if generate == 'all' or generate == 'vpc-peering':
      print(generate_peering(az_list, prefix=arg.prefix,module_source=arg.vpc_peering_module_source))



def generate_provider(az_list, tags={}):
  providers = ""
  for region in _region_list(az_list):
    provider_alias = _provider_alias(region)
    providers += f"""
provider "aws" {{
  alias = "{provider_alias}"
  region = "{region}"
  default_tags {{
    tags = {_as_tf_obj(tags, indent=3)}
  }}
}}
    """
  return providers


def generate_vpc_config(az_list, arg):

  project_cidr:str=arg.project_cidr
  subnet_style:str=arg.subnet_style
  subnet:list=arg.subnet
  subnet_suffix:int=arg.subnet_suffix
  prefix:str=arg.prefix
  use_nat:bool=arg.use_nat
  air_gapped:bool=arg.air_gapped

  vpc_config=""
  az_subnets = ["public", "private"] if subnet is None else subnet
  project_suffix = int(project_cidr.split("/")[1])
  basic = subnet_style == "basic"
  from json import dumps
  # create a vpc for each region
  vpc = {}
  region_cidr_index=0
  region_suffix = project_suffix + 5

  zone_cidr_index =0
  zone_suffix = region_suffix + 2
  subnet_suffix = zone_suffix + 1 if subnet_suffix is None else subnet_suffix

  for region, zones in az_list.items():
    zone_cidr_index = region_cidr_index * 4
    vpc[region] = {
      "air-gapped" : air_gapped,
      "use-nat"    : use_nat,
      "region" : region,
      "cidrs" :  [_sub_cidr(project_cidr, region_suffix, region_cidr_index)],
      "zones" : [],
    }
    region_cidr_index = region_cidr_index + 1
    if(len(zones) > 4 ):
      vpc[region]["cidrs"].append(_sub_cidr(project_cidr, region_suffix, region_cidr_index))
      region_cidr_index = region_cidr_index + 1

    for zone in zones:
      az_cidr = _sub_cidr(project_cidr, zone_suffix, zone_cidr_index)
      az_subnets = _az_subnets_basic(az_cidr,az_subnets, subnet_suffix) if basic else _az_subnets_advance(az_cidr)
      zone_cidr_index = zone_cidr_index + 1
      zone_config = {
        "name": zone,
        "cidr" : az_cidr,
        "subnets" : az_subnets
      }
      vpc[region]['zones'].append(zone_config)
  return f"""
locals {{
  project_config = {{
    cidr = "{project_cidr}"
    prefix = "{prefix}",
    ssh-public-keys = [
      // SSH Keys go here (Example: "key1","key2"...)
    ]
    remote-ips = {{
      // Allow IPs go here in the "KEY" = "VALUE" pair (Example: "yogi" = "127.0.0.1")
    }}
  }}
  vpc_config = {_as_tf_obj(vpc, indent=2)}
}}
  """


def generate_vpc(az_list,prefix:str,  project_cidr:str, module_source:str):
  vpcs=""
  for region in _region_list(az_list):
    provider_alias = _provider_alias(region)
    module_name = _vpc_module_name(region)
    vpcs += f"""
module "{module_name}" {{
  source = "{module_source}"
  providers = {{
    aws = aws.{provider_alias}
  }}
  project_config = local.project_config
  config = local.vpc_config["{region}"]

}}
    """
  return vpcs

def generate_peering(az_list, prefix:str, module_source:str):
  regions = _region_list(az_list)

  peer_modules=""
  for ids, src in enumerate(regions):
    for idd, dest in enumerate(regions):
      if idd <= ids:
        continue

      src_provider = _provider_alias(src)
      dest_provider = _provider_alias(dest)
      src_module = _vpc_module_name(src)
      dest_module = _vpc_module_name(dest)
      peer_modules+=f"""
module "peer-{src}-{dest}" {{
  source = "{module_source}"
  src_vpc_id =  module.{src_module}.vpc_id
  dest_vpc_id = module.{dest_module}.vpc_id
  prefix = local.project_config["prefix"]
  providers = {{
    aws.src = aws.{src_provider}
    aws.dest = aws.{dest_provider}
  }}
  depends_on = [
    module.{src_module},
    module.{dest_module}
  ]
}}
      """
  return peer_modules


def _as_tf_obj(o, size=2, indent=0):
  spc = " " * indent * size
  val_spc = spc + (" " * size)
  if o == None:
    return "null"

  match o:
    case str():
      return f'"{o}"'
    case bool():
      return 'true' if o == True else 'false'
    case int():
      return o
    case dict():
      output ="{\n"
      entries = o.items()
      last_index = len(entries)-1
      for i, (k,v) in enumerate(entries):
        output += val_spc + k + " = " + _as_tf_obj(v,indent=indent+1)
        if i != last_index:
            output += ","

        output += "\n"
      output += spc + "}"
      return output

    case list():
      output ="[\n"
      last_index = len(o) - 1;
      for index,v in enumerate(o):
        output += val_spc + _as_tf_obj(v, indent=indent+1)
        if index != last_index:
            output += ","
        output += "\n"
      output += spc + "]"
      return output

def _region_list(az_list):
  return list(az_list.keys())

def _vpc_module_name(region:str, ) -> str:
  return f"vpc-{region}"

def _az_subnets_advance(az_cidr:str):
  az_suffix = int(az_cidr.split("/")[1])
  ingress_suffix = az_suffix + 3
  egress_suffix = az_suffix + 3
  app_suffix = az_suffix + 2
  db_suffix = az_suffix + 2
  mgmt_suffix = az_suffix + 3
  devops_suffix = az_suffix + 3

  ingress_cidr = _sub_cidr(az_cidr, ingress_suffix, 0)
  egress_cidr = _sub_cidr(az_cidr, egress_suffix, 1)
  app_cidr = _sub_cidr(az_cidr, app_suffix, 1)
  db_cidr = _sub_cidr(az_cidr, db_suffix, 2)
  mgmt_cidr =_sub_cidr(az_cidr, mgmt_suffix, 6)
  devops_cidr = _sub_cidr(az_cidr, devops_suffix, 7)

  return {
    "ingress": ingress_cidr,
    "egress" : egress_cidr,
    "app" : app_cidr,
    "db" : db_cidr,
    "mgmt" : mgmt_cidr,
    "devops": devops_cidr
  }

def _az_subnets_basic(az_cidr:str, subnets, subnet_suffix):
  return { subnet: _sub_cidr(az_cidr, subnet_suffix, i) for i, subnet in enumerate(subnets)}

def _sub_cidr(addr:str, suffix, part):
  from ipaddress import IPv4Network
  net = IPv4Network(addr)
  subnets=list(net.subnets(new_prefix=suffix))
  return str(subnets[part])


def _provider_alias(region:str ) -> str:
  return region.replace("-","_")

def _az_list(value):
  import json
  from os.path import dirname, join
  if (os.path.exists(value)):
    with open(value ) as f:
      return json.load(f)
  else:
    return json.loads(value)

def _process_args():

  parser = argparse.ArgumentParser(
    prog="cloud-config-generator",
    description="This program generated automation TF scripts for cloud accounts. Currently AWS only"
  )
  parser.add_argument(
    "--az-list",
    dest="az_list",
    type=_az_list,
    required=False,
    default=DEFAULT_AZ_LIST,
    help='JSON file name to read az mapping. Format is [ { "region1": ["region1-az-1",...],... }]'
  )
  parser.add_argument(
    "-t", "--tag",
    nargs="*",
    action=TagAction,
    metavar="KEY=VALUE",
    dest="tags",
    default = {
      "yb_owner" : "yrampuria",
      "yb_dept" : "presales",
      "yb_task" : "demo",
      "yb_customer" : "yugabyte"
    },
    help="Tags to put on provider (vpc, subnets, etc.)"
  )
  parser.add_argument(
    "--air-gapped",
    default=True,
    type=bool,
    action=argparse.BooleanOptionalAction,
    help="Setup VPC with Airgapped."
  )

  parser.add_argument(
    "--use-nat",
    dest="use_nat",
    default=False,
    type=bool,
    action=argparse.BooleanOptionalAction,
    help="Setup VPC with NAT GW"
  )

  parser.add_argument(
    "-g", "--generate",
    choices=['all','vpc', 'vpc-config', 'providers','vpc-peering', "default-az-list"],
    default='all',
    help="Generate terraform specific TF script"
  )
  parser.add_argument(
    "--vpc-module-source",
    dest="vpc_module_source",
    help="Source location for VPC module.",
    default="git::https://github.com/yogendra/terraform-modules.git//yugabyte/infra/yb-vpc-basic"
  )
  parser.add_argument(
    "--vpc-peering-module-source",
    dest="vpc_peering_module_source",
    help="Source location for VPC module.",
    default="git::https://github.com/yogendra/terraform-modules.git//yugabyte/infra/yb-vpc-peering"
  )
  parser.add_argument(
    "--project-cidr",
    dest="project_cidr",
    help="Project CIDR for this setup",
    default="10.212.0.0/16"
  )
  parser.add_argument(
    "--prefix",
    required=False,
    help="Prefix to put on the resource names. e.g. apj01",
    default="apjpoc01"
  )
  parser.add_argument(
    "--subnet-style",
    dest="subnet_style",
    choices=["basic", "advance"],
    default="basic",
    help="Type of subnet type. basic -> private and public. advance -> ingress, egress, app, db, mgmt, devops. You can customize the list with --subnets argument"
  )
  parser.add_argument(
    "--subnet",
    help="(Optional) Subnet names (multiple). Used only in basic subnet style configuration. (default: public, private)",
    nargs="*",
    action="extend"
  )
  parser.add_argument(
    "--subnet-suffix",
    dest="subnet_suffix",
    required=False,
    type=int,
    help="(Optional) Subnet suffix. Used only in basic subnet style configuration.",
    default=24
  )


  return parser.parse_args()



class TagAction(argparse.Action):
    """
    argparse action to split an argument into KEY=VALUE form
    on the first = and append to a dictionary.
    """
    def __call__(self, parser, args, values, option_string=None):
        assert(len(values) == 1)
        try:
            (k, v) = values[0].split("=", 2)
        except ValueError as ex:
            raise argparse.ArgumentError(self, f"could not parse argument \"{values[0]}\" as k=v format")
        d = getattr(args, self.dest) or {}
        d[k] = v
        setattr(args, self.dest, d)

# update with aws cli command
DEFAULT_AZ_LIST = """{
      "ap-south-1"    : ["ap-south-1a"    , "ap-south-1b"    , "ap-south-1c"      ],
      "ap-southeast-1": ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"  ],
      "ap-southeast-2": ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"  ],
      "ap-southeast-3": ["ap-southeast-3a", "ap-southeast-3b", "ap-southeast-3c"  ],
      "ap-northeast-3": ["ap-northeast-3a", "ap-northeast-3b", "ap-northeast-3c"  ],
      "ap-northeast-2": ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c", "ap-northeast-2d" ],
      "ap-northeast-1": ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"  ],
      "ca-central-1"  : ["ca-central-1a"  , "ca-central-1b"  , "ca-central-1d"    ],
      "eu-central-1"  : ["eu-central-1a"  , "eu-central-1b"  , "eu-central-1c"    ],
      "eu-north-1"    : ["eu-north-1a"    , "eu-north-1b"    , "eu-north-1c"      ],
      "eu-west-1"     : ["eu-west-1a"     , "eu-west-1b"     , "eu-west-1c"       ],
      "eu-west-2"     : ["eu-west-2a"     , "eu-west-2b"     , "eu-west-2c"       ],
      "eu-west-3"     : ["eu-west-3a"     , "eu-west-3b"     , "eu-west-3c"       ],
      "sa-east-1"     : ["sa-east-1a"     , "sa-east-1b"     , "sa-east-1c"       ],
      "us-east-1"     : ["us-east-1a"     , "us-east-1b"     , "us-east-1c"     , "us-east-1d", "us-east-1e", "us-east-1f"],
      "us-east-2"     : ["us-east-2a"     , "us-east-2b"     , "us-east-2c"       ],
      "us-west-1"     : ["us-west-1a"     , "us-west-1c"       ],
      "us-west-2"     : ["us-west-2a"     , "us-west-2b"     , "us-west-2c"     , "us-west-2d"]
    }"""
if __name__  == '__main__':
  main()
