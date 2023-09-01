variable "config" {
  type = object({
    yb-release                 = optional(string, "2.19.0.0-b190")
    arch                       = optional(string, "x86_64")
    assign-public-ip           = optional(bool, false)
    aws-ami                    = optional(string, "")
    aws-instance-profile       = optional(string, null)
    aws-keypair-name           = optional(string, null)
    aws-machine-type           = optional(string, "t3.2xlarge")
    aws-private-hosted-zone-id = optional(string, null)
    aws-public-hosted-zone-id  = optional(string, null)
    aws-security-group-ids     = list(string)
    aws-subnet-id              = string
    boot-commands              = optional(list(string), [])
    cloud-init-extras          = optional(string, "")
    disk-count                 = optional(number, 1)
    disk-size-gb               = optional(number, 10)
    disk-iops                  = optional(number, 3000)
    disk-throughput            = optional(number, 125)
    disk-type                  = optional(string, "gp3")
    files = optional(list(object({
      path        = string
      binary      = optional(bool, false)
      owner       = optional(string, "root:root")
      permissions = optional(string, "0644")
      encoding    = optional(string, "")
      content     = string
      defer       = optional(bool, false)
      append      = optional(bool, false)
    })), [])
    hostname         = string
    cluster-name     = string
    packages         = optional(list(string), [])
    prefix           = string
    startup-commands = optional(list(string), [])
    tags             = optional(map(string), {})
    master-gflags    = optional(list(string), [])
    tserver-gflags   = optional(list(string), [])
  })

  description = "db-node config"
}
