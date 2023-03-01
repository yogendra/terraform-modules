resource "aws_route53_zone" "internal-db-zone" {
  name = "${local.project_config.prefix}-ybdb.internal"
  vpc {
    vpc_id = module.vpc-ap-southeast-1.vpc_id
  }
}
locals {
  yb-provider = [
    for vpc in local.vpc_modules : {
      name = vpc.region
      sg   = vpc.sg-yb-db-nodes
      zones = [
        for zone, subnets in vpc.private-subnet-by-az : {
          name   = zone,
          subnet = subnets[0]
        }
      ]
    }
  ]

  aws-local = {
    name                    = "aws-${local.project_config.prefix}"
    air-gapped              = true
    internal-hosted-zone-id = aws_route53_zone.internal-db-zone.zone_id
    internal-hosted-domain  = "${local.project_config.prefix}-ybdb.internal",
    ssh-port                = 22
    ssh-user                = "ec2-user"
    regions = {
      for vpc in local.vpc_modules : vpc.region => {
        security-group = vpc.sg-yb-db-nodes
        architecture   = "x86_64"
        az-subnets = {
          for zone, subnets in vpc.private-subnet-by-az : zone => subnets[0]
        }
      }
    }
  }
}


module "yba" {
  source = "../"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix                   = local.project_config.prefix
  key-name                 = module.vpc-ap-southeast-1.key-names[0]
  yba-subnet               = module.vpc-ap-southeast-1.private-subnets[0]
  yba-security-groups      = [module.vpc-ap-southeast-1.sg-yba, module.vpc-ap-southeast-1.sg-allow-internal, module.vpc-ap-southeast-1.sg-allow-egress]
  yba-license-file         = "./private/yugaware.rli"
  yba-iam-instance-profile = module.yb-account.yba-instance-profile
  yba-online-install       = true
  yba-aws-providers        = [local.aws-local]

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

