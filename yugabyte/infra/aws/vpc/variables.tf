variable "config" {
  type = object({
    air-gapped = bool
    use-nat = bool
    cidrs = list(string),
    zones = list(object({
      name = string,
      cidr = string,
      subnets = map(string)
    }))

  })
}

variable "project_config"{
  type = object({
    prefix = string
    cidr = string
    ssh-public-keys = list(string),
    remote-ips = map(string)
  })
}
