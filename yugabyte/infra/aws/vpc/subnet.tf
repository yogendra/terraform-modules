resource "aws_subnet" "public" {

  count                   = length(local.public_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.public_subnets[count.index].cidr
  availability_zone       = local.public_subnets[count.index].az
  map_public_ip_on_launch = local.public_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-pub-${local.public_subnets[count.index].az}"
    yb_aws_service = "vpc"
    yb_resource_type = "subnet"
    "kubernetes.io/role/elb" = 1

  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-pub"
    yb_aws_service = "vpc"
    yb_resource_type = "route_table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(local.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


resource "aws_subnet" "private" {

  count                   = length(local.private_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.private_subnets[count.index].cidr
  availability_zone       = local.private_subnets[count.index].az
  map_public_ip_on_launch = local.private_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-pvt-${local.private_subnets[count.index].az}"
    yb_aws_service = "vpc"
    yb_resource_type = "subnet"
    "kubernetes.io/role/internal-elb" = 1
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-pvt"
    yb_aws_service = "vpc"
    yb_resource_type = "route_table"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(local.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
   tags = {
    Name = "${var.prefix}-default"
    yb_aws_service = "vpc"
    yb_resource_type = "route_table"
  }
}
