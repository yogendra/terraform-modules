output "account-config" {
  value = module.yb-account
}
output "vpc-by-region" {
  value = local.vpc-by-region
}
output "yba-cloud-config" {
  value = local.yb-aws-cloud-provider-config
}
