
module "vpc-ap-southeast-1" {
  source = "../../yb-vpc-basic"
  providers = {
    aws = aws.ap_southeast_1
  }
  project_config = local.project_config
  config         = local.vpc_config["ap-southeast-1"]

}

module "vpc-ap-southeast-2" {
  source = "../../yb-vpc-basic"
  providers = {
    aws = aws.ap_southeast_2
  }
  project_config = local.project_config
  config         = local.vpc_config["ap-southeast-2"]

}
