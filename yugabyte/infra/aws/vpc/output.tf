
output "region" {
  value = local.region
}
output "vpc_id"{
  value = aws_vpc.vpc.id
}
output "vpc_cidrs"{
  value = var.config.cidrs
}
output "sg-app" {
  value = aws_security_group.app.id
}
output "sg-yba" {
  value = aws_security_group.yba-node.id
}

output "sg-yb-db-nodes"{
  value = aws_security_group.yb-db-nodes.id
}
output "sg-default" {
  value = aws_vpc.vpc.default_security_group_id
}
output "mpl"{
  value = one(aws_ec2_managed_prefix_list.allow-remote.*.id)
}

output "public-subnets" {
  value = aws_subnet.public[*].id
}

output "private-subnets" {
  value = aws_subnet.private[*].id
}
output "allow-remote-prefix-list-id"{
  value = one(aws_ec2_managed_prefix_list.allow-remote.*.id)
}
output "private-subnet-by-az"{
  value = {
    for subnet in aws_subnet.private[*] : subnet.availability_zone => subnet.id...
  }
}
output "public-subnet-by-az"{
  value = {
    for subnet in aws_subnet.public[*] : subnet.availability_zone => subnet.id...
  }
}
output "route-tables-private"{
  value = aws_route_table.private.*.id
}
output "route-tables-public"{
  value = aws_route_table.public.*.id
}
output "route-table-default"{
  value = aws_vpc.vpc.default_route_table_id
}
output "route-tables" {
  value = concat([aws_vpc.vpc.default_route_table_id], aws_route_table.private.*.id, aws_route_table.public.*.id)
}
output "key-names"{
  value = aws_key_pair.keypair.*.key_name
}
