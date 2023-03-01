
module "peer-ap-southeast-1-ap-southeast-2" {
  source = "../../vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = local.project_config.prefix
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-ap-southeast-2
  ]
}
      
