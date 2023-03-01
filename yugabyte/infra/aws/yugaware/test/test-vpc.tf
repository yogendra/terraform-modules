
module "vpc-ap-southeast-1" {
  source = "../../vpc"
  providers = {
    aws = aws.ap_southeast_1
  }
  project_config = local.project_config
  config = local.vpc_config.ap-southeast-1

}

module "vpc-ap-southeast-2" {
  source = "../../vpc"
  providers = {
    aws = aws.ap_southeast_2
  }
  project_config = local.project_config
  config = local.vpc_config.ap-southeast-2

}

locals {
  vpc_modules = [
     module.vpc-ap-southeast-1,
     module.vpc-ap-southeast-2
  ]
}

locals {
  vpc-by-region = {
    for m in local.vpc_modules : m.region => {
      allow-remote-prefix-list-id = m.allow-remote-prefix-list-id
      sg-yba = m.sg-yba
      sg-yb-db-nodes = m.sg-yb-db-nodes
      sg-ingress = m.sg-ingress
      sg-allow-remote = m.sg-allow-remote
      sg-allow-internal = m.sg-allow-internal
      sg-allow-egress = m.sg-allow-egress
      key-names = m.key-names
      private-subnet-by-az = m.private-subnet-by-az
      private-subnets = m.private-subnets
      public-subnet-by-az = m.public-subnet-by-az
      public-subnets = m.public-subnets
      vpc_id = m.vpc_id
    }
  }
}

