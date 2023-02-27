variable "prefix"{
  type = string
  description = "Resource prefix"
}
variable "key-name"{
  type = string
  description = "Public key name to use for yugaware"
}
variable "yba-db-password" {
  type        = string
  description = "YBA DB Password"
  default     = "Password#123"
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

variable "yba-replicated-password" {
  type        = string
  description = "YBA Replicated Password"
  default     = "Password#123"
}
variable "yba-instance-type" {
  type        = string
  description = "YBA Machine Size"
  default     = "t3.xlarge"
}
variable "yb-release" {
  type        = string
  description = "YugabyteDB Version (Example: 2.16.1.0-b50)"
  default     = "2.16.1.0-b50"
}
variable "internal_db_domain" {
  type        = string
  description = "Interal DNS domain for DB nodes"
  default     = "ybdb.internal"
}
variable "external_domain" {
  type        = string
  description = "External domain for app,portal, etc."
}
variable "external_domain_hosted_zone" {
  type        = string
  description = "Route53 hosted zone ID for external domain"
}
variable "yba-db-ami" {
  type        = string
  description = "YB DB VM Image (Needs python3)"
  default     = "ami-08569b978cc4dfa10"
}

variable "yba-portal-ami" {
  type        = string
  description = "YBA Portal AMI ID (needs to have docker and python)"
  // Build images/yba.pkr.hcl
  # default     = "ami-0218d5f1dc6254559" // Offline
  // Build images/ybdb.pkr.hcl
  default     = "ami-0e593c8db6f574215" // Online

}

variable "yba-db-ssh-port" {
  type        = number
  description = "YB DB VM SSH Port"
  default     = 22
}
variable "yba-db-ssh-user" {
  type        = string
  description = "YB DB VM User"
  default     = "ec2-user"
}
variable tags {
  type = map(string)
  description = "Tags for resources"
  default = {

  }
}

variable "region" {
  type = string
}
variable "az-list"{
  type = list(string)
}


variable "vpc_id"{
  type = string
  description = "VPC ID"
}
variable "yba-subnet" {
  type = string
  description = "YBA Subnet IDs"
}

variable "db-subnets"{
  type = list(string)
  description = "DB Node Subnets"
}

variable "yba-security-group" {
  type = string
  description = "YBA Security Group ID"
}

variable "db-security-group" {
  type = string
  description = "DB Security Group ID"
}

variable "yba-iam-instance-profile"{
  type = string
  description = "YBA IAM Instance Profile"
}
variable "yba-license-file" {
  type = string
  description = "YBA License File"
}
variable "yba-online-install" {
  type = bool
  default = true
  description = "YBA Online Installation"
}
