data "aws_ami" "ubuntu" {
  count = length(var.ami) == 0 ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
locals {
  ami-id = length(var.ami) == 0? data.aws_ami.ubuntu[0].id : var.ami
}
data "cloudinit_config" "ci" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/demobox-cloud-init.yaml", {
      asset-bucket-location = "s3://${var.asset-bucket}/${var.asset-bucket-location}"
      password = var.password
    })
  }
}



resource "aws_instance" "demobox" {
  ami                    = local.ami-id
  instance_type          = var.machine-type
  vpc_security_group_ids = var.security-group-ids
  subnet_id              = var.subnet-id
  iam_instance_profile   = var.instance-profile
  key_name = var.keypair-name
  root_block_device {
    volume_size = 200
    volume_type = "gp3"
  }
  user_data_base64 = data.cloudinit_config.ci.rendered
  tags = merge(var.tags, {
    Name = "${var.prefix}-demobox"
  })
  lifecycle {
    ignore_changes = [ ami ]
  }
}
