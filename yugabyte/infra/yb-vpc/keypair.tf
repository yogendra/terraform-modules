resource "aws_key_pair" "keypair" {
  key_name   = "${var.prefix}-key"
  public_key = file(var.ssh_public_key)
}
