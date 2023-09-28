variable "name" {
  type        = string
  description = "Name"
}
variable "prefix" {
  type        = string
  description = "Prefix"
}
variable "arch" {
  type        = string
  description = "Processor"
  default     = "aarch64"
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
  default     = "t4g.small"
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
  default = null
}
variable "aws-instance-profile" {
  type        = string
  description = "AWS Instance Profile"
  default = null
}
variable "aws-ami" {
  type        = string
  description = "AWS Machine image for vm"
  default     = ""
}

variable "tailscale-up-params" {
  type = string
  description = "Parameters for tailscale up command"
  default  = ""
}
