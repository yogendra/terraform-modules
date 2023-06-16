variable "prefix" {
  type = string
  description = "Prefix for resources"
}
variable "name" {
  type = string
  description = "app name"
}
variable "asset-bucket" {
  type = string
  description = "Asset bucket name"
}
variable "asset-bucket-location" {
  type = string
  description = "Asset location inside the bucket"
  default = "assets"
}
variable "password" {
  type = string
  description = "Password for resources"
  default = "Password#123"
}

variable "machine-type" {
  type = string
  description = "Machine type"
  default = "t3.2xlarge"
}

variable "security-group-ids" {
  type = list(string)
  description = "Security Groups"
  default = ["default"]
}

variable "subnet-id" {
  type = string
  description = "Subnet"
}
variable "keypair-name" {
  type = string
  description = "Key pair name"
}
variable "instance-profile" {
  type = string
  description = "Instance Profile"
}
variable "tags"{
  type = map(string)
  description = "Tags to put on the machines"
  default = {}
}
variable "ami" {
  type = string
  description = "Machine image for vm"
  default = ""
}
