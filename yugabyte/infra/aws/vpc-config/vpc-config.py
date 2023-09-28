#!/usr/bin/env python3
import json
import sys

DEFAULT_PROJECT_CIDR="10.98.0.0/16"
DEFAULT_AIR_GAPPED=False
DEFAULT_USE_NAT=True
DEFAULT_SUBNETS=["public", "private"]

# Add new region to the end, otherwise Region to CIDR mapping is reordered and will case VPC / subnet deletion
DEFAULT_REGION_AZ_MAP:dict[str,list[str]] =  {
    "af-south-1": [ "af-south-1a", "af-south-1b", "af-south-1c" ] ,
    "ap-east-1": [ "ap-east-1a", "ap-east-1b", "ap-east-1c" ] ,
    "ap-northeast-1": [ "ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d" ] ,
    "ap-northeast-2": [ "ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2d" ] ,
    "ap-northeast-3": [ "ap-northeast-3a", "ap-northeast-3b", "ap-northeast-3c" ] ,
    "ap-south-1": [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ] ,
    "ap-south-2": [ "ap-south-2a", "ap-south-2b", "ap-south-2c" ] ,
    "ap-southeast-1": [ "ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c" ] ,
    "ap-southeast-2": [ "ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c" ] ,
    "ap-southeast-3": [ "ap-southeast-3a", "ap-southeast-3b", "ap-southeast-3c" ] ,
    "ap-southeast-4": [ "ap-southeast-4a", "ap-southeast-4b", "ap-southeast-4c" ] ,
    "ca-central-1": [ "ca-central-1a", "ca-central-1b", "ca-central-1d" ] ,
    "eu-central-1": [ "eu-central-1a", "eu-central-1b", "eu-central-1c" ] ,
    "eu-central-2": [ "eu-central-2a", "eu-central-2b", "eu-central-2c" ] ,
    "eu-north-1": [ "eu-north-1a", "eu-north-1b", "eu-north-1c" ] ,
    "eu-south-1": [ "eu-south-1a", "eu-south-1b", "eu-south-1c" ] ,
    "eu-south-2": [ "eu-south-2a", "eu-south-2b", "eu-south-2c" ] ,
    "eu-west-1": [ "eu-west-1a", "eu-west-1b", "eu-west-1c" ] ,
    "eu-west-2": [ "eu-west-2a", "eu-west-2b", "eu-west-2c" ] ,
    "eu-west-3": [ "eu-west-3a", "eu-west-3b", "eu-west-3c" ] ,
    "me-central-1": [ "me-central-1a", "me-central-1b", "me-central-1c" ] ,
    "me-south-1": [ "me-south-1a", "me-south-1b", "me-south-1c" ] ,
    "sa-east-1": [ "sa-east-1a", "sa-east-1b", "sa-east-1c" ] ,
    "us-east-1": [ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f" ] ,
    "us-east-2": [ "us-east-2a", "us-east-2b", "us-east-2c" ] ,
    "us-west-1": [ "us-west-1a", "us-west-1b" ] ,
    "us-west-2": [ "us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d" ],
    "il-central-1":  ["il-central-1a","il-central-1b","il-central-1c"]
}

def process_terraform():

  params = json.load(sys.stdin)
  project_cidr = params.get("project-cidr", DEFAULT_PROJECT_CIDR)
  air_gapped = params.get("air-gapped", DEFAULT_AIR_GAPPED)
  use_nat = params.get("use-nat", DEFAULT_USE_NAT)
  subnets_json = params.get("subnets", json.dumps(DEFAULT_SUBNETS))
  subnets = json.loads(subnets_json)
  vpc_config = generate(project_cidr=project_cidr, use_nat=use_nat, air_gapped=air_gapped, subnets=subnets)
  vpc_config_jsonstr = json.dumps(vpc_config)
  response = json.dumps({
    "config": vpc_config_jsonstr
  })
  sys.stdout.write(response)
  sys.stdout.flush()

def generate(
    project_cidr:str=DEFAULT_PROJECT_CIDR,
    subnets:list[str]=DEFAULT_SUBNETS,
    air_gapped:bool=DEFAULT_AIR_GAPPED,
    use_nat:bool=DEFAULT_USE_NAT,
    az_list:dict[str,list[str]]=DEFAULT_REGION_AZ_MAP):


  az_subnets = subnets
  project_suffix = int(project_cidr.split("/")[1])

  # create a vpc for each region
  vpc = {}
  region_cidr_index=0
  region_suffix = project_suffix + 5

  zone_cidr_index =0
  zone_suffix = region_suffix + 2
  subnet_suffix = zone_suffix + 1

  for region, zones in az_list.items():
    zone_cidr_index = region_cidr_index * 4
    vpc[region] = {
      "air-gapped" : air_gapped,
      "use-nat"    : use_nat,
      "cidrs" :  [],
      "zones" : [],
    }
    # region_cidr_index = region_cidr_index + 1
    import math
    for addition_zones in range(1+math.floor(len(zones) / 4)):
      vpc[region]["cidrs"].append(_sub_cidr(project_cidr, region_suffix, region_cidr_index))
      region_cidr_index = region_cidr_index + 1

    for zone in zones:
      az_cidr = _sub_cidr(project_cidr, zone_suffix, zone_cidr_index)
      az_subnets = [{ subnet: _sub_cidr(az_cidr, subnet_suffix, i) for i, subnet in enumerate(subnets)}]
      zone_cidr_index = zone_cidr_index + 1
      zone_config = {
        "name": zone,
        "cidr" : az_cidr,
        "subnets" : az_subnets
      }
      vpc[region]['zones'].append(zone_config)
  return vpc

def _sub_cidr(addr:str, suffix, part):
  from ipaddress import IPv4Network
  net = IPv4Network(addr)
  subnets=list(net.subnets(new_prefix=suffix))
  return str(subnets[part])


def main():
  if not sys.stdin.isatty():
    process_terraform()
  else:
    print(json.dumps(generate()))

if __name__ == "__main__":
  main()
