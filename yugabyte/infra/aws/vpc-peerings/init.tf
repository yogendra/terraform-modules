locals {
  vpcs = var.vpc-by-region
  prefix = var.prefix
  enabled = {
     af-south-1 = lookup(local.vpcs, "af-south-1", null) != null
     ap-east-1 = lookup(local.vpcs, "ap-east-1", null) != null
     ap-northeast-1 = lookup(local.vpcs, "ap-northeast-1", null) != null
     ap-northeast-2 = lookup(local.vpcs, "ap-northeast-2", null) != null
     ap-northeast-3 = lookup(local.vpcs, "ap-northeast-3", null) != null
     ap-south-1 = lookup(local.vpcs, "ap-south-1", null) != null
     ap-south-2 = lookup(local.vpcs, "ap-south-2", null) != null
     ap-southeast-1 = lookup(local.vpcs, "ap-southeast-1", null) != null
     ap-southeast-2 = lookup(local.vpcs, "ap-southeast-2", null) != null
     ap-southeast-3 = lookup(local.vpcs, "ap-southeast-3", null) != null
     ap-southeast-4 = lookup(local.vpcs, "ap-southeast-4", null) != null
     ca-central-1 = lookup(local.vpcs, "ca-central-1", null) != null
     eu-central-1 = lookup(local.vpcs, "eu-central-1", null) != null
     eu-central-2 = lookup(local.vpcs, "eu-central-2", null) != null
     eu-north-1 = lookup(local.vpcs, "eu-north-1", null) != null
     eu-south-1 = lookup(local.vpcs, "eu-south-1", null) != null
     eu-south-2 = lookup(local.vpcs, "eu-south-2", null) != null
     eu-west-1 = lookup(local.vpcs, "eu-west-1", null) != null
     eu-west-2 = lookup(local.vpcs, "eu-west-2", null) != null
     eu-west-3 = lookup(local.vpcs, "eu-west-3", null) != null
     me-central-1 = lookup(local.vpcs, "me-central-1", null) != null
     me-south-1 = lookup(local.vpcs, "me-south-1", null) != null
     sa-east-1 = lookup(local.vpcs, "sa-east-1", null) != null
     us-east-1 = lookup(local.vpcs, "us-east-1", null) != null
     us-east-2 = lookup(local.vpcs, "us-east-2", null) != null
     us-west-1 = lookup(local.vpcs, "us-west-1", null) != null
     us-west-2 = lookup(local.vpcs, "us-west-2", null) != null
  }

}
