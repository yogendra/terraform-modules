variable "description" {
  type = string
  description = "Description for MPL entry"
}
variable "cidrs" {
  type = list(string)
  description = "List of CIDRs to add to entry"
}

variable "prefix-list-name" {
  type = string
  description = "Name of the managed prefix list"
}
