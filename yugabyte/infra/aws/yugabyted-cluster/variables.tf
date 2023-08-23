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
variable "aws-public-hosted-zone-id" {
  type        = string
  description = "Public hosted zone ID"
  default     = null
}
variable "aws-private-hosted-zone-id" {
  type        = string
  description = "Private hosted zone ID"
  default     = null
}
variable "aws-instance-profile" {
  type        = string
  description = "AWS Profile"
  default     = null
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

variable "aws-machine-type" {
  type        = string
  description = "AWS Machine type"
  default     = "t3.2xlarge"
}
variable "topology" {
  type = list(
    object({
      region             = string
      nodes              = optional(number,1)
      subnet-id          = string
      security-group-ids = list(string)
      keypair-name       = string
      assign-public-ip   = optional(bool, false)
    })
  )
  description = "Topology information for the cluster, includes region, nodes count, placement info"
}
variable "release" {
  type        = string
  description = "version"
  default     = "2.19.0.0-b190"
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
