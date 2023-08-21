variable "prefix" {
  type        = string
  description = "Prefix for resources"
}
variable "name" {
  type        = string
  description = "Name"
}
variable "arch" {
  type        = string
  description = "Processor"
  default     = "amd64"
}
variable "packages" {
  type        = list(string)
  description = "Packaged to be installed with machine"
  default     = []
}
variable "startup-commands" {
  type        = list(string)
  description = "Start up commands to be executed when machine is created"
  default     = []
}
variable "boot-commands" {
  type        = list(string)
  description = "Boot up commands to be executed when every time machine is started"
  default     = []
}
variable "hostname" {
  type        = string
  description = "Hostname for app VM. If not given, it is generated automatically based on hosted zone, prefix and app name"
  default     = ""
}
variable "tags" {
  type        = map(string)
  description = "Tags to put on the machines"
  default     = {}
}
variable "aws-machine-type" {
  type        = string
  description = "AWS Machine type"
  default     = "t3.2xlarge"
}
variable "aws-security-group-ids" {
  type        = list(string)
  description = "AWS Security Groups"
}
variable "assign-public-ip" {
  type        = bool
  description = "Whether to assign public IP or not"
  default     = false
}

variable "aws-public-hosted-zone-id" {
  type        = string
  description = "AWS Public Hosted Zone ID"
  default     = null
}

variable "aws-private-hosted-zone-id" {
  type        = string
  description = "AWS Privated Hosted Zone ID"
  default     = null
}

variable "aws-subnet-id" {
  type        = string
  description = "Subnet"
}
variable "aws-keypair-name" {
  type        = string
  description = "Key pair name"
}
variable "aws-instance-profile" {
  type        = string
  description = "AWS Instance Profile"
  default = null
}
variable "disk-size-gb" {
  type        = number
  description = "AWS disk size in gb"
  default = 0
}
variable "disk-count" {
  type        = number
  description = "AWS disk count"
  default = 0
}
variable "files" {
  type = list(object({
    path        = string
    binary      = optional(bool, false)
    owner       = optional(string, "root:root")
    permissions = optional(string, "0644")
    encoding    = optional(string, "")
    content     = string
    defer       = optional(bool, false)
    append      = optional(bool, false)
  }))
  description = "Files (and content) to create on the app VM"
  default     = []
}

variable "aws-ami" {
  type        = string
  description = "AWS Machine image for vm"
  default     = ""
}
