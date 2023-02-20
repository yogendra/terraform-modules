packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}
source "amazon-ebs" "centos-ybdb" {
  ami_name = "${var.ami_prefix}-${local.timestamp}"
  instance_type = "t3.small"
  region        = var.region
  source_ami = var.ami_source
  ssh_username = "cloud-user"
  ssh_agent_auth = false
  temporary_key_pair_type = "ed25519"
}

build {
  name = "${var.ami_prefix}-${local.timestamp}"
  sources = [
    "source.amazon-ebs.centos-ybdb"
  ]

  provisioner "shell" {
    inline = [
      "echo Update SSM",
      "sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm",
      "sudo systemctl enable amazon-ssm-agent",
    ]
  }
  provisioner "shell" {
    inline = [
      "echo Configure SELinux",
      "sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config",
      "sudo sudo setenforce 0",
      "echo Install packages",
      "sudo dnf install -y python3 chrony",
    ]
  }
}


variable "region" {
  type = string
  default = "ap-southeast-1"
}
variable "ami_source" {
  type = string
  default = "ami-034b54b016f6c70cd"
  // Get from https://aws.amazon.com/marketplace/server/configuration?productId=ca49f421-e5ed-4bb8-86a9-4b59878819e1&ref_=psb_cfg_continue
}

variable "ami_prefix" {
  type    = string
  default = "apj-demo-ybdb"
}
