
variable "participant" {
  type =  string
  description = "Participant email"
}
variable "participant-id" {
  type = string
  description = "Participant ID / Number (Example: 1)"
}
variable "instructors" {
  type = list(string)
  description = "Email address of instructors/facilitators"
}
variable "prefix" {
  type = string
  description = "Prefix for all resources"
}
variable "domain" {
  type = string
  description = "Domain for workshop"
}
variable expiry {
  type = string
  description = "YYY-MM-DDTHH:mm:ssZ formatted timestamp"
}

variable "gcp-vm-sa" {
  type = string
  description = "service account to use for vms"
}
variable "gcp-machine-type" {
  type = string
  description = "Machine Type"
  default = "c2-standard-8"
}
variable "gcp-primary-zone" {
  type = string
  default = "asia-southeast1-a"
  description = "Primary zone"
}
variable "gcp-network" {
  type = string
  default = "default"
  description = "Netowrk for running VMs"
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
variable "gcp-attendee-role" {
  type = string
  description = "Attendee role"
}
variable "tags"{
  type = map(string)
  default ={}
  description = "Tags for resources created"
}

variable "asset-bucket" {
  type = string
  description = "Asset bucket"
}

variable "gcp-dns-zone" {
  type = string
  description = "Hosted DNS Zone for Workshop"
}

variable "password" {
  type = string
  description = "Password"
  default = "Password#123"
}
