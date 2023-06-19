resource "aws_security_group" "app"{
  name        = "${var.prefix}-app"
  description = "SG for applications nodes"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-app"
    yb_aws_service = "ec2"
    yb_resource_type = "security_group"
  }
}

resource "aws_security_group_rule" "app-egress-all" {
  security_group_id = aws_security_group.app.id
  description      = "Allow All Egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  type             = "egress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "app-ingress-443" {
  security_group_id = aws_security_group.app.id
  description      = "Allow HTTPS"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "app-ingress-80" {
  security_group_id = aws_security_group.app.id
  description      = "Allow HTTP"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "app-ingress-8080" {
  security_group_id = aws_security_group.app.id
  description      = "Allow Alt HTTP"
  from_port        = 8080
  to_port          = 8080
  protocol         = "tcp"
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "app-ingress-8443" {
  security_group_id = aws_security_group.app.id
  description      = "Allow Alt HTTPS"
  from_port        = 8443
  to_port          = 8443
  protocol         = "tcp"
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "app-ingress-3000" {
  security_group_id = aws_security_group.app.id
  description      = "Allow React HTTP"
  from_port        = 3000
  to_port          = 3000
  protocol         = "tcp"
  type              = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "app-ingress-project" {
  security_group_id = aws_security_group.app.id
  description      = "Allow Ingress from within Project"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  type              = "ingress"
  cidr_blocks      = var.project-cidrs
}
resource "aws_security_group_rule" "app-ingress-known" {
  security_group_id = aws_security_group.app.id
  count            = length(var.mpl) > 0 ? 1 : 0
  description      = "Allow Ingress from known networks"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  type              = "ingress"
  prefix_list_ids = var.mpl-ids
}

resource "aws_security_group" "yba-node" {
  name        = "${var.prefix}-yba-nodes"
  description = "SG for YugabyteDB Anywhere Node"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-yba-node"
  }
}

resource "aws_security_group_rule" "yba-egress-all" {
  security_group_id = aws_security_group.yba-node.id
  description      = "Allow all egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  type             = "egress"
  cidr_blocks      = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "yba-ingress-80" {
  security_group_id = aws_security_group.yba-node.id
  description      = "Allow HTTP"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "yba-node-443" {
  description      = "Allow HTTPS"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  type             = "ingress"
  security_group_id = aws_security_group.yba-node.id
  cidr_blocks      = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "yba-ingress-8800" {
  security_group_id = aws_security_group.yba-node.id
  description      = "Allow Replicated"
  from_port        = 8800
  to_port          = 8800
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "yba-ingress-9090" {
  security_group_id = aws_security_group.yba-node.id
  description      = "Allow Prometheus"
  from_port        = 9090
  to_port          = 9090
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "yba-ingress-project" {
  security_group_id = aws_security_group.yba-node.id
  description      = "Allow all ingress from project"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  type              = "ingress"
  cidr_blocks      = var.project-cidrs
}

resource "aws_security_group_rule" "yba-ingress-mpl" {
  security_group_id = aws_security_group.yba-node.id
  count             = length(var.mpl-ids) > 0 ? 1 : 0
  description       = "Allow incoming from known machines"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  type              = "ingress"
  prefix_list_ids   = var.mpl-ids
}

resource "aws_security_group" "yb-db-nodes" {
  name        = "${var.prefix}-ybdb"
  description = "SG for Yugabyte DB Nodes"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-yba-db-node"
    yb_aws_service = "ec2"
    yb_resource_type = "security_group"
  }
}
resource "aws_security_group_rule" "yb-db-nodes-egress-public"{
  security_group_id = aws_security_group.yb-db-nodes.id
  description =  "Allow egress to all destinations"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  type             = "egress"
  cidr_blocks      = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "yb-db-allow-22" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow SSH"
  from_port        = 22
  to_port          = 22
  protocol         = "-1"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-7000" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Master RPC"
  from_port        = 7000
  to_port          = 7000
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-7100" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Master HTTP"
  from_port        = 7100
  to_port          = 7100
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-9000" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Tserver RPC"
  from_port        = 9000
  to_port          = 9000
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-9100" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Tserver HTTP"
  from_port        = 9100
  to_port          = 9100
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-9300" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Node Metric"
  from_port        = 9300
  to_port          = 9300
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-11000" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Yedis Metric"
  from_port        = 11000
  to_port          = 11000
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-12000" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow YCQL Metric"
  from_port        = 12000
  to_port          = 12000
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-13000" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow YSQL Metric"
  from_port        = 13000
  to_port          = 13000
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-18018" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow YBC"
  from_port        = 18018
  to_port          = 18018
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-5433" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow YSQL"
  from_port        = 5433
  to_port          = 5433
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-9042" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow YCQL"
  from_port        = 9042
  to_port          = 9042
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-6379" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow Yedis"
  from_port        = 6379
  to_port          = 6379
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-54422" {
  security_group_id = aws_security_group.yb-db-nodes.id
  description      = "Allow SSH - Alt"
  from_port        = 54422
  to_port          = 54422
  protocol         = "tcp"
  type             = "ingress"
  cidr_blocks      = local.project_cidrs
}
resource "aws_security_group_rule" "yb-db-nodes-allow-mpl" {
  security_group_id = aws_security_group.yb-db-nodes.id
  count             = length(var.mpl-ids) > 0 ? 1 : 0
  type              = "ingress"
  description       =  "Allow incoming from known machines"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  prefix_list_ids   = var.mpl-ids
}

resource "aws_security_group_rule" "default-internal-ingress"{
  security_group_id = aws_vpc.vpc.default_security_group_id
  type             = "ingress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = local.project_cidrs
}

resource "aws_security_group_rule" "default-remote-ingress"{
  security_group_id = aws_vpc.vpc.default_security_group_id
  count = local.create_mpl? 1 : 0
  type             = "ingress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  prefix_list_ids  = var.mpl-ids
}



