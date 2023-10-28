
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

variable "yba-cloud-k8s-region" {
  type = string
  description = "YBA Cloud Provider - Kubernetes - Region"
}
variable "yba-cloud-k8s-azs" {
  type = list(string)
  description = "YBA Cloud Provider - Kubernetes - Availability Zones"
}
variable "yba-cloud-k8s-type" {
  type = string
  description = "YBA Cloud Provider - Kubernetes - type"
  default = "eks"
}
variable "yba-cloud-k8s-image-registry" {
  type = string
  description = "YBA Cloud Provider - Kubernetes - image registry"
  default = "eks"
}
variable "yba-cloud-k8s-storage-class" {
  type = string
  description = "YBA K8s Pull Secret"
  default = "gp3"
}
variable "yba-ns" {
  type = string
  description = "YBA K8s Pull Secret"
  default = "yba"
}
variable "yba-helm-values-file" {
  type = string
  description = "YBA Helm Values"
  default = null
}
