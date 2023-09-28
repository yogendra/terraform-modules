module "vpc-config" {
  source = "../"
  project-cidr =  "10.8.0.0/16"
  subnets = ["pub", "pvt"]
  use-nat = true
  air-gapped = false
}
output "config" {
  value = module.vpc-config.config
}
