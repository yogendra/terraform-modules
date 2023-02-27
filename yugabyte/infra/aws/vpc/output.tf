
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

output "ssh-keypairs" {
  value = aws_key_pair.keypair[*].key_name
}
output "config" {
  value = var.config
}
output "project_config"{
  value = var.project_config
}


# data "aws_subnet" "private" {
#   for_each = aws_subnet.private[*].id
#   id       = each.value
# }
# data "aws_subnet" "public" {
#   for_each = aws_subnet.public[*].id
#   id       = each.value
# }
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
