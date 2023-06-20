variable "prefix" {
  type = string
  description = "Prefix for resources"
  default = "shr"
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

variable "vpc-id" {
  type = string
  description = "Any existing VPC to associate with DNS Zone"
  default = ""
}
variable "vpc-region" {
  type = string
  description = "Any existing VPC Region to associate with DNS Zone"
  default = ""
}
