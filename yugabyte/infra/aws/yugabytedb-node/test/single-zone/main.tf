
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  default_tags {
    tags = local.tags
  }
}
locals {
  tags = {
    yb_owner = "yrampuria"
    yb_dept  = "sales"
    yb_env   = "sandbox"
    yb_task  = "test yugabytedb-nodes single region"
  }
  yb-config = {
    "ysql_port" = "5433"
  }
  master-gflags = {
    enable_ysql = "true"
  }
  tserver-gflags = {
    ysql_enable_auth         = "false"
    pg_yb_session_timeout_ms = "1200000"
    ysql_max_connections     = "400"
  }
  yb-params = {
    ui = "true"
  }
  default_config = {
    aws-keypair-name       = "shr-0"
    aws-machine-type       = "t3.2xlarge"
    aws-security-group-ids = ["sg-0a1bc2191b4b94603"]
    aws-subnet-id          = "subnet-049ef6f8b94f9d6ee"
    cluster-name           = "yb-oss-sz"
    tags                   = local.tags
    yugabyted-parameters   = local.yb-params
    yugabyted-config       = local.yb-config
    master-gflags          = local.master-gflags
    tserver-gflags         = local.tserver-gflags
    replication-factor     = 3
    fault-tolerance        = "zone"
  }
}


module "first" {
  source = "../../"
  config = merge(local.default_config, {
    hostname = "n1"
  })
}

module "rest" {
  count  = 4
  source = "../../"
  config = merge(local.default_config, {
    hostname    = "n${count.index + 2}"
    join-master = module.first.vm-private-ip
  })
}

output "nodes" {
  value = concat([module.first], module.rest[*])
}

