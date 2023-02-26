terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
locals {

  public_subnets = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.public, public = true, name = "public" }]

  private_subnets    = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.private, public = false, name = "private" }]

  public_cidrs = local.public_subnets.*.cidr
  private_cidrs  = local.private_subnets.*.cidr
  project_cidrs = [var.project_config.cidr]
  prefix = var.project_config.prefix
  region = var.config.region
  air-gapped = var.config.air-gapped
  use-nat = var.config.use-nat
  create_nat_gw = (!local.air-gapped) && local.use-nat
}
