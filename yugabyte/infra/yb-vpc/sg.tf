locals{
  db_cidrs = [for s in local.subnets:  s.cidr if s.name == "db"]
  mgmt_cidrs = [for s in local.subnets:  s.cidr if s.name == "mgmt"]
  ingress_cidrs = [for s in local.subnets:  s.cidr if s.name == "ingress"]
  app_cidrs = [for s in local.subnets:  s.cidr if s.name == "app"]
  devops_cidrs = [for s in local.subnets:  s.cidr if s.name == "ingress"]
  egress_cidrs = [for s in local.subnets:  s.cidr if s.name == "ingress"]
  vpc_cidrs = var.config.cidrs
  project_cidrs = [var.project_cidr]
}
resource "aws_security_group" "app" {

}

resource "aws_security_group" "yba-node" {
  name        = "yba-nodes"
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
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.prefix}-yba-node"
  }
}
resource "aws_security_group" "yb-db-nodes" {
  name        = "yb-db-nodes"
  description = "Allow Yugabyte DB Traffic"
  vpc_id      = aws_vpc.vpc.id

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

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.prefix}-yba-db-node"
  }
}

resource "aws_security_group" "yb-se-access" {
  name        = "yb-se-access"
  description = "YB SE Access"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description =  "Allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    prefix_list_ids  = [aws_ec2_managed_prefix_list.yb-se.id]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.prefix}-se-access"
  }
}


resource "aws_ec2_managed_prefix_list" "yb-se" {
  name           = "All SE IPs"
  address_family = "IPv4"
  max_entries    = 20
}

