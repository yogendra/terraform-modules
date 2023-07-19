variable "prefix" {
  type = string
  description = "Prefix for resources"
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
variable "hostname" {
  type = string
  description = "Hostname for app VM. If not given, it is generated automatically based on hosted zone, prefix and app name"
  default = ""
}

variable "tags"{
  type = map(string)
  description = "Tags to put on the machines"
  default = {}
}
variable "aws-asset-bucket" {
  type = string
  description = "Asset bucket name"
}
variable "aws-machine-type" {
  type = string
  description = "AWS Machine type. Optional, t3.2xlarge is used by default"
  default = "t3.2xlarge"
}
variable "aws-security-group-ids" {
  type = list(string)
  description = "AWs Security Groups"
  default = ["default"]
}
variable "aws-hosted-zone-name" {
  type = string
  description = "AWS Hosted Zone Name. Optional. If specified, an A record will be created in the hosted zone"
  default = ""
}

variable "aws-subnet-id" {
  type = string
  description = "AWS Subnet"
}
variable "aws-keypair-name" {
  type = string
  description = "AWS Key pair name"
}
variable "aws-instance-profile" {
  type = string
  description = "AWS Instance Profile"
}
variable "aws-ami" {
  type = string
  description = "AWS Machine image for vm. Optional, uses Ubuntu jammy latest image, if not specified"
  default = ""
}

variable "files"{
  type = list(object({
    path = string
    binary = optional(bool, false)
    owner = optional(string, "root:root")
    permissions = optional(string, "0644")
    encoding = optional(string,"")
    content = string
    defer = optional(bool, false)
    append = optional(bool, false)
  }))
  description = "Files (and content) to create on the app VM"
  default = []
}

