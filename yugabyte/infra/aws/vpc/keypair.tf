resource "aws_key_pair" "keypair" {
  count = length(var.project_config.ssh-public-keys)
  key_name = "${var.project_config.prefix}-${count.index}"
  public_key = var.project_config.ssh-public-keys[count.index]
  tags = {
    Name = "${var.project_config.prefix}-${count.index}"
    yb_aws_service = "ec2"
    yb_resource_type = "keypair"
  }
}

