resource "aws_internet_gateway" "igw" {
  count = local.create_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.project_config.prefix}-igw"
  }
}

resource "aws_eip" "nat"{
  count = local.create_nat_gw ? 1 : 0
  tags = {
    Name = "${var.project_config.prefix}-nat"
  }
}


resource "aws_nat_gateway" "nat" {
  count = local.create_nat_gw ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.project_config.prefix}-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "public-egress" {
  count = local.create_igw ? 1 : 0
  route_table_id = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw[0].id
}

resource "aws_route" "private-egress" {
  count = local.create_nat_gw ? 1 : 0
  route_table_id = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat[0].id
}


resource "aws_route" "default-egress" {
  count = local.create_nat_gw ? 1 : 0
  route_table_id = aws_default_route_table.default.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat[0].id
}
