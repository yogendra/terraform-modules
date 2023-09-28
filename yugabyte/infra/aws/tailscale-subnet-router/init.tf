terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_region" "current" {}

data "aws_subnet" "subnet" {
  id = var.config.aws-subnet-id
}


locals{
  
}
