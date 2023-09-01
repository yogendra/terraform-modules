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
    disk-count                 = optional(number, 1)
    disk-size-gb               = optional(number, 10)
    disk-iops                  = optional(number, 3000)
    disk-throughput            = optional(number, 125)
    disk-type                  = optional(string, "gp3")
    hostname         = string
    cluster-name     = string
    prefix           = string
    tags             = optional(map(string), {})
    yugabyted-parameters = optional(map(string), {})
    yugabyted-config = optional(string, "")
    join-masters      = optional(list(string), [])

  })

  description = "db-node config"
}
