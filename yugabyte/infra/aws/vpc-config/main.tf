variable "project-cidr" {
  type   = string
  default = "10.98.0.0/16"
}

variable "use-nat" {
  type   = bool
  default = true
}
variable "air-gapped" {
  type   = bool
  default = false
}
variable "subnets" {
  type   = list(string)
  default = ["public", "private"]
}

# variable "subnets-advance" {
#   type = list(object({
#     name = string
#     size = optional(number, 256)
#     public = bool
#     use-nat = optional(bool, true)
#     air-gapped = optional(bool, false)
#   }))
#   validation {
#     condition = alltrue([for size in var.subnet-advance[*].size : contains([16, 32,64,128,256,512,1024,2048,4096,8192,16384,32768], size)])
#     error_message = "Subnet size incorrect. it should be one of [16, 32,64,128,256,512,1024,2048,4096,8192,16384,32768]"
#   }
#   default = []
# }

data "external" "vpc-config-generator" {
  program = ["${path.module}/vpc-config.py"]
  query = {
    project-cidr = var.project-cidr
    air-gapped = var.air-gapped
    use-nat = var.use-nat
    subnets = jsonencode(var.subnets)
  }
}
output "config" {
  value = jsondecode(data.external.vpc-config-generator.result.config)
}
