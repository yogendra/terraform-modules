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
source "amazon-ebs" "centos-yba" {
  ami_name                = "${var.ami_prefix}-${local.timestamp}"
  instance_type           = "t3.small"
  region                  = var.region
  force_deregister = true
  ami_regions = [
    "ap-south-2",
    "ap-south-1",
    "eu-south-1",
    "eu-south-2",
    "me-central-1",
    "ca-central-1",
    "eu-central-1",
    "eu-central-2",
    "us-west-1",
    "us-west-2",
    "af-south-1",
    "eu-north-1",
    "eu-west-3",
    "eu-west-2",
    "eu-west-1",
    "ap-northeast-3",
    "ap-northeast-2",
    "me-south-1",
    "ap-northeast-1",
    "sa-east-1",
    "ap-east-1",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-southeast-3",
    "ap-southeast-4",
    "us-east-1",
    "us-east-2"
  ]
  source_ami              = var.ami_source
  ssh_username            = "cloud-user"
  ssh_agent_auth          = false
  temporary_key_pair_type = "ed25519"
}

build {
  name = "${var.ami_prefix}-${local.timestamp}"
  sources = [
    "source.amazon-ebs.centos-yba"
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
      "sudo dnf install -y python3 chrony"
    ]
  }
  provisioner "shell" {
    inline = [
      "echo Install Docker",
      "sudo yum install -qqy yum-utils",
      "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
      "sudo yum install -qqy docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
      "sudo systemctl enable docker"
    ]
  }
}


variable "region" {
  type    = string
  default = "ap-southeast-1"
}
variable "ami_source" {
  type    = string
  default = "ami-034b54b016f6c70cd"
  // Get from https://aws.amazon.com/marketplace/server/configuration?productId=ca49f421-e5ed-4bb8-86a9-4b59878819e1&ref_=psb_cfg_continue
}

variable "ami_prefix" {
  type    = string
  default = "apj-demo-yba"
}
