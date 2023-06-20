
module "vpc-af-south-1" {
  count = contains(var.setup-regions, "af-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.af_south_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.af-south-1
  air-gapped = var.vpc-config.af-south-1.air-gapped
  cidrs = var.vpc-config.af-south-1.cidrs
  zones = var.vpc-config.af-south-1.zones
}

module "vpc-ap-east-1" {
  count = contains(var.setup-regions, "ap-east-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_east_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-east-1
  air-gapped = var.vpc-config.ap-east-1.air-gapped
  cidrs = var.vpc-config.ap-east-1.cidrs
  zones = var.vpc-config.ap-east-1.zones


}

module "vpc-ap-northeast-1" {
  count = contains(var.setup-regions, "ap-northeast-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_northeast_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-northeast-1
  air-gapped = var.vpc-config.ap-northeast-1.air-gapped
  cidrs = var.vpc-config.ap-northeast-1.cidrs
  zones = var.vpc-config.ap-northeast-1.zones

}

module "vpc-ap-northeast-2" {
  count = contains(var.setup-regions, "ap-northeast-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_northeast_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-northeast-2
  air-gapped = var.vpc-config.ap-northeast-2.air-gapped
  cidrs = var.vpc-config.ap-northeast-2.cidrs
  zones = var.vpc-config.ap-northeast-2.zones

}

module "vpc-ap-northeast-3" {
  count = contains(var.setup-regions, "ap-northeast-3")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_northeast_3
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-northeast-3
  air-gapped = var.vpc-config.ap-northeast-3.air-gapped
  cidrs = var.vpc-config.ap-northeast-3.cidrs
  zones = var.vpc-config.ap-northeast-3.zones

}

module "vpc-ap-south-1" {
  count = contains(var.setup-regions, "ap-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_south_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-south-1
  air-gapped = var.vpc-config.ap-south-1.air-gapped
  cidrs = var.vpc-config.ap-south-1.cidrs
  zones = var.vpc-config.ap-south-1.zones

}

module "vpc-ap-south-2" {
  count = contains(var.setup-regions, "ap-south-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_south_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-south-2
  air-gapped = var.vpc-config.ap-south-2.air-gapped
  cidrs = var.vpc-config.ap-south-2.cidrs
  zones = var.vpc-config.ap-south-2.zones

}

module "vpc-ap-southeast-1" {
  count = contains(var.setup-regions, "ap-southeast-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-southeast-1
  air-gapped = var.vpc-config.ap-southeast-1.air-gapped
  cidrs = var.vpc-config.ap-southeast-1.cidrs
  zones = var.vpc-config.ap-southeast-1.zones

}

module "vpc-ap-southeast-2" {
  count = contains(var.setup-regions, "ap-southeast-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-southeast-2
  air-gapped = var.vpc-config.ap-southeast-2.air-gapped
  cidrs = var.vpc-config.ap-southeast-2.cidrs
  zones = var.vpc-config.ap-southeast-2.zones

}

module "vpc-ap-southeast-3" {
  count = contains(var.setup-regions, "ap-southeast-3")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_3
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-southeast-3
  air-gapped = var.vpc-config.ap-southeast-3.air-gapped
  cidrs = var.vpc-config.ap-southeast-3.cidrs
  zones = var.vpc-config.ap-southeast-3.zones

}

module "vpc-ap-southeast-4" {
  count = contains(var.setup-regions, "ap-southeast-4")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_4
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ap-southeast-4
  air-gapped = var.vpc-config.ap-southeast-4.air-gapped
  cidrs = var.vpc-config.ap-southeast-4.cidrs
  zones = var.vpc-config.ap-southeast-4.zones

}

module "vpc-ca-central-1" {
  count = contains(var.setup-regions, "ca-central-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ca_central_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.ca-central-1
  air-gapped = var.vpc-config.ca-central-1.air-gapped
  cidrs = var.vpc-config.ca-central-1.cidrs
  zones = var.vpc-config.ca-central-1.zones

}

module "vpc-eu-central-1" {
  count = contains(var.setup-regions, "eu-central-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_central_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-central-1
  air-gapped = var.vpc-config.eu-central-1.air-gapped
  cidrs = var.vpc-config.eu-central-1.cidrs
  zones = var.vpc-config.eu-central-1.zones

}

module "vpc-eu-central-2" {
  count = contains(var.setup-regions, "eu-central-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_central_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu_central_2
  air-gapped = var.vpc-config.eu_central_2.air-gapped
  cidrs = var.vpc-config.eu_central_2.cidrs
  zones = var.vpc-config.eu_central_2.zones

}

module "vpc-eu-north-1" {
  count = contains(var.setup-regions, "eu-north-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_north_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-north-1
  air-gapped = var.vpc-config.eu-north-1.air-gapped
  cidrs = var.vpc-config.eu-north-1.cidrs
  zones = var.vpc-config.eu-north-1.zones

}

module "vpc-eu-south-1" {
  count = contains(var.setup-regions, "eu-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_south_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-south-1
  air-gapped = var.vpc-config.eu-south-1.air-gapped
  cidrs = var.vpc-config.eu-south-1.cidrs
  zones = var.vpc-config.eu-south-1.zones

}

module "vpc-eu-south-2" {
  count = contains(var.setup-regions, "eu-south-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_south_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-south-2
  air-gapped = var.vpc-config.eu-south-2.air-gapped
  cidrs = var.vpc-config.eu-south-2.cidrs
  zones = var.vpc-config.eu-south-2.zones

}

module "vpc-eu-west-1" {
  count = contains(var.setup-regions, "eu-west-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_west_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-west-1
  air-gapped = var.vpc-config.eu-west-1.air-gapped
  cidrs = var.vpc-config.eu-west-1.cidrs
  zones = var.vpc-config.eu-west-1.zones

}

module "vpc-eu-west-2" {
  count = contains(var.setup-regions, "ap-eu-west-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_west_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-west-2
  air-gapped = var.vpc-config.eu-west-2.air-gapped
  cidrs = var.vpc-config.eu-west-2.cidrs
  zones = var.vpc-config.eu-west-2.zones

}

module "vpc-eu-west-3" {
  count = contains(var.setup-regions, "eu-west-3")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_west_3
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-west-3
  air-gapped = var.vpc-config.eu-west-3.air-gapped
  cidrs = var.vpc-config.eu-west-3.cidrs
  zones = var.vpc-config.eu-west-3.zones

}

module "vpc-me-central-1" {
  count = contains(var.setup-regions, "me-central-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.me_central_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.me-central-1
  air-gapped = var.vpc-config.me-central-1.air-gapped
  cidrs = var.vpc-config.me-central-1.cidrs
  zones = var.vpc-config.me-central-1.zones

}

module "vpc-me-south-1" {
  count = contains(var.setup-regions, "me-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.me_south_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.me-south-1
  air-gapped = var.vpc-config.me-south-1.air-gapped
  cidrs = var.vpc-config.me-south-1.cidrs
  zones = var.vpc-config.me-south-1.zones

}

module "vpc-sa-east-1" {
  count = contains(var.setup-regions, "sa-east-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.sa_east_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.sa-east-1
  air-gapped = var.vpc-config.sa-east-1.air-gapped
  cidrs = var.vpc-config.sa-east-1.cidrs
  zones = var.vpc-config.sa-east-1.zones

}

module "vpc-us-east-1" {
  count = contains(var.setup-regions, "ap-us-east-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_east_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.us-east-1
  air-gapped = var.vpc-config.us-east-1.air-gapped
  cidrs = var.vpc-config.us-east-1.cidrs
  zones = var.vpc-config.us-east-1.zones

}

module "vpc-us-east-2" {
  count = contains(var.setup-regions, "us-east-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_east_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.us-east-2
  air-gapped = var.vpc-config.us-east-2.air-gapped
  cidrs = var.vpc-config.us-east-2.cidrs
  zones = var.vpc-config.us-east-2.zones

}

module "vpc-us-west-1" {
  count = contains(var.setup-regions, "ap-us-west-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_west_1
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.us-west-1
  air-gapped = var.vpc-config.us-west-1.air-gapped
  cidrs = var.vpc-config.us-west-1.cidrs
  zones = var.vpc-config.us-west-1.zones

}

module "vpc-us-west-2" {
  count = contains(var.setup-regions, "us-west-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_west_2
  }
  prefix = var.prefix
  tags = var.tags
  db-zone-id = var.db-zone-id
  project-cidrs =  var.project-cidrs
  mpl-lists = var.mpl-lists.eu-south-1
  air-gapped = var.vpc-config.eu-south-1.air-gapped
  cidrs = var.vpc-config.eu-south-1.cidrs
  zones = var.vpc-config.eu-south-1.zones

}

locals {
  vpc_modules = flatten([
     module.vpc-af-south-1[*],
     module.vpc-ap-east-1[*],
     module.vpc-ap-northeast-1[*],
     module.vpc-ap-northeast-2[*],
     module.vpc-ap-northeast-3[*],
     module.vpc-ap-south-1[*],
     module.vpc-ap-south-2[*],
     module.vpc-ap-southeast-1[*],
     module.vpc-ap-southeast-2[*],
     module.vpc-ap-southeast-3[*],
     module.vpc-ap-southeast-4[*],
     module.vpc-ca-central-1[*],
     module.vpc-eu-central-1[*],
     module.vpc-eu-central-2[*],
     module.vpc-eu-north-1[*],
     module.vpc-eu-south-1[*],
     module.vpc-eu-south-2[*],
     module.vpc-eu-west-1[*],
     module.vpc-eu-west-2[*],
     module.vpc-eu-west-3[*],
     module.vpc-me-central-1[*],
     module.vpc-me-south-1[*],
     module.vpc-sa-east-1[*],
     module.vpc-us-east-1[*],
     module.vpc-us-east-2[*],
     module.vpc-us-west-1[*],
     module.vpc-us-west-2[*]
  ])
  vpc-by-region = {
    for m in local.vpc_modules : m.region => m
  }
}
