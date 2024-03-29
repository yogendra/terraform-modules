variable "prefix" {
  type = string
  description = "Prefix for resources"
  default = "shr"
}
variable "tags" {
  type = map(string)
  description = "Tags for resources"
  default =  {
    yb_owner    = "yrampuria",
    yb_dept     = "presales",
    yb_task     = "demo",
    yb_customer = "yugabyte"
  }
}
variable "public-keys" {
  type = list(string)
  description = "Public keys to add as keypair"
  default = []
}

variable "well-known-cidrs" {
  type = list(string)
  description = "Well know addresses for this project"
  default = []
}
