variable "src_vpc_id" {
  type = string
  description = "Source VPC ID to peer"
}
variable "src_cidrs" {
  type = list(string)
  description = "Source VPC CIDRs. Optional if only source to destination routing."
  default = []
}
variable "src_route_tables"{
  type = list(string)
  description = "Source VPC Route Tables"
}
variable "dest_vpc_id" {
  type = string
  description = "Destination VPC ID"
}
variable "dest_cidrs" {
  type = list(string)
  description = "Destination VPC CIDRs"
}
variable "dest_route_tables"{
  type = list(string)
  description = "Destination VPC Route Tables. Optional if only source to destination routing."
  default = []
}
variable "dest_region" {
  type = string
  description = "Destination Region Name"
}
