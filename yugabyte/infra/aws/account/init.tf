terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

data "aws_region" "current" {

}
resource "aws_default_vpc" "default" {
}

locals {
  vpc-id = length(var.vpc-id) > 0 ? var.vpc-id : aws_default_vpc.default.id
  vpc-region = length(var.vpc-region) > 0 ? var.vpc-region : data.aws_region.current.name
}
