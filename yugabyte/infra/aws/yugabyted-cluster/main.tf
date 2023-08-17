variable "name" {
  type        = string
  description = "Cluster Name"
}
variable "arch" {
  type        = string
  description = "CPU Architecture"
  default     = "x86_64"
}
variable "tags" {
  type        = map(string)
  description = "tags for resource"
  default     = {}
}
variable "rf" {
  type        = number
  description = "Replication factor"
  default     = 3
}
variable "aws-public-hosted-zone" {
  type        = string
  description = "Public hosted zone ID"
  default     = ""
}
variable "aws-instance-profile" {
  type        = string
  description = "AWS Profile"
  default     = null
}
variable "aws-private-hosted-zone" {
  type        = string
  description = "Private hosted zone ID"
  default     = ""
}
variable "disk-count" {
  type        = number
  description = "No. of Disks"
  default     = 1
}

variable "disk-size-gb" {
  type        = number
  description = "Each Data Disk Size in GB"
  default     = 10
}


variable "topology" {
  type = list(object({
    region = string
    nodes  = number
    placement = object({
      cloud  = string
      region = string
      zone   = string
    })
    subnet-id          = string
    security-group-ids = list(string)
    keypair-name       = string
    public-ip          = bool
    })
  )
  description = "Topology information for the cluster, includes region, nodes count, placement info"
}
variable "tserver-gflags" {
  type        = list(string)
  description = "Gflags for tserver"
  default = "2.19.0.0-b190"
}
variable "tserver-gflags" {
  type        = list(string)
  description = "Gflags for tserver"
  default     = []
}
variable "master-gflags" {
  type        = list(string)
  description = "Gflags for master"
  default     = []
}

locals {
  nodes = flatten([
    for it, tp in var.topology : [
      for in, n in range(tp.nodes) : tp
    ]
  ])
  node_config_map = { for idx, node in local.nodes : "${var.name}-${idx}" => node }
}
module "db" {
  for_each = local.node_config_map
  source   = "../generic-box"

  assign-public-ip             = each.value.public-ip
  aws-instance-profile         = var.aws-instance-profile
  aws-keypair-name             = each.value.keypair-name
  aws-private-hosted-zone-name = var.aws-private-hosted-zone
  aws-public-hosted-zone-name  = var.aws-public-hosted-zone
  aws-security-group-ids       = each.value.security-group-ids
  aws-subnet-id                = each.value.subnet-id
  # disk-count = var.disk-count
  # disk-size-gb = var.disk-size-gb

  boot-commands = [

  ]
  files = [

  ]
  startup-commands = [

  ]
  hostname = each.key
  name     = each.key
  packages = [

  ]
  tags = merge(
    var.tags,
    {
      yb-distribution   = "yugabyted"
      yugabyted-cluster = var.name
    }
  )
  prefix = var.name
}
