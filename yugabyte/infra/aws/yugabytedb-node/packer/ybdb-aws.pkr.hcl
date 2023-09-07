packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "yb-version" {
  type =  string
  default = "2.19.0.0"

}

variable "ami_prefix" {
  type    = string
  default = "yugabytedb"
}

variable "arch" {
  type    = string
  default = "x86_64"
}



locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  ami_name = "${var.ami_prefix}-${var.yb-version}-${var.arch}-${local.timestamp}"
  instance_type = ("${var.arch}" == "x86_64") ? "t3.small":"t4g.small"
  regions =  [
    "af-south-1",
    "ap-east-1",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-northeast-3",
    "ap-south-1",
    "ap-south-2",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-southeast-3",
    "ap-southeast-4",
    "ca-central-1",
    "eu-central-1",
    "eu-central-2",
    "eu-north-1",
    "eu-south-1",
    "eu-south-2",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "il-central-1",
    "me-central-1",
    "me-south-1",
    "sa-east-1",
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2",
  ]
}

source "amazon-ebs" "almalinux8" {
  ami_name                = local.ami_name
  instance_type           = local.instance_type
  region                  = var.region
  force_deregister = true
  ami_regions = local.regions
  source_ami_filter {
    filters = {
        virtualization-type = "hvm"
        name = "AlmaLinux OS 8*"
        architecture = var.arch
        root-device-type = "ebs"
        is-public = true
    }
    owners = ["679593333241"]
    most_recent = true
  }

  ssh_username            = "ec2-user"
  ssh_agent_auth          = false
  temporary_key_pair_type = "ed25519"
}
build {
  name = local.ami_name
  sources = [
    "source.amazon-ebs.almalinux8"
  ]
  provisioner "shell" {
    inline = [
      "sudo yum install -y curl wget sudo python3",
      "sudo ln -s /usr/bin/python3 /usr/bin/python",
      "sudo adduser -m -c 'YugabyteDB User' yugabyte",
      "echo 'yugabyte ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers",
      "curl -sSL https://raw.githubusercontent.com/yogendra/terraform-modules/main/yugabyte/infra/aws/yugabytedb-node/scripts/install_software.sh | sudo -u yugabyte  bash -s -- ${var.yb-version}"
      ]
  }
  post-processor "manifest" {
    output = "yugabytedb-aws-${var.yb-version}-${var.arch}.json"
    custom_data = {
      "yb_owner" = "yrampuria"
      "arch"     = var.arch
      "yb_version" = var.yb-version
    }
    strip_path = true
  }
}
