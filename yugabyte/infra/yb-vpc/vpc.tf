
resource "aws_vpc" "vpc" {
  cidr_block       = var.config.cidrs[0]
  instance_tenancy = "default"

  tags = {
    Name = "${var.prefix}-${var.region}"
  }
}
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  # count = length(var.config.cidrs)-1
  # vpc_id     = aws_vpc.vpc.id
  # cidr_block =var.config.cidrs[count.index+1]

  for_each = toset(slice(var.config.cidrs, 1, length(var.config.cidrs)))
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.key

}
