resource "aws_security_group" "app"{
  name        = "${var.project_config.prefix}-app"
  description = "SG for applications nodes"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_config.prefix}-app"
    yb_aws_service = "ec2"
    yb_resource_type = "security_group"
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_security_group_rule" "allow-ingress-80" {
  description      = "Allow HTTPS"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.app.id
}
resource "aws_security_group_rule" "app-80" {
  description      = "Allow HTTP"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.app.id
}
resource "aws_security_group_rule" "app-8080" {
  description      = "Allow Alt HTTP"
  from_port        = 8080
  to_port          = 8080
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.app.id
}
resource "aws_security_group_rule" "app-8443" {
  description      = "Allow Alt HTTPS"
  from_port        = 8443
  to_port          = 8443
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.app.id
}
resource "aws_security_group_rule" "app-3000" {
  description      = "Allow React HTTP"
  from_port        = 3000
  to_port          = 3000
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.app.id
}


resource "aws_security_group" "yba-node" {
  name        = "${var.project_config.prefix}-yba-nodes"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_config.prefix}-yba-node"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_security_group_rule" "yba-node-egress" {
  description      = "HTTP from VPC"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "egress"
  security_group_id = aws_security_group.yba-node.id
}

resource "aws_security_group_rule" "yba-node-22" {
  description      = "SSH"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "ingress"
  security_group_id = aws_security_group.yba-node.id
}
resource "aws_security_group_rule" "yba-node-80" {
  description      = "HTTP from VPC"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "ingress"
  security_group_id = aws_security_group.yba-node.id
}
resource "aws_security_group_rule" "yba-node-443" {
  description      = "HTTPS from VPC"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "ingress"
  security_group_id = aws_security_group.yba-node.id
}


resource "aws_security_group_rule" "yba-node-8800" {
  description      = "Replicated"
  from_port        = 8800
  to_port          = 8800
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "ingress"
  security_group_id = aws_security_group.yba-node.id
}

resource "aws_security_group_rule" "yba-node-54422" {
  description      = "SSH Alt"
  from_port        = 54422
  to_port          = 54422
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "ingress"
  security_group_id = aws_security_group.yba-node.id
}
resource "aws_security_group_rule" "yba-node-allow-mpl" {
  count             = local.create_mpl? 1 : 0
  type              = "ingress"
  description       = "Allow incoming from known machines"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.yba-node.id
  prefix_list_ids   = aws_ec2_managed_prefix_list.allow-remote.*.id
}


resource "aws_security_group" "yb-db-nodes" {
  name        = "${var.project_config.prefix}-ybdb"
  description = "Allow Yugabyte DB Traffic"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_config.prefix}-yba-db-node"
    yb_aws_service = "ec2"
    yb_resource_type = "security_group"
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_security_group_rule" "yb-db-nodes-egress-public"{
  description =  "Allow egress to all destinations"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  type             = "egress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-22" {
  description      = "Allow SSH"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-allow-yba" {
  description      = "Allow All from YBA Node"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  source_security_group_id = aws_security_group.yba-node.id
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-7000" {
  description      = "Allow Master RPC"
  from_port        = 7000
  to_port          = 7000
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-7100" {
  description      = "Allow Master HTTP"
  from_port        = 7100
  to_port          = 7100
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-9000" {
  description      = "Allow Tserver RPC"
  from_port        = 9000
  to_port          = 9000
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-9100" {
  description      = "Allow Tserver HTTP"
  from_port        = 9100
  to_port          = 9100
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-9300" {
  description      = "Allow Node Metric"
  from_port        = 9300
  to_port          = 9300
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-11000" {
  description      = "Allow Yedis Metric"
  from_port        = 11000
  to_port          = 11000
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-12000" {
  description      = "Allow YCQL Metric"
  from_port        = 12000
  to_port          = 12000
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-13000" {
  description      = "Allow YSQL Metric"
  from_port        = 13000
  to_port          = 13000
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-18018" {
  description      = "Allow YBC"
  from_port        = 18018
  to_port          = 18018
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-5433" {
  description      = "Allow YSQL"
  from_port        = 5433
  to_port          = 5433
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-9042" {
  description      = "Allow YCQL"
  from_port        = 9042
  to_port          = 9042
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-6379" {
  description      = "Allow Yedis"
  from_port        = 6379
  to_port          = 6379
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-54422" {
  description      = "Allow SSH - Alt"
  from_port        = 54422
  to_port          = 54422
  protocol         = "tcp"
  cidr_blocks      = local.project_cidrs
  type             = "ingress"
  security_group_id = aws_security_group.yb-db-nodes.id
}
resource "aws_security_group_rule" "yb-db-nodes-allow-mpl" {
  count             = local.create_mpl? 1 : 0
  type              = "ingress"
  description       =  "Allow incoming from known machines"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.yb-db-nodes.id
  prefix_list_ids   = aws_ec2_managed_prefix_list.allow-remote.*.id
}

resource "aws_security_group_rule" "default-internal-ingress"{
  count = local.create_mpl? 1 : 0
  type             = "ingress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = local.project_cidrs
  security_group_id = aws_vpc.vpc.default_security_group_id
}

resource "aws_security_group_rule" "default-remote-ingress"{
  count = local.create_mpl? 1 : 0
  type             = "ingress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  prefix_list_ids  = aws_ec2_managed_prefix_list.allow-remote.*.id
  security_group_id = aws_vpc.vpc.default_security_group_id
}

resource "aws_security_group_rule" "default-egress"{
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_vpc.vpc.default_security_group_id
}



