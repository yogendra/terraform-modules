
variable "src_vpc_id" {
  type = string
  description = "Source VPC ID to peer"
}

variable "dest_vpc_id" {
  type = string
  description = "Destination VPC ID"
}

variable "prefix" {
  type = string
}
