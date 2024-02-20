variable "prefix" {
  type = string
  description = "Prefix for resources"
}
variable "tags" {
  type = map(string)
  description = "Tags for resources"
  default =  {  }
}
variable "db-zone-id" {
  type = string
  description = "Route53 DB Zone ID"
}
variable "project-cidrs" {
  type = list(string)
  description = "Project CIDRs"
}
variable "mpl-lists" {
  type = map(string)
  description = "MPL ID"
}
variable "air-gapped" {
  type = bool
  description = "Air Gapped Enviroment. No NAT, No IGW, Only Private Endpoint"
}
variable "cidrs" {
  type = list(string)
  description = "CIDRs to use for this VPC"
}


variable "zones" {
  type = list(object({
    name = string,
    cidr = string,
    subnets = map(string)
  }))
  description = "Zone definition. name, cidrs and subnet to cidr map"
}

variable "nat-gw-spot-instance" {
  type = bool
  description = "NAT GW instance should be spot or not"
  default = false
}
