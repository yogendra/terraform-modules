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
  project_cidrs = var.cidrs
  region = data.aws_region.current.name
  create_igw =   !var.config.air-gapped
  create_endpoints = var.config.air-gapped
  create_nat_gw = !var.config.air-gapped

  // Some regions don't support managed prefix list. meh!
  nat-instance-types-override = {
    default = ["t3.nano","t3a.nano"]
    ap-southeast-3 = ["t3.nano"]
    ap-south-2 = ["t3.nano"]
  }
}
