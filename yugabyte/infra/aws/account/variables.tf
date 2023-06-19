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
