variable "prefix" {
  type = string
  description = "Prefix for resources"
}

variable "user-group-name"{
  type = string
  description = "Emails of the users owning this resources"
}
variable "user-emails"{
  type = string
  description = "Emails of the users owning this resources"
}
variable "machine-type"{
  type = string
  description = "Machine type"
}
variable "zone"{
  type = string
  description = "Zone name"
}
variable "gcp-network"{
  type = string
  description = "Network Name"
}

variable "user-role" {
  type = string
  description = "Role of the user instructor or participant"
}
variable "expiry-title"{
  type = string
  description = "Title of the IAM Expiry"
}
variable "expiry-description"{
  type = string
  description ="Description of Expiry"
}
variable "expiry-expression"{
  type = string
  description = "Expiry expression"
}
variable "tags"{
  type = map(string)
  description = "Tags to put on the machines"
}

variable "sa-email"{
  type = string
  description = "Service Account Email"
}
variable "additional-role"{
  type = string
  description = "Additional roles to bind to the instance"
}
