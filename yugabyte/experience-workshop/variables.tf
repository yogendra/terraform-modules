variable "prefix" {
  type = string
  description = "Workshop resource prefix. < 5 letters"
  default = "ws01"
}
variable "title" {
  type = string
  description = "Title of the workshop"
  default = "YugabyteDB Experience Workshop"
}

variable "yba-release" {
  type = string
  description = "YBA Release, example 2.18.0.1-b4"
  default = "2.18.0.1-b4"
}

variable "expiry" {
  type = string
  description = "Access Expiry. Format YYYY-MM-DDTHH:MM:SSZ. Example: 2023-06-03T00:00:00Z"
}

variable "registration-form" {
  type = string
  description = "Link to registration form"
  default = ""
}
variable "participants" {
  type = list(object({
    name = string
    email = string
    google-account = string
  }))
  description = "Participant list"
}

variable "instructors" {
  type = list(object({
    name = string
    email = string
    google-account = string
  }))
  description = "Instructor list"
}

variable "allowed-networks" {
  type = list(string)
  description = "List of Network CIDRs to allow access."
  default = []
}

variable "yba-license" {
  type = string
  description = "Path to license file. Default: $${path.root}/private/yba.lic"
  default = ""
}
variable "base-domain" {
  type = string
  description = "base domain for workshop DNS addresses"
  default = "ws.apj.yugabyte.com"
}
variable "gcp-dns-zone" {
  type = string
  description = "GCP DNS zone"
  default = "ws-apj-yugabyte-com"
}
variable "gcp-network" {
  type = string
  description = "GCP network to use for workshop"
  default = "default"
}
variable "gcp-region" {
  type = string
  description = "GCP Region"
  default = "asia-southeast1"
}

variable "default-password" {
  type = string
  default = "Password#123"
  description = "Password for various assets like YBA, Code Server, etc."

}
