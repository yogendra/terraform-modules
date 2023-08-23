terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_region" "current" {}
variable "config" {
  type = object({
    arch                       = string
    assign-public-ip           = optional(bool, false)
    aws-ami                    = optional(string, "")
    aws-instance-profile       = optional(string, null)
    aws-keypair-name           = optional(string, null)
    aws-machine-type           = optional(string, "t3.2xlarge")
    aws-private-hosted-zone-id = optional(string, null)
    aws-public-hosted-zone-id  = optional(string, null)
    aws-security-group-ids     = list(string)
    aws-subnet-id              = string
    boot-commands              = optional(list(string), [])
    cloud-init-extras          = optional(string, "")
    disk-count                 = optional(number, 1)
    disk-size-gb               = optional(number, 10)
    files                      = optional(list(object({
      path        = string
      binary      = optional(bool, false)
      owner       = optional(string, "root:root")
      permissions = optional(string, "0644")
      encoding    = optional(string, "")
      content     = string
      defer       = optional(bool, false)
      append      = optional(bool, false)
    })), [])
    hostname                   = string
    cluster-name                       = string
    packages                   = optional(list(string), [])
    prefix                     = string
    startup-commands           = optional(list(string), [])
    tags                       = optional(map(string), {})
  })

  description = "db-node config"
}
module "node" {

  source = "../../generic-box"

  arch                       = var.config.arch
  assign-public-ip           = var.config.assign-public-ip
  aws-ami                    = var.config.aws-ami
  aws-instance-profile       = var.config.aws-instance-profile
  aws-machine-type           = var.config.aws-machine-type
  aws-keypair-name           = var.config.aws-keypair-name
  aws-private-hosted-zone-id = var.config.aws-private-hosted-zone-id
  aws-public-hosted-zone-id  = var.config.aws-public-hosted-zone-id
  aws-security-group-ids     = var.config.aws-security-group-ids
  aws-subnet-id              = var.config.aws-subnet-id
  boot-commands              = var.config.boot-commands
  cloud-init-extras          = var.config.cloud-init-extras
  disk-count                 = var.config.disk-count
  disk-size-gb               = var.config.disk-size-gb
  files                      = var.config.files
  hostname                   = var.config.hostname
  name                       = var.config.cluster-name
  prefix                     = var.config.prefix
  startup-commands           = var.config.startup-commands
  tags                       = var.config.tags
  packages                   = var.config.packages
}
output "node" {
  value = { config = var.config, node = module.node }
}