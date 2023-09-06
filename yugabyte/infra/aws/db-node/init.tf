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
  scripts = [
    {
      path        = "/home/yugabyte/bin/install_software.sh"
      binary      = false
      owner       = "yugabyte:yugabyte"
      permissions = "0711"
      content     = file("${path.module}/scripts/install_software.sh")
      defer       = true
      append      = false
    }
    //TODO: Add service
    //TODO: Add tserver and master flags
  ]
  files = concat(local.scripts, var.config.files)
  startup-commands = concat( var.config.startup-commands, [
    "sudo ln -s /usr/bin/python3 /usr/bin/python",
    "sudo -u yugabyte /home/yugabyte/bin/install_software.sh ${local.yb-version}"
  ])
  boot-commands = concat(var.config.boot-commands, [ ])

  packages = distinct(concat([
    "wget",
    "python3"
  ], var.config.packages))

}
