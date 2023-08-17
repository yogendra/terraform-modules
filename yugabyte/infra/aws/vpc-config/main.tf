variable "project-cidr" {
  type   = string
  default = "10.98.0.0/16"
}

data "external" "vpc-config" {
  program = ["${path.module}/vpc-config.py"]
  query = {
    project_cidr = var.project-cidr
    air_gapped = false
    use_nat = false
  }

}
output "vpc-config" {
  value = jsondecode(data.external.vpc-config.result.config)
}
# locals {

  # air-gapped = false
  # use-nat = true

  # region-index = sort(keys(local.region-zone-map))

  # region-cidrs-count = { for r in local.region-index:  r =>  ceil(length(local.region-zone-map[region]) / 4) }

  # region-zone-cidrs = {
  #   for r in local.region-index:  r => [
  #     flatten(
  #       for
  #     )
  #   ]
  # }
  # vpc-config = {
  #   for ri, region in local.zone-index : region => {
  #     air-gapped = local.air-gapped
  #     cidrs = [
  #       for i in range(local.region-cidrs-count[region]):
  #         cidrsubnet(
  #           var.project-cidr,
  #           5,
  #           ri + i
  #         )
  #     ]
  #     region = region
  #     use-nat = local.use-nat
  #     zones = [
  #       for i, z in zones: {
  #         name = z
  #         cidr = []
  #         subnets

  #       }
  #     ]

  #   }
  # }
# }
