resource "aws_key_pair" "keypair" {
  count = length(var.ssh_public_key)
  key_name_prefix = "${var.prefix}-${count.index}-key"
  public_key = file(var.ssh_public_keys[count.index])
}
