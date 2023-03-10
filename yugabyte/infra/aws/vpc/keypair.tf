resource "aws_key_pair" "keypair" {
  count = length(var.project_config.ssh-public-keys)
  key_name_prefix = "${var.project_config.prefix}-${count.index}-key"
  public_key = var.project_config.ssh-public-keys[count.index]
}
