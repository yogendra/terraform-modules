
resource "aws_vpc_endpoint" "s3" {
  count             = local.create_endpoints?1:0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id,aws_route_table.private.id, aws_vpc.vpc.default_route_table_id]
  tags = {
    Name = "${var.project_config.prefix}-s3"
  }
}


resource "aws_security_group" "allow-vpc-internal" {
  name        = "${var.project_config.prefix}-vpc-internal"
  description = "Allow Internal VPC traffic only"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "Allow HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = var.config.cidrs
  }
  tags = {
    Name = "${var.project_config.prefix}-vpc-internal"
  }
}


resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.project_config.prefix}-ssm"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {

    Name = "${var.project_config.prefix}-ec2messages"
  }
}
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.project_config.prefix}-ssmmessages"
  }
}


resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.ec2"
  vpc_endpoint_type = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.project_config.prefix}-ec2"
  }
}


resource "aws_vpc_endpoint" "kms" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.kms"
  vpc_endpoint_type = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.project_config.prefix}-kms"
  }
}


resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.logs"
  vpc_endpoint_type = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.project_config.prefix}-cloudwatch"
  }
}
