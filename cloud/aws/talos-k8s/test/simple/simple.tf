terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      yb_owner = "yrampuria"
      yb_dept = "sales"
      yb_task = "test"
    }
  }
}

module "talos" {
  source = "../../"
  prefix = "tl01"
  project-name = "Talos K8S - Test #1 Simple"
}
