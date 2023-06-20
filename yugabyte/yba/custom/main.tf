variable "api" {
  type = string
  description = "API Endpoint"
}

variable "api-token" {
  type = string
  description = "API Token"
}

variable "resource" {
  type = string
  description = "Which resource - customer, user, provider, config, universe"
}

variable "operation" {
  type = string
  description = "Operation to perform"
  default = "get" # create, update, list, find
}
variable "body" {
  type = map(any)
  description = "request body. will be converted to json"
  default = null
}
variable "insecure" {
  tyep = bool
  description = "Allow insecure HTTPs"
  default = true
}

data "external" "api" {
  program = ["${path.module}/scripts/${var.resource}--${var.operation}.sh"]
  query = {
    api-token = var.api-token
    api = var.api
    body = jsonencode(var.body)
    insecure = var.insecure
  }
}

output "result"{
  value = data.external.api.result
}
