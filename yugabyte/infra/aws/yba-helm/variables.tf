
variable "project-name" {
  type = string
  description = "project-name"
}
variable "yba-version" {
  type = string
  description = "YBA Version"
  default = "v2.18.2"
}
variable "yba-username" {
  type = string
  description = "YBA Username"
  default = "superadmin@yugabyte.com"
}
variable "yba-password" {
  type = string
  description = "YBA Username"
  default = "Password#123"
}
variable "yba-domain" {
  type = string
  description = "YBA Domain"
  default = null
}
variable "yba-prometheus-domain" {
  type = string
  description = "YBA Prometheus Domain"
  default = null
}

variable "yugabyte_k8s_pull_secret" {
  type = string
  description = "YBA K8s Pull Secret"
  default = null
}

variable "azs" {
  type = list(string)
  description = "YBA Prometheus Domain"
}
