terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
locals {
  subnets = flatten([
    for zidx, zone in var.config.zones : [
      for sn, cidr in zone.subnets : {
        name   = sn,
        cidr   = cidr,
        az     = zone.name
        public = "ingress" == sn
      }
    ]
  ])

  db_cidrs      = [for s in local.subnets : s.cidr if s.name == "db"]
  mgmt_cidrs    = [for s in local.subnets : s.cidr if s.name == "mgmt"]
  ingress_cidrs = [for s in local.subnets : s.cidr if s.name == "ingress"]
  app_cidrs     = [for s in local.subnets : s.cidr if s.name == "app"]
  devops_cidrs  = [for s in local.subnets : s.cidr if s.name == "ingress"]
  egress_cidrs  = [for s in local.subnets : s.cidr if s.name == "ingress"]
  vpc_cidrs     = var.config.cidrs
  project_cidrs = [var.project_cidr]
}
