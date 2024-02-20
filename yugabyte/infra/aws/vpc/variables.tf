variable "config" {
  type = object({
    air-gapped = bool
    use-nat = bool
    cidrs = list(string),
    zones = list(object({
      name = string,
      cidr = string,
      subnets = map(string)
    }))
  })
}

variable "prefix" {
  type = string
  description = "Prefix for resources"
  default = "shr"
}

variable "state-bucket" {
  type = string
  description = "State Bucket"
  default = "yb-apj-iac"
}
variable "env-config-location" {
  type = string
  description = "Environment config file location in the Bucket"
  default = "assets/configs/apj-demo/shared"
}
variable "tags" {
  type = map(string)
  description = "Tags for resources"
  default =  {
    yb_owner = "yrampuria",
    yb_dept = "presales",
    yb_task = "demo",
    yb_customer = "yugabyte"
    yb_env      = "shr"
  }
}

variable "cidrs" {
  type = list(string)
  description = "Project CIDRs"
}
variable "remote-ips"{
  type = map(string)
  description = "Well Know Remote IPs by the owner / service name"
}
variable "ssh-public-keys" {
  type = list(string)
  description = "Public Keys to add to project"
}

variable "db-zone-id" {
  type = string
  description = "Route53 DB Zone ID"
}
variable "nat-gw-spot-instance" {
  type = bool
  description = "NAT GW instance should be spot or not"
  default = false
}
