terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
data "aws_region" "current" {}

locals {
  yb-version = split("-", var.config.yb-release)[0]
  ybd-join-param = length(var.config.join-masters) == 0? {} : { join = join(",",var.config.join-masters)}
  yugabyted-parameters = merge(var.config.yugabyted-parameters, local.ybd-join-param, local.ybd-config-param)


  start-yugabyted = templatefile("${path.module}/templates/start_yugbayted.sh", {
    parameters = local.parameters
    yugabyted-conf = var.config.yugabyted-config
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
      content     = local.start-yugbayted
      defer       = true
      append      = false
    },
  ]
  files = concat(local.scripts, var.config.files)
  join-nodes-csv = join(",",var.join-nodes)

  startup-commands = concat( var.config.startup-commands, [
    "sudo ln -s /usr/bin/python3 /usr/bin/python",
    "sudo -u yugabyte /home/yugabyte/bin/install_software.sh ${local.yb-version}",
    "sudo -l yugabyte /home/yugabyte/bin/start_yugbayted.sh"
  ])
  boot-commands = concat(var.config.boot-commands, [
    "sudo -l yugabyte /home/yugabyte/bin/start_yugbayted.sh"
  ])

  packages = distinct(concat([
    "wget",
    "python3"
  ], var.config.packages))

}
