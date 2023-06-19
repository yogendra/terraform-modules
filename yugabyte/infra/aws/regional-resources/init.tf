terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


data "aws_region" "current"{}
locals {
  mpl_unsupported_regions = [ "ap-south-2", "ap-southeast-4", "eu-central-2", "eu-south-2", "me-central-1"]
  create_mpl = !contains(local.mpl_unsupported_regions, data.aws_region.current.name )
}
