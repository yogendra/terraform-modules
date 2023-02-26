terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
locals {
  # subnets = {
  #   ingress = []
  #   egress  = []
  #   app     = []
  #   db      = []
  #   mgmt    = []
  #   devops  = []
  # }
  # subnets2 = flatten([
  #   for zidx, zone in var.config.zones : [
  #     for sn, cidr in zone.subnets : {
  #       name   = sn,
  #       cidr   = cidr,
  #       az     = zone.name
  #       public = "ingress" == sn
  #     }
  #   ]
  # ])

  ingress_subnets = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.ingress, public = true, name = "ingress" }]

  egress_subnets = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.egress, public = true, name = "egress" }]


  app_subnets    = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.app, public = false, name = "app" }]
  db_subnets     = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.db, public = false, name = "db" }]
  mgmt_subnets   = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.mgmt, public = false, name = "mgmt" }]
  devops_subnets = [for zone in var.config.zones : { az = zone.name, cidr = zone.subnets.devops, public = false, name = "devops" }]

  ingress_cidrs = local.ingress_subnets.*.cidr
  egress_cidrs  = local.egress_subnets.*.cidr
  app_cidrs     = local.app_subnets.*.cidr
  db_cidrs      = local.db_subnets.*.cidr
  mgmt_cidrs    = local.mgmt_subnets.*.cidr
  devops_cidrs  = local.devops_subnets.*.cidr
  vpc_cidrs     = var.config.cidrs
  project_cidrs = [var.project_cidr]
}
