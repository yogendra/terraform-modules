variable "description" {
  type = string
  description = "Description for MPL entry"
}
variable "cidrs" {
  type = list(string)
  description = "List of CIDRs to add to entry"
}

variable "prefix-list-name" {
  type = string
  description = "Name of the managed prefix list"
}


module "vpc-af-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.af_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-east-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_east_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-northeast-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_northeast_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-northeast-2" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_northeast_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-northeast-3" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_northeast_3
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-south-2" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_south_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-southeast-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-southeast-2" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-southeast-3" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_3
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ap-southeast-4" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_4
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-ca-central-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ca_central_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-central-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_central_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-central-2" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_central_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-north-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_north_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-south-2" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_south_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-west-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_west_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-west-2" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_west_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-eu-west-3" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_west_3
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-me-central-1" {
  source = "./regional-work"
  providers = {
    aws = aws.me_central_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-me-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.me_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-sa-east-1" {
  source = "./regional-work"
  providers = {
    aws = aws.sa_east_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-us-east-1" {
  source = "./regional-work"
  providers = {
    aws = aws.us_east_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-us-east-2" {
  source = "./regional-work"
  providers = {
    aws = aws.us_east_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-us-west-1" {
  source = "./regional-work"
  providers = {
    aws = aws.us_west_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "vpc-us-west-2" {
  source = "./regional-work"
  providers = {
    aws = aws.us_west_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}
