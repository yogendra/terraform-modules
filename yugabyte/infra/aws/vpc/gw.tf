resource "aws_internet_gateway" "igw" {
  count = local.create_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.project_config.prefix}-igw"
    yb_aws_service = "vpc"
    yb_resource_type = "igw"
  }
}


module "nat" {
  count = local.create_nat_gw ? 1 : 0
  source = "int128/nat-instance/aws"

  name                        = "${var.project_config.prefix}-nat"
  vpc_id                      = aws_vpc.vpc.id
  key_name                    = aws_key_pair.keypair[0].key_name
  instance_types              = lookup(local.nat-instance-types-override, local.region, local.nat-instance-types-override.default )
  public_subnet               = aws_subnet.public[0].id
  private_subnets_cidr_blocks = local.private_subnets[*].cidr
  private_route_table_ids     = [aws_route_table.private.id, aws_default_route_table.default.id]
  use_spot_instance           = true
  tags = {
    Name = "${var.project_config.prefix}-nat"
    yb_aws_service = "vpc"
    yb_resource_type = "nat"
  }
}


resource "aws_eip" "nat"{
  count = local.create_nat_gw ? 1 : 0
  network_interface = one(module.nat).eni_id

  tags = {
    Name = "${var.project_config.prefix}-nat"
    yb_aws_service = "ec2"
    yb_resource_type = "eip"
  }
}


resource "aws_route" "public-egress" {
  count = local.create_igw ? 1 : 0
  route_table_id = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw[0].id
}


resource "aws_security_group_rule" "nat-egress"{
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = one(module.nat[*].sg_id)
}
