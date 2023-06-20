terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_region" "current" {}

locals {
  well-known-mpl = lookup(var.mpl-lists, "well-known", null)
  use-mpl = local.well-known-mpl != null? true : false
  public_subnets = [for zone in var.zones : { az = zone.name, cidr = zone.subnets.public, public = true, name = "public" }]

  private_subnets    = flatten([for zone in var.zones :
    [for subnet, cidr in zone.subnets :
      { az = zone.name, cidr = cidr, public = false, name = subnet } if subnet != "public"
    ]
  ])
  public_cidrs = local.public_subnets.*.cidr
  private_cidrs  = local.private_subnets.*.cidr
  project_cidrs = var.cidrs
  region = data.aws_region.current.name
  create_igw =   !var.air-gapped
  create_endpoints = var.air-gapped
  create_nat_gw = !var.air-gapped

  // Some regions don't support managed prefix list. meh!
  nat-instance-types-override = {
    default = ["t3.nano","t3a.nano"]
    ap-southeast-3 = ["t3.nano"]
    ap-south-2 = ["t3.nano"]
  }
}
