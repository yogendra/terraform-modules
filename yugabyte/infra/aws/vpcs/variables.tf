variable "prefix" {
  type = string
  description = "Prefix for resources"
  default = "shr"
}

variable "tags" {
  type = map(string)
  description = "Tags for resources"
}

variable "setup-regions" {
  type = list(string)
  description = "List of regions to setup"
}
variable "mpl-lists" {
  type = map(map(string))
  description = "Managed Prefix Lists By Region"
}
variable "db-zone-id" {
  type = string
  description = "Route53 DB Zone ID"
}
variable "db-zone-name" {
  type = string
  description = "Route53 DB Zone Name"
}
variable "project-cidrs" {
  type = list(string)
  description = "Project CIDRs"
}
variable "vpc-config" {
  type = map(object({
    air-gapped = bool
    cidrs = list(string)
    zones = list(object({
      name = string,
      cidr = string,
      subnets = map(string)
    }))
  }))
}
