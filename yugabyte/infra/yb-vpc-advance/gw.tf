resource "aws_internet_gateway" "igw" {
  count = var.airgapped ? 0 : 1
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.prefix}-igw"
  }
}

resource "aws_eip" "nat"{
  count = var.airgapped ? 0 : 1
}

resource "aws_nat_gateway" "nat" {
  count = var.airgapped ? 0 : 1
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.egress-subnet[0].id

  tags = {
    Name = "${var.prefix}-nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


resource "aws_route" "egress-to-igw" {
  count = var.airgapped ? 0 : 1
  route_table_id = aws_route_table.egress-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw[0].id
}

resource "aws_route" "ingress-to-nat" {
  count = var.airgapped ? 0 : 1
  route_table_id = aws_route_table.ingress-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat[0].id
}

resource "aws_route" "app-to-nat" {
  count = var.airgapped ? 0 : 1
  route_table_id = aws_route_table.app-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat[0].id
}

resource "aws_route" "db-to-nat" {
  count = var.airgapped ? 0 : 1
  route_table_id = aws_route_table.db-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat[0].id
}
resource "aws_route" "mgmt-to-nat" {
  count = var.airgapped ? 0 : 1
  route_table_id = aws_route_table.mgmt-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat[0].id
}

resource "aws_route" "devops-to-nat" {
  count = var.airgapped ? 0 : 1
  route_table_id = aws_route_table.devops-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat[0].id
}
