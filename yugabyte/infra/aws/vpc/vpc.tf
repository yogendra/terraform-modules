
resource "aws_vpc" "vpc" {
  cidr_block       = var.config.cidrs[0]
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_config.prefix}-${local.region}"
  }
}
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  for_each = toset(slice(var.config.cidrs, 1, length(var.config.cidrs)))
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.key

}
