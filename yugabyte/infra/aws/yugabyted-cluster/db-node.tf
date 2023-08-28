
module "db-node-af-south-1" {
  count = length(lookup(local.node-by-region, "af-south-1",[]))
  source = "./db-node"
  config = local.node-by-region["af-south-1"][count.index]
  providers = {
    aws = aws.af_south_1
  }
}
module "db-node-ap-east-1" {
  count = length(lookup(local.node-by-region, "ap-east-1",[]))
  source = "./db-node"
  config = local.node-by-region["ap-east-1"][count.index]
  providers = {
    aws = aws.ap_east_1
  }
}
module "db-node-ap-northeast-1" {
  count = length(lookup(local.node-by-region, "ap-northeast-1",[]))
  source = "./db-node"
  config = local.node-by-region["ap-northeast-1"][count.index]
  providers = {
    aws = aws.ap_northeast_1
  }
}
module "db-node-ap-northeast-2" {
  count = length(lookup(local.node-by-region, "ap-northeast-2",[]))
  source = "./db-node"
  config = local.node-by-region["ap-northeast-2"][count.index]
  providers = {
    aws = aws.ap_northeast_2
  }
}
module "db-node-ap-northeast-3" {
  count = length(lookup(local.node-by-region, "ap-northeast-3",[]))
  source = "./db-node"
  config = local.node-by-region["ap-northeast-3"][count.index]
  providers = {
    aws = aws.ap_northeast_3
  }
}
module "db-node-ap-south-1" {
  count = length(lookup(local.node-by-region, "ap-south-1",[]))
  source = "./db-node"
  config = local.node-by-region["ap-south-1"][count.index]
  providers = {
    aws = aws.ap_south_1
  }
}
module "db-node-ap-south-2" {
  count = length(lookup(local.node-by-region, "ap-south-2",[]))
  source = "./db-node"
  config = local.node-by-region["ap-south-2"][count.index]
  providers = {
    aws = aws.ap_south_2
  }
}
module "db-node-ap-southeast-1" {
  count = length(lookup(local.node-by-region, "ap-southeast-1",[]))
  source = "./db-node"
  config = local.node-by-region["ap-southeast-1"][count.index]
  providers = {
    aws = aws.ap_southeast_1
  }
}
module "db-node-ap-southeast-2" {
  count = length(lookup(local.node-by-region, "ap-southeast-2",[]))
  source = "./db-node"
  config = local.node-by-region["ap-southeast-2"][count.index]
  providers = {
    aws = aws.ap_southeast_2
  }
}
module "db-node-ap-southeast-3" {
  count = length(lookup(local.node-by-region, "ap-southeast-3",[]))
  source = "./db-node"
  config = local.node-by-region["ap-southeast-3"][count.index]
  providers = {
    aws = aws.ap_southeast_3
  }
}
# module "db-node-ap-southeast-4" {
#   count = length(lookup(local.node-by-region, "ap-southeast-4",[]))
#   source = "./db-node"
#   config = local.node-by-region["ap-southeast-4"][count.index]
#   providers = {
#     aws = aws.ap_southeast_4
#   }
# }
module "db-node-ca-central-1" {
  count = length(lookup(local.node-by-region, "ca-central-1",[]))
  source = "./db-node"
  config = local.node-by-region["ca-central-1"][count.index]
  providers = {
    aws = aws.ca_central_1
  }
}
module "db-node-eu-central-1" {
  count = length(lookup(local.node-by-region, "eu-central-1",[]))
  source = "./db-node"
  config = local.node-by-region["eu-central-1"][count.index]
  providers = {
    aws = aws.eu_central_1
  }
}
# module "db-node-eu-central-2" {
#   count = length(lookup(local.node-by-region, "eu-central-2",[]))
#   source = "./db-node"
#   config = local.node-by-region["eu-central-2"][count.index]
#   providers = {
#     aws = aws.eu_central_2
#   }
# }
module "db-node-eu-north-1" {
  count = length(lookup(local.node-by-region, "eu-north-1",[]))
  source = "./db-node"
  config = local.node-by-region["eu-north-1"][count.index]
  providers = {
    aws = aws.eu_north_1
  }
}
module "db-node-eu-south-1" {
  count = length(lookup(local.node-by-region, "eu-south-1",[]))
  source = "./db-node"
  config = local.node-by-region["eu-south-1"][count.index]
  providers = {
    aws = aws.eu_south_1
  }
}
# module "db-node-eu-south-2" {
#   count = length(lookup(local.node-by-region, "eu-south-2",[]))
#   source = "./db-node"
#   config = local.node-by-region["eu-south-2"][count.index]
#   providers = {
#     aws = aws.eu_south_2
#   }
# }
module "db-node-eu-west-1" {
  count = length(lookup(local.node-by-region, "eu-west-1",[]))
  source = "./db-node"
  config = local.node-by-region["eu-west-1"][count.index]
  providers = {
    aws = aws.eu_west_1
  }
}
module "db-node-eu-west-2" {
  count = length(lookup(local.node-by-region, "eu-west-2",[]))
  source = "./db-node"
  config = local.node-by-region["eu-west-2"][count.index]
  providers = {
    aws = aws.eu_west_2
  }
}
module "db-node-eu-west-3" {
  count = length(lookup(local.node-by-region, "eu-west-3",[]))
  source = "./db-node"
  config = local.node-by-region["eu-west-3"][count.index]
  providers = {
    aws = aws.eu_west_3
  }
}
# module "db-node-me-central-1" {
#   count = length(lookup(local.node-by-region, "me-central-1",[]))
#   source = "./db-node"
#   config = local.node-by-region["me-central-1"][count.index]
#   providers = {
#     aws = aws.me_central_1
#   }
# }
module "db-node-me-south-1" {
  count = length(lookup(local.node-by-region, "me-south-1",[]))
  source = "./db-node"
  config = local.node-by-region["me-south-1"][count.index]
  providers = {
    aws = aws.me_south_1
  }
}
module "db-node-sa-east-1" {
  count = length(lookup(local.node-by-region, "sa-east-1",[]))
  source = "./db-node"
  config = local.node-by-region["sa-east-1"][count.index]
  providers = {
    aws = aws.sa_east_1
  }
}
module "db-node-us-east-1" {
  count = length(lookup(local.node-by-region, "us-east-1",[]))
  source = "./db-node"
  config = local.node-by-region["us-east-1"][count.index]
  providers = {
    aws = aws.us_east_1
  }
}
module "db-node-us-east-2" {
  count = length(lookup(local.node-by-region, "us-east-2",[]))
  source = "./db-node"
  config = local.node-by-region["us-east-2"][count.index]
  providers = {
    aws = aws.us_east_2
  }
}
module "db-node-us-west-1" {
  count = length(lookup(local.node-by-region, "us-west-1",[]))
  source = "./db-node"
  config = local.node-by-region["us-west-1"][count.index]
  providers = {
    aws = aws.us_west_1
  }
}
module "db-node-us-west-2" {
  count = length(lookup(local.node-by-region, "us-west-2",[]))
  source = "./db-node"
  config = local.node-by-region["us-west-2"][count.index]
  providers = {
    aws = aws.us_west_2
  }
}

