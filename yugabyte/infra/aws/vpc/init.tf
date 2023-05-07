terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_region" "current" {}

locals {

  public_subnets = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.public, public = true, name = "public" }]

  private_subnets    = flatten([for zone in var.config.zones :
    [for subnet, cidr in zone.subnets :
      { az = zone.name, cidr = cidr, public = false, name = subnet } if subnet != "public"
    ]
  ])
  public_cidrs = local.public_subnets.*.cidr
  private_cidrs  = local.private_subnets.*.cidr
  project_cidrs = [var.project_config.cidr]
  region = data.aws_region.current.name
  create_endpoints = var.config.air-gapped
  create_igw =   !var.config.air-gapped
  create_nat_gw = (!var.config.air-gapped) && var.config.use-nat

  // Some regions don't support managed prefix list. meh!
  mpl_unsupported_regions = [ "ap-south-2", "ap-southeast-4", "eu-central-2", "eu-south-2", "me-central-1"]

  create_mpl = !contains(local.mpl_unsupported_regions, local.region )
  nat-instance-types-override = {
    default = ["t3.nano","t3a.nano"]
    ap-southeast-3 = ["t3.nano"]
    ap-south-2 = ["t3.nano"]
  }
}
