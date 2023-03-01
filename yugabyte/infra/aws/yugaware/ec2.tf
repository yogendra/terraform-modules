resource "aws_instance" "yba" {
  ami                    = local.yba-ami
  instance_type          = var.yba-instance-type
  key_name               = var.key-name
  iam_instance_profile   = var.yba-iam-instance-profile
  monitoring             = true
  subnet_id              = var.yba-subnet
  vpc_security_group_ids = var.yba-security-groups
  user_data_base64       = data.cloudinit_config.yba.rendered

  root_block_device {
    volume_size = 100
  }
  tags = {
    Name = "${var.prefix}-yba"
  }
}
