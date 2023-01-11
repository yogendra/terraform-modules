terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
      configuration_aliases = [ aws.src, aws.dst ]
    }
  }
}


variable vpc-mapping {
  type = map(object({
    vpc = string
  }))
}
variable tags {
  type = map(string)

}


locals {
  vpc-mapping = var.vpc-mapping
  tags = var.tags
}

module "Washington-Boston" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Washington.vpc
  dst-vpc-id = local.vpc-mapping.Boston.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Boston
   }
}

module "Washington-London" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Washington.vpc
  dst-vpc-id = local.vpc-mapping.London.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.London
   }
}

module "Washington-Mumbai" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Washington.vpc
  dst-vpc-id = local.vpc-mapping.Mumbai.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Mumbai
   }
}

module "Washington-Sydney" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Washington.vpc
  dst-vpc-id = local.vpc-mapping.Sydney.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Sydney
   }
}

module "Boston-London" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Boston.vpc
  dst-vpc-id = local.vpc-mapping.London.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.London
   }
}

module "Boston-Mumbai" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Boston.vpc
  dst-vpc-id = local.vpc-mapping.Mumbai.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Mumbai
   }
}

module "Boston-Sydney" {
  source = "../"
  src-vpc-id = local.vpc-mapping.Boston.vpc
  dst-vpc-id = local.vpc-mapping.Sydney.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Sydney
   }
}


module "London-Mumbai" {
  source = "../"
  src-vpc-id = local.vpc-mapping.London.vpc
  dst-vpc-id = local.vpc-mapping.Mumbai.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Mumbai
   }
}

module "London-Sydney" {
  source = "../"
  src-vpc-id = local.vpc-mapping.London.vpc
  dst-vpc-id = local.vpc-mapping.Sydney.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Sydney
   }
}

module "Mumbai-Sydney" {
  source = "../"
  src-vpc-id = local.vpc-mapping.London.vpc
  dst-vpc-id = local.vpc-mapping.Sydney.vpc
  providers = {
    aws.src = aws.Washington
    aws.dst = aws.Sydney
   }
}
