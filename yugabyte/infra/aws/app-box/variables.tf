variable "prefix" {
  type = string
  description = "Prefix for resources"
}
variable "app-name" {
  type = string
  description = "Application Name"
}

variable "startup-commands"{
  type = list(string)
  description = "Start up commands to be executed when machine is created"
  default = [  ]
}
variable "boot-commands"{
  type = list(string)
  description = "Boot up commands to be executed when every time machine is started"
  default = [  ]
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
variable "aws-machine-type" {
  type = string
  description = "AWS Machine type"
  default = "t3.2xlarge"
}
variable "aws-security-group-ids" {
  type = list(string)
  description = "AWS Security Groups"
  default = ["default"]
}
variable "aws-hosted-zone-name" {
  type = string
  description = "AWS Hosted Zone Name"
  default = ""
}

variable "aws-subnet-id" {
  type = string
  description = "Subnet"
}
variable "aws-keypair-name" {
  type = string
  description = "Key pair name"
}
variable "aws-instance-profile" {
  type = string
  description = "AWS Instance Profile"
}

variable "aws-ami" {
  type = string
  description = "AWS Machine image for vm"
  default = ""
}
