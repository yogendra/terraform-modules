
module "vpc-eu-west-3" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.eu_west_3
  }
  prefix = "asd"
  region = "eu-west-3"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["eu-west-3"]
}
    
module "vpc-ap-east-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_east_1
  }
  prefix = "asd"
  region = "ap-east-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-east-1"]
}
    
module "vpc-sa-east-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.sa_east_1
  }
  prefix = "asd"
  region = "sa-east-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["sa-east-1"]
}
    
module "vpc-ap-northeast-3" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_northeast_3
  }
  prefix = "asd"
  region = "ap-northeast-3"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-northeast-3"]
}
    
module "vpc-us-west-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.us_west_1
  }
  prefix = "asd"
  region = "us-west-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["us-west-1"]
}
    
module "vpc-ap-south-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_south_1
  }
  prefix = "asd"
  region = "ap-south-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-south-1"]
}
    
module "vpc-eu-north-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.eu_north_1
  }
  prefix = "asd"
  region = "eu-north-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["eu-north-1"]
}
    
module "vpc-eu-south-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.eu_south_1
  }
  prefix = "asd"
  region = "eu-south-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["eu-south-1"]
}
    
module "vpc-me-south-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.me_south_1
  }
  prefix = "asd"
  region = "me-south-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["me-south-1"]
}
    
module "vpc-ap-southeast-2" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_southeast_2
  }
  prefix = "asd"
  region = "ap-southeast-2"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-southeast-2"]
}
    
module "vpc-eu-west-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.eu_west_1
  }
  prefix = "asd"
  region = "eu-west-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["eu-west-1"]
}
    
module "vpc-ap-southeast-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_southeast_1
  }
  prefix = "asd"
  region = "ap-southeast-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-southeast-1"]
}
    
module "vpc-ap-northeast-2" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_northeast_2
  }
  prefix = "asd"
  region = "ap-northeast-2"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-northeast-2"]
}
    
module "vpc-us-west-2" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.us_west_2
  }
  prefix = "asd"
  region = "us-west-2"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["us-west-2"]
}
    
module "vpc-ap-south-2" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_south_2
  }
  prefix = "asd"
  region = "ap-south-2"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-south-2"]
}
    
module "vpc-ap-southeast-3" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_southeast_3
  }
  prefix = "asd"
  region = "ap-southeast-3"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-southeast-3"]
}
    
module "vpc-ap-northeast-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ap_northeast_1
  }
  prefix = "asd"
  region = "ap-northeast-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ap-northeast-1"]
}
    
module "vpc-ca-central-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.ca_central_1
  }
  prefix = "asd"
  region = "ca-central-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["ca-central-1"]
}
    
module "vpc-us-east-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.us_east_1
  }
  prefix = "asd"
  region = "us-east-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["us-east-1"]
}
    
module "vpc-eu-central-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.eu_central_1
  }
  prefix = "asd"
  region = "eu-central-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["eu-central-1"]
}
    
module "vpc-af-south-1" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.af_south_1
  }
  prefix = "asd"
  region = "af-south-1"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["af-south-1"]
}
    
module "vpc-eu-west-2" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.eu_west_2
  }
  prefix = "asd"
  region = "eu-west-2"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["eu-west-2"]
}
    
module "vpc-us-east-2" {
  source = "../modules/yb-vpc"
  providers = {
    aws = aws.us_east_2
  }
  prefix = "asd"
  region = "us-east-2"
  project_cidr = "10.212.0.0/17"
  config = local.vpc_config["us-east-2"]
}
    
