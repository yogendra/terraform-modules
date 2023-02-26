
output "vpc_id"{
  value = aws_vpc.vpc.id
}

output "sg-ingress" {
  value = aws_security_group.allow-ingress.id
}
output "sg-allow-internal" {
  value = aws_security_group.allow-all-internal.id
}
output "sg-yba" {
  value = aws_security_group.yba-node.id
}
output "sg-yb-se-access"{
  value = aws_security_group.yb-se-access.id
}

output "sg-yb-db-nodes"{
  value = aws_security_group.yb-db-nodes.id
}

output "ingress-subnets" {
  value = aws_subnet.ingress-subnet[*].id
}

output "egress-subnets" {
  value = aws_subnet.egress-subnet[*].id
}

output "app-subnets" {
  value = aws_subnet.app-subnet[*].id
}

output "db-subnets" {
  value = aws_subnet.db-subnet[*].id
}

output "mgmt-subnets" {
  value = aws_subnet.mgmt-subnet[*].id
}

output "devops-subnets" {
  value = aws_subnet.devops-subnet[*].id
}

output "se-prefix-list-id"{
  value = aws_ec2_managed_prefix_list.yb-se.id
}
