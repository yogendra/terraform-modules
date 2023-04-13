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
source "amazon-ebs" "almalinux8" {
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
  ssh_username            = "ec2-user"
  ssh_agent_auth          = false
  temporary_key_pair_type = "ed25519"
}
build {
  name = "${var.ami_prefix}-${local.timestamp}"
  sources = [
    "source.amazon-ebs.almalinux8"
  ]
}


variable "region" {
  type    = string
  default = "ap-southeast-1"
}
variable "ami_source" {
  type    = string
  default = "ami-0226c7236bc5c777b"
  // Get from https://aws.amazon.com/marketplace/server/configuration?productId=c076b20a-2305-4771-823f-944909847a05&ref_=psb_cfg_continue
}

variable "ami_prefix" {
  type    = string
  default = "apj-demo-ybdb-almalinux"
}

# af-south-1: ami-002678f6fe9e8ea0a
# ap-east-1: ami-077c4d78ebf83d196
# ap-northeast-1: ami-040c9e1e41790708c
# ap-northeast-2: ami-069d204bb76b42d03
# ap-northeast-3: ami-0e4d4b2c892e9f9d1
# ap-south-1: ami-03d6f821b77e0c449
# ap-south-2: ami-0447756b9791770ba
# ap-southeast-1: ami-0faa8a8020d12c127
# ap-southeast-2: ami-0c9bb21fe521ba086
# ap-southeast-3: ami-0beec8af740c30197
# ap-southeast-4: ami-05e83b399073c029d
# ca-central-1: ami-0d9e165a2112ad6e9
# eu-central-1: ami-09902d3ccd858622c
# eu-central-2: ami-05f886070859ac983
# eu-north-1: ami-0a642204ef581c9fc
# eu-south-1: ami-014dae4fc82ac0291
# eu-south-2: ami-03dc829216799d9b1
# eu-west-1: ami-08299b923e844323f
# eu-west-2: ami-00c5f4a8162072ddc
# eu-west-3: ami-0e09ff3411446f69a
# me-central-1: ami-0e2013f31de501e89
# me-south-1: ami-0ff17d30eff09cb45
# sa-east-1: ami-0c231ace92d8501dd
# us-east-1: ami-0722591f9b25631c8
# us-east-2: ami-08b0f1e0bb1f0e826
# us-west-1: ami-0802c5086fd31d5cf
# us-west-2: ami-08d7652293c52d668
