
resource "aws_vpc" "vpc" {
  cidr_block       = var.config.cidrs[0]
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.prefix}-${local.region}"
    yb_aws_service = "vpc"
    yb_resource_type = "vpc"
  }
}
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  for_each = toset(slice(var.config.cidrs, 1, length(var.config.cidrs)))
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.key

}
