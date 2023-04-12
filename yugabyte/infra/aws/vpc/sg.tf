resource "aws_security_group" "allow-ingress"{
  name        = "${var.project_config.prefix}-allow-ingress"
  description = "Allow Public Ingress Traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Allow HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Allow Alt HTTP"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Allow Alt HTTPS"
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Allow React HTTP"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_config.prefix}-allow-ingress"
  }
}

resource "aws_security_group" "allow-internal"{
  name        = "${var.project_config.prefix}-allow-internal"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "Allow all Internal"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = local.project_cidrs
  }
  egress {
    description      = "Allow all Internal"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = local.project_cidrs
  }
  tags = {
    Name = "${var.project_config.prefix}-allow-internal"
  }
}

resource "aws_security_group" "yba-node" {
  name        = "${var.project_config.prefix}-yba-nodes"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }

  ingress {
    description      = "HTTP Alt"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }

  ingress {
    description      = "HTTP Alt 2"
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Replicated"
    from_port        = 8800
    to_port          = 8800
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "SSH Alt"
    from_port        = 54422
    to_port          = 54422
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }

  tags = {
    Name = "${var.project_config.prefix}-yba-node"
  }
}
resource "aws_security_group" "yb-db-nodes" {
  name        = "${var.project_config.prefix}-yb-db-nodes"
  description = "Allow Yugabyte DB Traffic"
  vpc_id      = aws_vpc.vpc.id
  egress {
    description =  "Allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description =  "Allow incoming from known machines"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    prefix_list_ids  = aws_ec2_managed_prefix_list.allow-remote.*.id
  }
  ingress {
    description      = "Allow Master RPC"
    from_port        = 7000
    to_port          = 7000
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow Master HTTP"
    from_port        = 7100
    to_port          = 7100
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }

  ingress {
    description      = "Allow Tserver RPC"
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow Tserver HTTP"
    from_port        = 9100
    to_port          = 9100
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow Node Metric"
    from_port        = 9300
    to_port          = 9300
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow Yedis Metric"
    from_port        = 11000
    to_port          = 11000
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow YCQL Metric"
    from_port        = 12000
    to_port          = 12000
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow YSQL Metric"
    from_port        = 13000
    to_port          = 13000
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow YBC"
    from_port        = 18018
    to_port          = 18018
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow YSQL"
    from_port        = 5433
    to_port          = 5433
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow YCQL"
    from_port        = 9042
    to_port          = 9042
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow Yedis"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  ingress {
    description      = "Allow SSH - Alt"
    from_port        = 54422
    to_port          = 54422
    protocol         = "tcp"
    cidr_blocks      = local.project_cidrs
  }
  tags = {
    Name = "${var.project_config.prefix}-yba-db-node"
  }
}


resource "aws_security_group" "allow-egress" {
  name        = "${var.project_config.prefix}-allow-egress"
  description = "Allow Egress"
  vpc_id      = aws_vpc.vpc.id

  egress {
    description =  "Allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_config.prefix}-allow-egress"
  }
}
resource "aws_security_group" "allow-remote" {
  count = local.create_mpl? 1 : 0
  name        = "${var.project_config.prefix}-allow-remote"
  description = "Allow Remote IPs"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description =  "Allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    prefix_list_ids  = aws_ec2_managed_prefix_list.allow-remote.*.id
  }
  tags = {
    Name = "${var.project_config.prefix}-allow-remote"
  }
}


resource "aws_ec2_managed_prefix_list" "allow-remote" {
  count = local.create_mpl? 1 : 0
  name           = "${var.project_config.prefix}-allow-remote"
  address_family = "IPv4"
  max_entries    = 20
  tags = {
    Name = "${var.project_config.prefix}-allow-remote"
  }
}
resource "aws_ec2_managed_prefix_list_entry" "allow-remote" {
  for_each = local.create_mpl? var.project_config.remote-ips : {}
  cidr           = "${each.value}"
  description    = "${each.key}"
  prefix_list_id = one(aws_ec2_managed_prefix_list.allow-remote.*.id)
}


resource "aws_default_security_group" "default"{
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_config.prefix}-default"
  }
}

resource "aws_security_group_rule" "default-internal-ingress"{
    type             = "ingress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = local.project_cidrs
    security_group_id = aws_default_security_group.default.id
}

resource "aws_security_group_rule" "default-remote-ingress"{
  type             = "ingress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  prefix_list_ids  = aws_ec2_managed_prefix_list.allow-remote.*.id
  security_group_id = aws_default_security_group.default.id
}

resource "aws_security_group_rule" "default-egress"{
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_default_security_group.default.id
}

