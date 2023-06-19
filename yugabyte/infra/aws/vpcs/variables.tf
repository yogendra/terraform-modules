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

variable "tags" {
  type = map(string)
  description = "Tags for resources"
}

variable "setup-regions" {
  type = list(string)
  description = "List of regions to setup"
}
