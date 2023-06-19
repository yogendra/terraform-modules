data "aws_ami" "ubuntu" {
  count = length(var.aws-ami) == 0 ? 1 : 0
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
  ami-id = length(var.aws-ami) == 0? data.aws_ami.ubuntu[0].id : var.aws-ami
  hostname = length(var.hostname) > 0? var.hostname: replace(lower("${var.app-name}-apps-${var.prefix}"), "/[^0-9A-Za-z]/","-")
}

data "aws_key_pair" "keypair" {
  key_name = var.aws-keypair-name
  include_public_key = true
}

data "cloudinit_config" "ci" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/app-cloud-init.yaml", {
      startup-commands = var.startup-commands
      boot-commands = var.boot-commands
      public-key = data.aws_key_pair.keypair.public_key
    })
  }
}



resource "aws_instance" "vm" {
  ami                    = local.ami-id
  instance_type          = var.aws-machine-type
  vpc_security_group_ids = var.aws-security-group-ids
  subnet_id              = var.aws-subnet-id
  iam_instance_profile   = var.aws-instance-profile
  key_name = var.aws-keypair-name
  root_block_device {
    volume_size = 200
    volume_type = "gp3"
  }
  user_data_base64 = data.cloudinit_config.ci.rendered
  tags = merge(var.tags, {
    Name = "${var.prefix}-app-${var.app-name}"
  })
  lifecycle {
    ignore_changes = [ ami ]
  }
}

resource "aws_eip" "vm-ip" {
  domain = "vpc"
  instance = aws_instance.vm.id
}
data "aws_route53_zone" "dns-zone" {
  count = length(var.aws-hosted-zone-name) > 0 ? 1:0
  name         = var.aws-hosted-zone-name
}

resource "aws_route53_record" "vm-dns" {
  count = length(var.aws-hosted-zone-name) > 0 ? 1:0
  zone_id = data.aws_route53_zone.dns-zone[0].zone_id
  name    = "${local.hostname}.${data.aws_route53_zone.dns-zone[0].name}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.vm-ip.public_ip]
}
resource "aws_route53_record" "star-vm-dns" {
  count = length(var.aws-hosted-zone-name) > 0 ? 1:0
  zone_id = data.aws_route53_zone.dns-zone[0].zone_id
  name    = "*.${local.hostname}.${data.aws_route53_zone.dns-zone[0].name}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.vm-ip.public_ip]
}
