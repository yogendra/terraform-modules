
resource "aws_subnet" "ingress-subnet" {

  count                   = length(local.ingress_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.ingress_subnets[count.index].cidr
  availability_zone       = local.ingress_subnets[count.index].az
  map_public_ip_on_launch = local.ingress_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.ingress_subnets[count.index].name}-${local.ingress_subnets[count.index].public ? "pub" : "pvt"}-${local.ingress_subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "ingress-route-table" {
  count  = length(local.ingress_subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.ingress_subnets[count.index].name}-${local.ingress_subnets[count.index].public ? "pub" : "pvt"}-${local.ingress_subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "ingress-route-able-association" {
  count          = length(local.ingress_subnets)
  subnet_id      = aws_subnet.ingress-subnet[count.index].id
  route_table_id = aws_route_table.ingress-route-table[count.index].id
}


resource "aws_subnet" "egress-subnet" {

  count                   = length(local.egress_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.egress_subnets[count.index].cidr
  availability_zone       = local.egress_subnets[count.index].az
  map_public_ip_on_launch = local.egress_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.egress_subnets[count.index].name}-${local.egress_subnets[count.index].public ? "pub" : "pvt"}-${local.egress_subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "egress-route-table" {
  count  = length(local.egress_subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.egress_subnets[count.index].name}-${local.egress_subnets[count.index].public ? "pub" : "pvt"}-${local.egress_subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "egress-route-able-association" {
  count          = length(local.egress_subnets)
  subnet_id      = aws_subnet.egress-subnet[count.index].id
  route_table_id = aws_route_table.egress-route-table[count.index].id
}


resource "aws_subnet" "app-subnet" {

  count                   = length(local.app_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.app_subnets[count.index].cidr
  availability_zone       = local.app_subnets[count.index].az
  map_public_ip_on_launch = local.app_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.app_subnets[count.index].name}-${local.app_subnets[count.index].public ? "pub" : "pvt"}-${local.app_subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "app-route-table" {
  count  = length(local.app_subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.app_subnets[count.index].name}-${local.app_subnets[count.index].public ? "pub" : "pvt"}-${local.app_subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "app-route-able-association" {
  count          = length(local.app_subnets)
  subnet_id      = aws_subnet.app-subnet[count.index].id
  route_table_id = aws_route_table.app-route-table[count.index].id
}


resource "aws_subnet" "db-subnet" {

  count                   = length(local.db_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.db_subnets[count.index].cidr
  availability_zone       = local.db_subnets[count.index].az
  map_public_ip_on_launch = local.db_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.db_subnets[count.index].name}-${local.db_subnets[count.index].public ? "pub" : "pvt"}-${local.db_subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}


resource "aws_route_table" "db-route-table" {
  count  = length(local.db_subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.db_subnets[count.index].name}-${local.db_subnets[count.index].public ? "pub" : "pvt"}-${local.db_subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "db-route-able-association" {
  count          = length(local.db_subnets)
  subnet_id      = aws_subnet.db-subnet[count.index].id
  route_table_id = aws_route_table.db-route-table[count.index].id
}


resource "aws_subnet" "mgmt-subnet" {

  count                 = length(local.mgmt_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.mgmt_subnets[count.index].cidr
  availability_zone       = local.mgmt_subnets[count.index].az
  map_public_ip_on_launch = local.mgmt_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.mgmt_subnets[count.index].name}-${local.mgmt_subnets[count.index].public ? "pub" : "pvt"}-${local.mgmt_subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "mgmt-route-table" {
  count  = length(local.mgmt_subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.mgmt_subnets[count.index].name}-${local.mgmt_subnets[count.index].public ? "pub" : "pvt"}-${local.mgmt_subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "mgmt-route-able-association" {
  count          = length(local.mgmt_subnets)
  subnet_id      = aws_subnet.mgmt-subnet[count.index].id
  route_table_id = aws_route_table.mgmt-route-table[count.index].id
}




resource "aws_subnet" "devops-subnet" {

  count                   = length(local.devops_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.devops_subnets[count.index].cidr
  availability_zone       = local.devops_subnets[count.index].az
  map_public_ip_on_launch = local.devops_subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.devops_subnets[count.index].name}-${local.devops_subnets[count.index].public ? "pub" : "pvt"}-${local.devops_subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "devops-route-table" {
  count  = length(local.devops_subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.devops_subnets[count.index].name}-${local.devops_subnets[count.index].public ? "pub" : "pvt"}-${local.devops_subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "devops-route-able-association" {
  count          = length(local.devops_subnets)
  subnet_id      = aws_subnet.devops-subnet[count.index].id
  route_table_id = aws_route_table.devops-route-table[count.index].id
}
