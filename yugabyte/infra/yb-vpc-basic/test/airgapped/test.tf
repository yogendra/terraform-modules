
provider "aws" {
  region = "us-east-1"
}
module "test-account" {
  source = "../../../yb-account"
  prefix = local.project_config["prefix"]
}
module "test-vpc" {
  source         = "../.."
  project_config = local.project_config
  config         = local.vpc_config["us-east-1"]
}

// Create jumbbox
data "aws_ami" "test" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.test.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    module.test-vpc.sg-allow-internal,
    module.test-vpc.sg-allow-egress
  ]
  subnet_id            = module.test-vpc.private-subnets[0]
  iam_instance_profile = module.test-account.ssm-instance-profile
  key_name             = module.test-vpc.ssh-keypairs[0]

  tags = {
    Name = "ag-test-vm"
  }
}

output "test-vm"{
  value = aws_instance.test.id
}
