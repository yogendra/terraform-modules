



data "aws_instance" "portal-01" {
  instance_id = module.yba-portal-01.ec2_ids[0]
}



