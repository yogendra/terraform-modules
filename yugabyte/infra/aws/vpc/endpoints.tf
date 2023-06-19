
resource "aws_vpc_endpoint" "s3" {
  count             = local.create_endpoints?1:0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id,aws_route_table.private.id, aws_vpc.vpc.default_route_table_id]
  tags = {
    Name = "${var.prefix}-s3"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "s3"
  }
}


resource "aws_security_group" "allow-vpc-internal" {
  name        = "${var.prefix}-vpc-internal"
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
    Name = "${var.prefix}-vpc-internal"
    yb_aws_service = "ec2"
    yb_resource_type = "security_group"
  }
}


resource "aws_vpc_endpoint" "ssm" {
  count             = local.create_endpoints?1:0
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ssm"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-ssm"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "ssm"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  count             = local.create_endpoints?1:0
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {

    Name = "${var.prefix}-ec2messages"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "ec2messages"
  }
}
resource "aws_vpc_endpoint" "ssmmessages" {
  count             = local.create_endpoints?1:0
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-ssmmessages"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "ssmmessages"
  }
}


resource "aws_vpc_endpoint" "ec2" {
  count             = local.create_endpoints?1:0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.ec2"
  vpc_endpoint_type = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-ec2"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "ec2"
  }
}


resource "aws_vpc_endpoint" "kms" {
  count             = local.create_endpoints?1:0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.kms"
  vpc_endpoint_type = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-kms"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "kms"
  }
}


resource "aws_vpc_endpoint" "cloudwatch" {
  count             = local.create_endpoints?1:0
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${local.region}.logs"
  vpc_endpoint_type = "Interface"
  security_group_ids  = [aws_security_group.allow-vpc-internal.id]
  subnet_ids          = aws_subnet.private[*].id
  private_dns_enabled = true
  tags = {
    Name = "${var.prefix}-cloudwatch"
    yb_aws_service = "vpc_endpoint"
    yb_resource_type = "cloudwatch"
  }
}
