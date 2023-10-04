variable "config" {
  type = object({
    yb-version                 = optional(string, "2.19.0.0")
    arch                       = optional(string, "x86_64")
    assign-public-ip           = optional(bool, false)
    aws-ami                    = optional(string, "")
    use-prebuilt               = optional(bool, false)
    aws-instance-profile       = optional(string, null)
    aws-keypair-name           = optional(string, null)
    aws-machine-type           = optional(string, "t3.2xlarge")
    aws-private-hosted-zone-id = optional(string, null)
    aws-public-hosted-zone-id  = optional(string, null)
    aws-security-group-ids     = list(string)
    aws-subnet-id              = string
    disk-size-gb               = optional(number, 10)
    disk-iops                  = optional(number, 3000)
    disk-throughput            = optional(number, 125)
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
    hostname             = string
    cluster-name         = string
    tags                 = optional(map(string), {})
    yugabyted-parameters = optional(map(string), {})
    yugabyted-config     = optional(map(string), {})
    join-master          = optional(string, null)
    replication-factor   = optional(number, 1)
    fault-tolerance      = optional(string, "zone")
    master-gflags        = optional(map(string), {})
    tserver-gflags       = optional(map(string), {})
  })

  description = "db-node config"

  validation {
    condition     = contains(["zone", "region", "cloud"], var.config.fault-tolerance)
    error_message = "Allowed values for  config.fault-tolerance are \"cloud\", \"region\", or \"zone\"."
  }
  validation {
    condition     = contains([1,3,5,7], var.config.replication-factor)
    error_message = "Allowed values for  config.replication-factor are 1, 3, 5 or 7"
  }

}
