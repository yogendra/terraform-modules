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
  yb-version  = split("-", var.config.yb-release)[0]
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
  })
  scripts = [
    {
      path        = "/home/yugabyte/bin/install_software.sh"
      binary      = false
      owner       = "yugabyte:yugabyte"
      permissions = "0700"
      content     = file("${path.module}/scripts/install_software.sh")
      defer       = true
      append      = false
    },
    {
      path        = "/home/yugabyte/bin/start_yugbayted.sh"
      binary      = false
      owner       = "yugabyte:yugabyte"
      permissions = "0700"
      content     = local.start-yugabyted
      defer       = true
      append      = false
    },
  ]
  files           = concat(local.scripts, var.config.files)
  yugabyted-start = "sudo -iu yugabyte /home/yugabyte/bin/start_yugbayted.sh"
  startup-commands = [
    "sudo ln -s /usr/bin/python3 /usr/bin/python",
    "sudo -iu yugabyte /home/yugabyte/bin/install_software.sh ${local.yb-version}",
    local.yugabyted-start
  ]
  boot-commands = [
    local.yugabyted-start
  ]

  packages = [
    "wget",
    "python3"
  ]

}
