resource "aws_key_pair" "yba" {
  key_name_prefix = var.prefix
  public_key = var.public_key
  tags = var.tags
}

resource "aws_instance" "yba" {
  ami           = var.yba-portal-ami
  instance_type = var.yba-instance-type
  key_name = aws_key_pair.yba.key_name
  iam_instance_profile = var.yba-iam-instance-profile
  monitoring = true
  subnet_id = var.yba-subnet
  security_groups = [
    var.yba-security-group
  ]
  user_data_base64 = data.cloudinit_config.yba.rendered

  # root_block_device {
  #   volume_size = 200
  #   volume_type = "gp3"
  # }
  tags = {
    Name = "${var.prefix}-yba"
  }
}
