
resource "aws_vpc_endpoint" "s3" {
  count             = var.airgapped ? 1 : 0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = concat(aws_route_table.mgmt-route-table.*.id,aws_route_table.devops-route-table.*.id, aws_route_table.app-route-table.*.id, aws_route_table.db-route-table.*.id)
  tags = {
    Name = "${var.prefix}-s3"
  }
}



resource "aws_vpc_endpoint" "ssm" {
  count               = var.airgapped ? 1 : 0
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.yba-node.id]
  subnet_ids          = aws_subnet.mgmt-subnet.*.id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-ssm"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  count               = var.airgapped ? 1 : 0
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.yba-node.id]
  subnet_ids          = aws_subnet.mgmt-subnet.*.id
  private_dns_enabled = true
  tags = {

    Name = "${var.prefix}-ec2messages"
  }
}
resource "aws_vpc_endpoint" "ssmmessages" {
  count               = var.airgapped ? 1 : 0
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  # security_group_ids  = [aws_security_group.yba-node.id]
  # subnet_ids          = aws_subnet.mgmt-subnet.*.id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-ssmmessages"
  }
}


resource "aws_vpc_endpoint" "ec2" {
  count             = var.airgapped ? 1 : 0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"

  # security_group_ids = [aws_security_group.yba-node.id]
  # subnet_ids         = aws_subnet.mgmt-subnet.*.id

  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-ec2"
  }
}


resource "aws_vpc_endpoint" "kms" {
  count             = var.airgapped ? 1 : 0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.region}.kms"
  vpc_endpoint_type = "Interface"

  # security_group_ids = [aws_security_group.yba-node.id]
  # subnet_ids         = aws_subnet.mgmt-subnet.*.id

  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-kms"
  }
}


resource "aws_vpc_endpoint" "cloudwatch" {
  count             = var.airgapped ? 1 : 0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  # security_group_ids = [aws_security_group.yba-node.id]
  # subnet_ids         = aws_subnet.mgmt-subnet.*.id

  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-cloudwatch"
  }
}
