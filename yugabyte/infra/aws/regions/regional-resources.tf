module "af-south-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys

  providers = {
    aws = aws.af_south_1
  }
}
module "ap-east-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_east_1
  }
}
module "ap-northeast-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_northeast_1
  }
}
module "ap-northeast-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_northeast_2
  }
}
module "ap-northeast-3" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_northeast_3
  }
}
module "ap-south-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_south_1
  }
}
module "ap-south-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_south_2
  }
}
module "ap-southeast-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_southeast_1
  }
}
module "ap-southeast-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_southeast_2
  }
}
module "ap-southeast-3" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_southeast_3
  }
}
module "ap-southeast-4" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ap_southeast_4
  }
}
module "ca-central-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.ca_central_1
  }
}
module "eu-central-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_central_1
  }
}
module "eu-central-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_central_2
  }
}
module "eu-north-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_north_1
  }
}
module "eu-south-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_south_1
  }
}
module "eu-south-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_south_2
  }
}
module "eu-west-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_west_1
  }
}
module "eu-west-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_west_2
  }
}
module "eu-west-3" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.eu_west_3
  }
}
module "me-central-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.me_central_1
  }
}
module "me-south-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.me_south_1
  }
}
module "sa-east-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.sa_east_1
  }
}
module "us-east-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.us_east_1
  }
}
module "us-east-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.us_east_2
  }
}
module "us-west-1" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.us_west_1
  }
}
module "us-west-2" {
  source = "./regional-resources"
  tags = var.tags
  prefix = var.prefix
  public-keys = var.public-keys
  providers = {
    aws = aws.us_west_2
  }
}
