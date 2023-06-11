variable "owner" {
  type = string
  description = "owner"
}


variable "prefix" {
  type = string
  description = "Prefix for all resources"
}


variable "domain" {
  type = string
  description = "Domain for workshop"
}
variable "participants" {
  type =  list(string)
  description = "Participant EMails"
}
variable "instructors" {
  type = list(string)
  description = "Email address of instructors/facilitators"
}

variable "license" {
  type = string
  description = "license file"
}

variable "yba-fqdn" {
  type = string
  description = "YBA FQDN"
}

variable expiry {
  type = string
  description = "YYY-MM-DDTHH:mm:ssZ formatted timestamp"
}
variable "yba-machine-type" {
  type = string
  description = "yba Machine Type"
  default = "c2-standard-4"
}

variable "yba-release" {
  type = string
  default = "2.18.0.1-b4"
  description = "YBA Version to install"
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

variable "gcp-dns-zone" {
  type = string
  description = "Hosted DNS Zone for Workshop"
}
variable "gcp-primary-zone" {
  type = string
  default = "asia-southeast1-a"
  description = "Primary zone"
}
variable "gcp-network" {
  type = string
  default = "default"
  description = "VPC Network for running VMs"
}
variable "gcp-subnet" {
  type = string
  default = "default"
  description = "Subnet for running VMs"
}
variable "gcp-region" {
  type = string
  default = "asia-southeast1"
  description = "GCP region"
}
variable "gcs-region" {
  type = string
  default = "ASIA"
  description = "Google Cloud Storage Location Region"
}
variable "tags"{
  type = map(string)
  default ={}
  description = "Tags for resources created"
}
variable "allowed-cidrs" {
  type = list(string)
  description = "Allowed netowrk CIDRs"
}

variable "gke-subnet-cidr" {
  type = string
  default = "10.127.0.0/16"
  description = "GKE Subnet CIDR"
}

variable "gke-pod-cidr" {
  type = string
  default = "192.168.64.0/22"
  description = "GKE Pod CIDR"
}

variable "gke-service-cidr" {
  type = string
  default = "192.168.1.0/24"
  description = "GKE Service CIDR"
}

