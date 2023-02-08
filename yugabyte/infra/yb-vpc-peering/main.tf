



data "aws_vpc" "src" {
  id = var.src_vpc_id
}
data "aws_vpc" "dest" {
  id = var.dest_vpc_id
}


# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = data.aws_vpc.src.id
  peer_vpc_id = data.aws_vpc.dest.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Side = "Requester"
  }
  provider = aws.src
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
  provider                  = aws.dest

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = {
    Side = "Accepter"
  }
}

data "aws_subnets" "src" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.src.id]
  }
}
data "aws_subnet" "src" {
  for_each = toset(data.aws_subnets.src.ids)
  id       = each.value
}

data "aws_route_table" "src_route_table" {
  count = length(data.aws_subnets.src.ids)
  subnet_id    = data.aws_subnets.src.ids[count.index]
}
data "aws_subnets" "dest" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.dest.id]
  }
}
data "aws_subnet" "dest" {
  for_each = toset(data.aws_subnets.dest.ids)
  id       = each.value
}

data "aws_route_table" "dest_route_table" {
  count = length(data.aws_subnets.dest.ids)
  subnet_id    = data.aws_subnets.dest.ids[count.index]
}
# Option 1:
# Source Subnet -> Source CIDR, Source Route Tables
# Dest Subenect -> Dest CIDR, Dest Route Table
# Source Route Table -> each(Dest CIDR routes peer connection id)
# Dest Route Table -> each (Source CIDR routes through peer connection id)

# local {
#     src_cidrs = data.aws_subnect.src_subnet.*.cidr_block
#     dest_cidrs = data.aws_subnect.dest_subnet.*.cidr_block
# }

# Option 2 : Get CIDR from the VPC
locals {
  src_cidrs  = concat([data.aws_vpc.src.cidr_block], data.aws_vpc.src.cidr_block_associations.*.cidr_block)
  dest_cidrs = concat([data.aws_vpc.src.cidr_block], data.aws_vpc.src.cidr_block_associations.*.cidr_block)
}

locals {
  src_rtbl_ids  = data.aws_route_table.src_route_table.*.id
  dest_rtbl_ids = data.aws_route_table.dest_route_table.*.id

  src_routes = distinct(
    flatten(
      [
        for tidx, tbl in local.src_rtbl_ids : [
          for cidx, cidr in local.dest_cidrs : {
            tbl  = tbl
            cidr = cidr
          }
        ]
      ]
    )
  )
  dest_routes = distinct(
    flatten(
      [
        for tidx, tbl in local.dest_rtbl_ids : [
          for cidx, cidr in local.src_cidrs : {
            tbl  = tbl
            cidr = cidr
          }
        ]
      ]
    )
  )

}


resource "aws_route" "source_to_dest" {
  count                     = length(local.src_routes)
  route_table_id            = local.src_routes[count.index].tbl
  destination_cidr_block    = local.src_routes[count.index].cidr
  provider                  = aws.src
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

}

resource "aws_route" "dest_to_source" {
  count                     = length(local.dest_routes)
  route_table_id            = local.dest_routes[count.index].tbl
  destination_cidr_block    = local.dest_routes[count.index].cidr
  provider                  = aws.dest
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}


