terraform {
}



data "aws_region" "current"{}

data "aws_key_pair" "yba-keypair" {
  key_name           = local.key-name
  include_public_key = true
}

locals {
  prefix = var.prefix
  tags = var.tags

  # YBA EC2 Config
  vpc_id = var.vpc-id
  yba-subnet = var.subnet-id
  key-name = var.keypair-name
  yba-security-groups = var.security-group-ids
  yba-iam-instance-profile = var.instance-profile
  online_install = true
  yba-ami = var.ami
  yba-instance-type = var.instance-type


  # YBA Installer Config
  yba-version = var.yba-version
  yba-release = split("-",var.yba-version)[0]
  yba-installer-dirname  = "yba_installer_full-${local.yba-version}"
  yba-installer-package-filename  = "yba_installer_full-${local.yba-version}-linux-x86_64.tar.gz"
  yba-installer-url = "http://downloads.yugabyte.com/releases/${local.yba-release}/${local.yba-installer-package-filename}"
  yba-license = filebase64(var.yba-license-file)
}


data "aws_subnet" "yba-subnet"{
  id = local.yba-subnet
}
