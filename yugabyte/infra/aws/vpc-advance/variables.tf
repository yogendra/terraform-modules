
variable "prefix" {
  type = string
}
variable "region" {
  type = string
}

variable "config" {
  type = object({
    cidrs = list(string),
    zones = list(object({
      name = string,
      cidr = string,
      subnets = object({
        ingress = string,
        egress = string,
        app = string,
        db = string,
        mgmt = string,
        devops = string
      })
    }))

  })
}

variable "project_cidr" {
  default = "10.212.0.0/16"
  type = string
}

variable "airgapped" {
  default = false
  type = bool
}
variable "ssh_public_keys" {
  type = list(string)
}
