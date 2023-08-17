module "test-vpc-config" {
  source = "../"
  project-cidr =  "10.1.0.0/16"
}
output "config" {
  value = module.test-vpc-config.vpc-config
}
