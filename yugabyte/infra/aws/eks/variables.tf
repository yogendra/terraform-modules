variable "project-name" {
  type = string
  description = "project-name"
}
variable "cluster_service_ipv4_cidr" {
  type = string
  description = "EKS Service CIDR"
  default = "10.100.0.0/16"
}

variable "project-domain" {
  type = string
  description = "Project Domain"
  default = null
}
variable "eks-worker-type" {
  type = string
  description = "YBA Username"
  default = "m6a.2xlarge"
}
variable "project-owner" {
  type = string
  description = "project owner"
}
variable "project-owner-email" {
  type = string
  description = "project owner email"
}
variable tags {
  type = map(string)
  description = "Common tags for project resources"
  default = {
    yb_task    = "demo"
    yb_env     = "demo"

  }
}
variable "eks-version" {
  type = string
  description = "YBA Version"
  default = "1.27"
}
