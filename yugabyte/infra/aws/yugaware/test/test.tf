
locals {
  vpcs = [
    module.vpc-ap-southeast-1,
    module.vpc-ap-southeast-2
  ]
  yb-provider = [
    for vpc in local.vpcs: {
      name = vpc.region
      sg = vpc.sg-yb-db-nodes
      zones = [
        for zone, subnets in vpc.private-subnet-by-az: {
          name = zone,
          subnet = subnets[0]
        }
      ]
    }
  ]

  aws-local = {
    name = "aws-${local.project_config.prefix}"
    air-gapped = false
    internal-hosted-zone-id = ""
    internal-hosted-domain = "",
    ssh-port = 22
    ssh-user = "ec2-user"
    regions = {
      for vpc in local.vpcs: vpc.region => {
        sg = vpc.sg-yb-db-nodes
        architecture = "x86_64"
        az-subnets = {
          for zone, subnets in vpc.private-subnet-by-az: zone => subnets[0]
        }
      }
    }
  }
}

module "yba"{
  source = "../"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix = local.project_config.prefix
  key-name = module.vpc-ap-southeast-1.key-names[0]
  yba-subnet = module.vpc-ap-southeast-1.private-subnets[0]
  yba-security-groups = [module.vpc-ap-southeast-1.sg-yba, module.vpc-ap-southeast-1.sg-allow-internal, module.vpc-ap-southeast-1.sg-allow-egress]
  yba-license-file = "./private/yugaware.rli"
  yba-iam-instance-profile = module.yb-account.yba-instance-profile
  yba-online-install = true
  
}



output "yba" {
  value = module.yba.yba
}


output "yba-info" {
  value = module.yba.yba-info
}


output "debug-env" {
  value = module.yba.debug-env
}


output "debug-tips" {
  value = module.yba.debug-tips
}

