terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
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
  prefix = var.project_config.prefix
  region = var.config.region
  air-gapped = var.config.air-gapped
  use-nat = var.config.use-nat
  create_endpoints = local.air-gapped //|| !local.use-nat
  create_igw = !local.air-gapped
  create_nat_gw = (!local.air-gapped) && local.use-nat

  // Some regions don't support managed prefix list. meh!
  mpl_unsupported_regions = [ "ap-south-2", "ap-southeast-4", "eu-central-2", "eu-south-2", "me-central-1"]

  create_mpl = !contains(local.mpl_unsupported_regions, var.config.region )
}
