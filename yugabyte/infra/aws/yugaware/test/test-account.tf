module "yb-account" {
  source = "../../account"
  prefix = local.project_config.prefix
  providers = {
    aws = aws.ap_southeast_1
  }
}
