

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = var.src_vpc_id
  peer_vpc_id = var.dest_vpc_id
  peer_region = var.dest_region
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

locals {
  src_cidrs = var.src_cidrs
  dest_cidrs = var.dest_cidrs
  src_rtbl_ids = var.src_route_tables
  dest_rtbl_ids = var.dest_route_tables

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


