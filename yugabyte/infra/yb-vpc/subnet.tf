
locals {
  subnets = flatten([
    for zidx, zone in var.config.zones : [
      for sn, cidr in zone.subnets : {
        name   = sn,
        cidr   = cidr,
        az     = zone.name
        public = "ingress" == sn
      }
    ]
  ])
}


resource "aws_subnet" "subnet" {

  count                   = length(local.subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.subnets[count.index].cidr
  availability_zone       = local.subnets[count.index].az
  map_public_ip_on_launch = local.subnets[count.index].public

  tags = {
    Name = "${var.prefix}-${local.subnets[count.index].name}-${local.subnets[count.index].public ? "pub" : "pvt"}-${local.subnets[count.index].az}"
  }
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.secondary_cidr
  ]
}

resource "aws_route_table" "route-table" {
  count  = length(local.subnets)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-${local.subnets[count.index].name}-${local.subnets[count.index].public ? "pub" : "pvt"}-${local.subnets[count.index].az}"
  }
}

resource "aws_route_table_association" "route-able-association" {
  count          = length(local.subnets)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.route-table[count.index].id
}

