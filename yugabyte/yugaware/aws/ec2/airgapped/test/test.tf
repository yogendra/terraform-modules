provider "aws" {
  region  = "ap-southeast-1"
  default_tags {
    tags = {
      yb_owner    = "yrampuria",
      yb_dept     = "presales",
      yb_task     = "demo",
      yb_customer = "yugabyte"
    }
  }
}
module "yb-singapore-vpc" {
  source ="../../../../../infra/yb-vpc"
  prefix = "yr"
  region = "ap-southeast-1"
  project_cidr = "10.212.0.0/17"
  config = {
      cidrs = [
        "10.212.46.0/24",
        "10.212.47.0/24",
        "10.212.48.0/24"
      ],
      zones = [
        {
          name = "ap-southeast-1a",
          cidr = "10.212.46.0/24",
          subnets = {
            ingress = "10.212.46.0/27",
            egress  = "10.212.46.32/27",
            app     = "10.212.46.64/26",
            db      = "10.212.46.128/26",
            mgmt    = "10.212.46.192/27",
            devops  = "10.212.46.224/27"
          }
        },
        {
          name = "ap-southeast-1b",
          cidr = "10.212.47.0/24",
          subnets = {
            ingress = "10.212.47.0/27",
            egress  = "10.212.47.32/27",
            app     = "10.212.47.64/26",
            db      = "10.212.47.128/26",
            mgmt    = "10.212.47.192/27",
            devops  = "10.212.47.224/27"
          }
        },
        {
          name = "ap-southeast-1c",
          cidr = "10.212.48.0/24",
          subnets = {
            ingress = "10.212.48.0/27",
            egress  = "10.212.48.32/27",
            app     = "10.212.48.64/26",
            db      = "10.212.48.128/26",
            mgmt    = "10.212.48.192/27",
            devops  = "10.212.48.224/27"
          }
        }
      ]
    }
}

module "yba"{
  source = "../"
  prefix = "yr"
  public_key = file("~/.ssh/id_rsa.pub")
  vpc_id = module.yb-singapore-vpc.vpc_id
  yba-subnet = module.yb-singapore-vpc.mgmt-subnets[0]
  db-subnets = module.yb-singapore-vpc.db-subnets
  yba-security-group = module.yb-singapore-vpc.sg-yba
  db-security-group = module.yb-singapore-vpc.sg-yb-db-nodes
  yba-license-file = "./private/yugaware.rli"
  region = "ap-southeast-1"
  az-list = ["ap-southeast-1a","ap-southeast-1b", "ap-southeast-1c"]
  external_domain_hosted_zone =  "Z04311021JK3VSZKS3Q9R"
  external_domain = "apj.yugabyte.com"

  yba-iam-instance-profile = "YugabyteSSMEC2InstanceProfileRole"

}
