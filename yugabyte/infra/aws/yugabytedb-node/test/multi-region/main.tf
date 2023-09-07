
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

locals {
  machine-per-region = 1
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
    cluster-name           = "yb-oss-sr"
    tags                   = local.tags
    yugabyted-parameters   = local.yb-params
    yugabyted-config       = local.yb-config
    master-gflags          = local.master-gflags
    tserver-gflags         = local.tserver-gflags
    replication-factor     = 3
    fault-tolerance        = "region"
  }
}
provider "aws" {
  region = "ap-southeast-1"
  alias = "ap_southeast_1"
  default_tags {
    tags = local.tags
  }
}

provider "aws" {
  region = "us-west-1"
  alias = "us_west_1"
  default_tags {
    tags = local.tags
  }
}


provider "aws" {
  region = "eu-west-2"
  alias = "eu_west_2"
  default_tags {
    tags = local.tags
  }
}

module "first" {
  source = "../../"
  config = merge(local.default_config, {
    hostname = "r1-n1"
    aws-security-group-ids = ["sg-0a1bc2191b4b94603"]
    aws-subnet-id          = "subnet-049ef6f8b94f9d6ee"
  })
  providers = {
    aws = aws.ap_southeast_1
  }
}
module "region1" {
  count = local.machine-per-region - 1
  source = "../../"
  config = merge(local.default_config, {
    hostname = "r1-n${count.index+2}"
    aws-security-group-ids = ["sg-0a1bc2191b4b94603"]
    aws-subnet-id          = "subnet-049ef6f8b94f9d6ee"
  })
  providers = {
    aws = aws.ap_southeast_1
  }

}
module "region2" {
  source = "../../"
  count = local.machine-per-region

  config = merge(local.default_config, {
    hostname = "r2-n${count.index+1}"
    aws-security-group-ids = ["sg-0d404eb64b830616e"]
    aws-subnet-id          = "	subnet-058766caa2ed2df95"
  })
  providers = {
    aws = aws.us_west_1
  }

}
module "region3"{
  source = "../../"
  count = local.machine-per-region
  config = merge(local.default_config, {
    hostname = "r3-n${count.index+1}"
    aws-security-group-ids = ["sg-03d815a45f23d46fa"]
    aws-subnet-id          = "subnet-04af81b6dd78548f8"
  })
  providers = {
    aws = aws.eu_west_2
  }

}
output "nodes" {
  value = concat([module.first], module.region1[*], module.region2[*],module.region3[*])
}