locals{
  db-nodes-by-region = {
    af-south-1 = module.db-node-af-south-1[*]
    ap-east-1 = module.db-node-ap-east-1[*]
    ap-northeast-1 = module.db-node-ap-northeast-1[*]
    ap-northeast-2 = module.db-node-ap-northeast-2[*]
    ap-northeast-3 = module.db-node-ap-northeast-3[*]
    ap-south-1 = module.db-node-ap-south-1[*]
    ap-south-2 = module.db-node-ap-south-2[*]
    ap-southeast-1 = module.db-node-ap-southeast-1[*]
    ap-southeast-2 = module.db-node-ap-southeast-2[*]
    ap-southeast-3 = module.db-node-ap-southeast-3[*]
    # ap-southeast-4 = module.db-node-ap-southeast-4[*]
    ca-central-1 = module.db-node-ca-central-1[*]
    eu-central-1 = module.db-node-eu-central-1[*]
    # eu-central-2 = module.db-node-eu-central-2[*]
    eu-north-1 = module.db-node-eu-north-1[*]
    eu-south-1 = module.db-node-eu-south-1[*]
    # eu-south-2 = module.db-node-eu-south-2[*]
    eu-west-1 = module.db-node-eu-west-1[*]
    eu-west-2 = module.db-node-eu-west-2[*]
    eu-west-3 = module.db-node-eu-west-3[*]
    # me-central-1 = module.db-node-me-central-1[*]
    me-south-1 = module.db-node-me-south-1[*]
    sa-east-1 = module.db-node-sa-east-1[*]
    us-east-1 = module.db-node-us-east-1[*]
    us-east-2 = module.db-node-us-east-2[*]
    us-west-1 = module.db-node-us-west-1[*]
    us-west-2 = module.db-node-us-west-2[*]
  }
  db-nodes = flatten([
    for region, module in local.db-nodes-by-region: module
  ])
}
output "db-nodes" {
  value = local.db-nodes
}
