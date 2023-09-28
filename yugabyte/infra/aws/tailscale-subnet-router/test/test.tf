terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
module "ts1" {
  source                 = "../"
  name                   = "tstest"
  prefix                 = "tst"
  tailscale-up-parameter = "--authkey ${var.tskey_auth} --advertise-tags=tag:${var.tstag}  --accept-routes --hostname ${var.tshost}"
  aws-subnet-id                 = "subnet-0f80c2725cafab73b"
  aws-security-group-ids   = [""]
}

variable "tskey_auth" {
  type = string
}
variable "tstag" {
  type = string
}
variable "tshost" {
  type    = string
  default = "tf-tssr-test-01"
}
