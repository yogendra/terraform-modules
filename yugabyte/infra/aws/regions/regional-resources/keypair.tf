resource "aws_key_pair" "keypair" {
  count = length(var.public-keys)
  key_name = "${var.prefix}-${count.index}"
  public_key = var.public-keys[count.index]
}
output "keypairs" {
  value = aws_key_pair.keypair.*.id
}
