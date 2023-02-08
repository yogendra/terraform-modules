

module "ssh-key" {
  source       = "../../modules/ssh-keypair"
  env_name     = var.env_name
  project_code = var.project_code
  zone_name    = var.zone_name
}



module "yba-portal-01" {
  source           = "../../modules/ec2"
  application_name = "yba"
  agency_name      = var.agency_name
  zone_name        = var.zone_name
  env_name         = var.env_name
  tier_name        = var.management_mgmt_private_subnet_name
  project_code     = var.project_code
  ec2_count        = 1
  ami              = var.yba-portal-ami
  instancetype     = var.yba-instancetype
  subnet_id        = module.subnets.subnet_ids_mgmt[0]
  description      = "YBA Portal - 01"
  monitoring       = true
  key_name         = module.ssh-key.key_name
  vpc_security_group_ids = [
    module.subnets.sg_mgmt
  ]
  iam_instance_profile = module.iam_roleForEc2.intance_profile_name
  user_data_base64     = data.cloudinit_config.yba.rendered
  root_block_device = [
    {
      delete_on_termination = false
      volume_size           = "100"
      volume_type           = "gp3"
    }
  ]
  depends_on = [
    aws_vpc_endpoint_route_table_association.s3-vpce-mgmt,
    aws_s3_object.replicated-package,
    aws_s3_object.yba-package
  ]
}
