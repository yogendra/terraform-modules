
module "vpc-af-south-1" {
  count = contains(var.setup-regions, "af-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.af_south_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.af-south-1
}

module "vpc-ap-east-1" {
  count = contains(var.setup-regions, "ap-east-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_east_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-east-1

}

module "vpc-ap-northeast-1" {
  count = contains(var.setup-regions, "ap-northeast-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_northeast_1
  }
  prefix = local.prefix
cidrs = local.project-cidrs
remote-ips = local.remote-ips
db-zone-id = local.db-zone-id
ssh-public-keys = local.ssh-public-keys
  config = local.vpc_config.ap-northeast-1

}

module "vpc-ap-northeast-2" {
  count = contains(var.setup-regions, "ap-northeast-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_northeast_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-northeast-2

}

module "vpc-ap-northeast-3" {
  count = contains(var.setup-regions, "ap-northeast-3")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_northeast_3
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-northeast-3

}

module "vpc-ap-south-1" {
  count = contains(var.setup-regions, "ap-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_south_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-south-1

}

module "vpc-ap-south-2" {
  count = contains(var.setup-regions, "ap-south-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_south_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-south-2

}

module "vpc-ap-southeast-1" {
  count = contains(var.setup-regions, "ap-southeast-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-southeast-1

}

module "vpc-ap-southeast-2" {
  count = contains(var.setup-regions, "ap-southeast-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-southeast-2

}

module "vpc-ap-southeast-3" {
  count = contains(var.setup-regions, "ap-southeast-3")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_3
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-southeast-3

}

module "vpc-ap-southeast-4" {
  count = contains(var.setup-regions, "ap-southeast-4")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ap_southeast_4
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ap-southeast-4

}

module "vpc-ca-central-1" {
  count = contains(var.setup-regions, "ca-central-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.ca_central_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.ca-central-1

}

module "vpc-eu-central-1" {
  count = contains(var.setup-regions, "eu-central-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_central_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-central-1

}

module "vpc-eu-central-2" {
  count = contains(var.setup-regions, "eu-central-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_central_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-central-2

}

module "vpc-eu-north-1" {
  count = contains(var.setup-regions, "eu-north-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_north_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-north-1

}

module "vpc-eu-south-1" {
  count = contains(var.setup-regions, "eu-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_south_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-south-1

}

module "vpc-eu-south-2" {
  count = contains(var.setup-regions, "eu-south-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_south_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-south-2

}

module "vpc-eu-west-1" {
  count = contains(var.setup-regions, "eu-west-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_west_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-west-1

}

module "vpc-eu-west-2" {
  count = contains(var.setup-regions, "ap-eu-west-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_west_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-west-2

}

module "vpc-eu-west-3" {
  count = contains(var.setup-regions, "eu-west-3")?1:0
  source = "./vpc"
  providers = {
    aws = aws.eu_west_3
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.eu-west-3

}

module "vpc-me-central-1" {
  count = contains(var.setup-regions, "me-central-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.me_central_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.me-central-1

}

module "vpc-me-south-1" {
  count = contains(var.setup-regions, "me-south-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.me_south_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.me-south-1

}

module "vpc-sa-east-1" {
  count = contains(var.setup-regions, "sa-east-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.sa_east_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.sa-east-1

}

module "vpc-us-east-1" {
  count = contains(var.setup-regions, "ap-us-east-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_east_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.us-east-1

}

module "vpc-us-east-2" {
  count = contains(var.setup-regions, "us-east-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_east_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.us-east-2

}

module "vpc-us-west-1" {
  count = contains(var.setup-regions, "ap-us-west-1")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_west_1
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.us-west-1

}

module "vpc-us-west-2" {
  count = contains(var.setup-regions, "us-west-2")?1:0
  source = "./vpc"
  providers = {
    aws = aws.us_west_2
  }
  prefix = local.prefix
  cidrs = local.project-cidrs
  db-zone-id = local.db-zone-id
  config = local.vpc_config.us-west-2

}

locals {
  vpc_modules = compact([
     one(module.vpc-af-south-1),
     one(module.vpc-ap-east-1),
     one(module.vpc-ap-northeast-1),
     one(module.vpc-ap-northeast-2),
     one(module.vpc-ap-northeast-3),
     one(module.vpc-ap-south-1),
     one(module.vpc-ap-south-2),
     one(module.vpc-ap-southeast-1),
     one(module.vpc-ap-southeast-2),
     one(module.vpc-ap-southeast-3),
     one(module.vpc-ap-southeast-4),
     one(module.vpc-ca-central-1),
     one(module.vpc-eu-central-1),
     one(module.vpc-eu-central-2),
     one(module.vpc-eu-north-1),
     one(module.vpc-eu-south-1),
     one(module.vpc-eu-south-2),
     one(module.vpc-eu-west-1),
     one(module.vpc-eu-west-2),
     one(module.vpc-eu-west-3),
     one(module.vpc-me-central-1),
     one(module.vpc-me-south-1),
     one(module.vpc-sa-east-1),
     one(module.vpc-us-east-1),
     one(module.vpc-us-east-2),
     one(module.vpc-us-west-1),
     one(module.vpc-us-west-2)
  ])
  vpc-by-region = {
    for m in local.vpc_modules : m.region => m
  }
}
resource "aws_s3_object" "vpc-by-region" {
  bucket = data.aws_s3_bucket.state.bucket
  key    = "${var.env-config-location}/vpc-by-region.json"
  content = jsonencode(local.vpc-by-region)
  etag = "${md5(jsonencode(local.vpc-by-region))}"
  content_type = "application/json"
}
