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
  default     = "2.17.1.0-b439"
}
variable "ybdb-ami" {
  type        = string
  description = "YB DB VM Image (Needs python3)"
  default = ""
}

variable "yba-ami" {
  type        = string
  description = "YBA Portal AMI ID (needs to have docker and python)"
  default = ""

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
variable "yba-tls-cert-pem" {
  type = string
  default = ""
}
variable "yba-tls-key-pem" {
  type = string
  default = ""
}
variable "local-provider-name"{
  type = string
  default = "local-aws"
}

variable "yba-subnet" {
  type = string
  description = "YBA Subnet IDs"
}

variable "yba-security-groups" {
  type = list(string)
  description = "YBA Security Group ID"
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

variable "yba-aws-providers" {
  type = list(
    object(
      {
        name = string
        air-gapped = bool
        internal-hosted-zone-id = string
        internal-hosted-domain = string
        ssh-port = number
        ssh-user = string
        regions = map(
          object(
            {
              security-group = string
              architecture = string
              vpc_id = string
              az-subnets = map(string)
            }
          )
        )
      }
    )
  )
  default = []
}
