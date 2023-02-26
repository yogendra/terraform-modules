module "test-account" {
  source = "../../yb-account"
  prefix = local.project_config["prefix"]
}

module "vpc-peer" {
  source      = "../"
  src_vpc_id  = module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix      = local.project_config["prefix"]
  providers = {
    aws.src  = aws.ap_southeast_1
    aws.dest = aws.ap_southeast_2
  }
}


// Create jumbbox
data "aws_ami" "vm1" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  provider = aws.ap_southeast_1
}

resource "aws_instance" "vm1" {
  ami           = data.aws_ami.vm1.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    module.vpc-ap-southeast-1.sg-allow-internal,
    module.vpc-ap-southeast-1.sg-allow-egress
  ]
  subnet_id            = module.vpc-ap-southeast-1.private-subnets[0]
  iam_instance_profile = module.test-account.ssm-instance-profile
  key_name             = module.vpc-ap-southeast-1.ssh-keypairs[0]

  tags = {
    Name = "${local.project_config["prefix"]}-vm1"
  }
  provider = aws.ap_southeast_1
}


// Create jumbbox
data "aws_ami" "vm2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  provider = aws.ap_southeast_2
}

resource "aws_instance" "vm2" {
  ami           = data.aws_ami.vm2.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    module.vpc-ap-southeast-2.sg-allow-internal,
    module.vpc-ap-southeast-2.sg-allow-egress
  ]
  subnet_id            = module.vpc-ap-southeast-2.private-subnets[0]
  iam_instance_profile = module.test-account.ssm-instance-profile
  key_name             = module.vpc-ap-southeast-2.ssh-keypairs[0]

  tags = {
    Name = "${local.project_config["prefix"]}-vm1"
  }
  provider = aws.ap_southeast_2
}

output "vm1"{
  value = "${aws_instance.vm1.id} -- ${aws_instance.vm1.private_ip}"
}
output "vm2"{
  value = "${aws_instance.vm2.id} -- ${aws_instance.vm2.private_ip}"
}
