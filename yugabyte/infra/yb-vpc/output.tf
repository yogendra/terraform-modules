
output "vpc_id"{
  value = aws_vpc.vpc.id
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

