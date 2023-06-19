variable "prefix" {
  type = string
  description = "Prefix for resources"
}
variable "machine-type" {
  type = string
  description = "Machine type"
  default = "c2-standard-4"
}

variable "subnet-id" {
  type = string
  description = "Subnet"
}

variable "tags"{
  type = map(string)
  description = "Tags to put on the machines"
  default = {}
}
variable "gcp-zone" {
  type = string
  description = "GCP Zone"
}
variable "gcp-subnet" {
  type = string
  description = "GCP Subnet"
}
variable "startup-commands"{
  type = list(string)
  description = "Start up commands to be executed when machine is created"
  default = [  ]
}
variable "boot-commands"{
  type = list(string)
  description = "Boot up commands to be executed when every time machine is started"
  default = [  ]
}
