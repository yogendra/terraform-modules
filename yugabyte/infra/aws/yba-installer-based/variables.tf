variable "yba-version" {
  type = string
  description = "Full version of YBA to install. Example: 2.18.0.0-b65"
  default = "2.18.0.0-b65"
}


variable "instance-profile" {
  type = string
  description = "Instance Profile for YBA Instance"
}


variable "vpc-id" {
  type = string
  description = "Instance VPC"

}
variable "subnet-id"{
  type = string
  description = "Instance Subnet"

}
variable "keypair-name" {
  type = string
  description = "Instance Keypair"
}

variable "security-group-ids" {
  type = list(string)
  description = "Security Group IDs"
}

variable "yba-license-file" {
  type = string
  description = "Path to license file"
}
variable "owner" {
  type = string
  description = "owner of test yba"
}

variable "ami" {
  type = string
  description = "yba os ami"
  default = "ami-062550af7b9fa7d05"
}

variable "instance-type" {
  type = string
  description = "yba machine size"
  default = "m5.xlarge"
}

variable "yba-superadmin-name" {
  type        = string
  description = "YBA Super Admin Name"
  default     = "Super Admin"
}
variable "yba-superadmin-email" {
  type        = string
  description = "YBA Super Admin Email"
  default     = "superadmin@yugabyte.com"
}
variable "yba-superadmin-password" {
  type        = string
  description = "YBA Super Admin User"
  default     = "Password#123"
}

variable "yba-environment-type" {
  type        = string
  description = "YBA Environment Type (demo, dev, stage, prod)"
  default     = "demo"
  validation {
    condition     = contains(["dev", "demo", "stage", "prod"], var.yba-environment-type)
    error_message = "Allowed values for input_parameter are dev, demo, stage or prod."
  }
}

variable "tags" {
  type = map(string)
  description = "Common tags on all resources"
}


variable "prefix" {
  type = string
  description = "prefix for all resources"
}
