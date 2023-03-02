
output "region" {
  value = var.config.region
}
output "vpc_id"{
  value = aws_vpc.vpc.id
}

output "sg-ingress" {
  value = aws_security_group.allow-ingress.id
}
output "sg-allow-internal" {
  value = aws_security_group.allow-internal.id
}
output "sg-yba" {
  value = aws_security_group.yba-node.id
}
output "sg-allow-remote"{
  value = one(aws_security_group.allow-remote.*.id)
}

output "sg-allow-egress"{
  value = aws_security_group.allow-egress.id
}

output "sg-yb-db-nodes"{
  value = aws_security_group.yb-db-nodes.id
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
output "route-tables" {
  value = concat([aws_vpc.vpc.default_route_table_id], aws_route_table.private.*.id, aws_route_table.public.*.id)
}
output "key-names"{
  value = aws_key_pair.keypair.*.key_name
}
