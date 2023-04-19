module "af-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.af_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-east-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_east_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-northeast-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_northeast_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-northeast-2" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_northeast_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-northeast-3" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_northeast_3
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

# module "ap-south-2" {
#   source = "./regional-work"
#   providers = {
#     aws = aws.ap_south_2
#   }
#   prefix-list-name = var.prefix-list-name
#   description = var.description
#   cidrs = var.cidrs
# }

module "ap-southeast-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-southeast-2" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "ap-southeast-3" {
  source = "./regional-work"
  providers = {
    aws = aws.ap_southeast_3
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

# module "ap-southeast-4" {
#   source = "./regional-work"
#   providers = {
#     aws = aws.ap_southeast_4
#   }
#   prefix-list-name = var.prefix-list-name
#   description = var.description
#   cidrs = var.cidrs
# }

module "ca-central-1" {
  source = "./regional-work"
  providers = {
    aws = aws.ca_central_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "eu-central-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_central_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

# module "eu-central-2" {
#   source = "./regional-work"
#   providers = {
#     aws = aws.eu_central_2
#   }
#   prefix-list-name = var.prefix-list-name
#   description = var.description
#   cidrs = var.cidrs
# }

module "eu-north-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_north_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "eu-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

# module "eu-south-2" {
#   source = "./regional-work"
#   providers = {
#     aws = aws.eu_south_2
#   }
#   prefix-list-name = var.prefix-list-name
#   description = var.description
#   cidrs = var.cidrs
# }

module "eu-west-1" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_west_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "eu-west-2" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_west_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "eu-west-3" {
  source = "./regional-work"
  providers = {
    aws = aws.eu_west_3
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

# module "me-central-1" {
#   source = "./regional-work"
#   providers = {
#     aws = aws.me_central_1
#   }
#   prefix-list-name = var.prefix-list-name
#   description = var.description
#   cidrs = var.cidrs
# }

module "me-south-1" {
  source = "./regional-work"
  providers = {
    aws = aws.me_south_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "sa-east-1" {
  source = "./regional-work"
  providers = {
    aws = aws.sa_east_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "us-east-1" {
  source = "./regional-work"
  providers = {
    aws = aws.us_east_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "us-east-2" {
  source = "./regional-work"
  providers = {
    aws = aws.us_east_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "us-west-1" {
  source = "./regional-work"
  providers = {
    aws = aws.us_west_1
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}

module "us-west-2" {
  source = "./regional-work"
  providers = {
    aws = aws.us_west_2
  }
  prefix-list-name = var.prefix-list-name
  description = var.description
  cidrs = var.cidrs
}
