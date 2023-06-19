resource "aws_key_pair" "keypair" {
  count = length(var.ssh-public-keys)
  key_name = "${var.prefix}-${count.index}"
  public_key = var.ssh-public-keys[count.index]
  tags = {
    Name = "${var.prefix}-${count.index}"
    yb_aws_service = "ec2"
    yb_resource_type = "keypair"
  }
}

