module "this" {

  source = "../generic-box"

  arch                       = var.config.arch
  assign-public-ip           = var.config.assign-public-ip
  aws-ami                    = var.config.aws-ami
  aws-instance-profile       = var.config.aws-instance-profile
  aws-keypair-name           = var.config.aws-keypair-name
  aws-machine-type           = var.config.aws-machine-type
  aws-private-hosted-zone-id = var.config.aws-private-hosted-zone-id
  aws-public-hosted-zone-id  = var.config.aws-public-hosted-zone-id
  aws-security-group-ids     = var.config.aws-security-group-ids
  aws-subnet-id              = var.config.aws-subnet-id
  boot-commands              = local.boot-commands
  disk-count                 = var.config.disk-count
  disk-iops                  = var.config.disk-iops
  disk-size-gb               = var.config.disk-size-gb
  disk-throughput            = var.config.disk-throughput
  disk-type                  = var.config.disk-type
  files                      = local.files
  hostname                   = var.config.hostname
  name                       = var.config.cluster-name
  packages                   = local.packages
  prefix                     = var.config.prefix
  startup-commands           = local.startup-commands
  tags                       = var.config.tags

}
