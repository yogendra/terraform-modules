variable "prefix" {
  type = string
  description = "Project Prefix"
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

variable "vpc-by-region" {
  type = map(object({
    vpc-id = string
    region = string
    route-tables = list(string)
    vpc-cidrs = list(string)
  }))
  description = "VPC by Region Mapping"
}
