variable "prefix" {
  type = string
  description = "Prefix for resources"
}
variable "air-gapped" {
  type = boolean
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

variable "env-config-location" {
  type = string
  description = "Environment config file location in the Bucket"
}
variable "tags" {
  type = map(string)
  description = "Tags for resources"
  default =  {  }
}

variable "project-cidrs" {
  type = list(string)
  description = "Project CIDRs"
}
variable "db-zone-id" {
  type = string
  description = "Route53 DB Zone ID"
}
variable "mpl-ids" {
  type = list(string)
  descdescription = "MPL ID"
}
