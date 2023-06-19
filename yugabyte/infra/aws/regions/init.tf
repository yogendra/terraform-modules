terraform {
  backend "s3" {
    bucket = "yb-apj-iac"
    key    = "states/apj-demo/regions.tfstate"
    region = "ap-southeast-1"
  }
}

locals {
  prefix = var.prefix
  tags = var.tags
}
