terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_region" "current" {}

data "aws_subnet" "subnet" {
  id = var.config.aws-subnet-id
}


locals {
  use-prebuilt = var.config.aws-ami == ""
  aws-ami = local.use-prebuilt? local.pre-built-amis[var.config.yb-version][var.config.arch][data.aws_region.current.name]:""

  join-master = var.config.join-master == null ? "" : var.config.join-master

  ybd-join-param       = var.config.join-master == null ? {} : { join = var.config.join-master }
  ydb-cloud-location   = { cloud_location = "aws.${data.aws_region.current.name}.${data.aws_subnet.subnet.availability_zone}" }
  yugabyted-parameters = merge(local.ybd-join-param, local.ydb-cloud-location, var.config.yugabyted-parameters)

  start-yugabyted = templatefile("${path.module}/templates/start_yugabyted.sh", {
    parameters     = local.yugabyted-parameters
    yugabyted-conf = var.config.yugabyted-config
    master-gflags  = var.config.master-gflags
    tserver-gflags = var.config.tserver-gflags
    join-master    = local.join-master
    replication-factor = var.config.replication-factor
    fault-tolerance = var.config.fault-tolerance
  })

  install-script =  {
    path        = "/home/yugabyte/bin/install_software.sh"
    binary      = false
    owner       = "yugabyte:yugabyte"
    permissions = "0700"
    content     = file("${path.module}/scripts/install_software.sh")
    defer       = true
    append      = false
  }

  start-script = {
    path        = "/home/yugabyte/bin/start_yugbayted.sh"
    binary      = false
    owner       = "yugabyte:yugabyte"
    permissions = "0700"
    content     = local.start-yugabyted
    defer       = true
    append      = false
  }

  files           = concat(local.scripts, var.config.files)
  yugabyted-start = "sudo -iu yugabyte /home/yugabyte/bin/start_yugbayted.sh"

  prebuild-startup-commands = [
    "chown -R yugabyte:yugabyte /home/yugabyte/data",
    "chmod 700 /home/yugabyte/data",
    local.yugabyted-start
  ]
  custom-startup-comamnds = concat([
    "sudo ln -s /usr/bin/python3 /usr/bin/python",
    "sudo -iu yugabyte /home/yugabyte/bin/install_software.sh ${var.config.yb-version}",
  ], local.prebuild-startup-commands )

  startup-commands = local.use-prebuilt? local.prebuild-startup-commands : local.custom-startup-comamnds
  boot-commands = [
    local.yugabyted-start
  ]

  scripts = local.use-prebuilt ? [ local.start-script] : [local.install-script, local.start-script]
  packages = local.use-prebuilt ? [] :  [
    "wget",
    "python3"
  ]

}
