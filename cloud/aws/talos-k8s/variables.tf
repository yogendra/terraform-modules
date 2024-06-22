variable "vpc_id" {
  type = string
  default = null
  description = "(Optional) VPC ID to deploy cluster into. If you don't provide one a new one is created with private and public subnets on all AZs in the region"
}
variable "security_group_id" {
  type = string
  default = null
  description = "(Optional) Security group to use for nodes and LB. Rules will be added. Required if `vpc_id` is provided. Default: null"
}
variable "vpc-cidr" {
  type = string
  description = "CIDR for VPC. Used if creating a new VPC"
  default = "10.0.0.0/16"
}

variable "workers-per-az" {
  type = number
  description = "(Optional) No. of workers per AZ. Default: 1"
  default = 1
}

variable "private-subnets" {
  type = list(string)
  description = "(Optional) Private subnets. Required if a you use existing VPC."
  default = null
}
variable "public-subnets" {
  type = list(string)
  description = "(Optional) Public subnets. Required if a you use existing VPC"
  default = null
}
variable "use-bastion" {
  type = bool
  default = true
  description = "Create and use a bastion host. Default is true. Required if machines are deployed on private subnet"
}

variable "tags" {
  type = map(string)
  description = "Tags to put on all resources"
  default  = {}
}
variable "project-name"{
  type = string
  description = "Project Name used for tagging resources"
}
variable "prefix" {
  type = string
  description = "Prefix used on all resources"
}
