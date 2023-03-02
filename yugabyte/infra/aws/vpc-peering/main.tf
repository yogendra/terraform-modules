data "aws_vpc" "src" {
  id       = var.src_vpc_id
  provider = aws.src
}
data "aws_region" "src" {
  provider = aws.src
}
data "aws_vpc" "dest" {
  id       = var.dest_vpc_id
  provider = aws.dest
}
data "aws_region" "dest" {
  provider = aws.dest
}


# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = data.aws_vpc.src.id
  peer_vpc_id = data.aws_vpc.dest.id
  peer_region = data.aws_region.dest.name
  provider = aws.src

}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  provider                  = aws.dest
  auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "src-option" {
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id
  provider = aws.src
  requester {
    allow_remote_vpc_dns_resolution = true
  }
}
resource "aws_vpc_peering_connection_options" "dest-option" {
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id
  provider = aws.dest
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}


data "aws_route_tables" "dest" {
  vpc_id   = var.dest_vpc_id
  provider = aws.dest
}
data "aws_route_tables" "src" {
  vpc_id   = var.src_vpc_id
  provider = aws.src
}


locals {
  src_cidrs  = concat([data.aws_vpc.src.cidr_block], data.aws_vpc.src.cidr_block_associations.*.cidr_block)
  dest_cidrs = concat([data.aws_vpc.dest.cidr_block], data.aws_vpc.dest.cidr_block_associations.*.cidr_block)
}

locals {
  src_rtbl_ids  = concat(data.aws_route_tables.src.ids, [data.aws_vpc.src.main_route_table_id])
  dest_rtbl_ids = concat(data.aws_route_tables.dest.ids,[data.aws_vpc.dest.main_route_table_id])

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


