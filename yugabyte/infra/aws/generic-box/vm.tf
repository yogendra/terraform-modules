data "aws_ami" "ami" {
  count       = length(var.aws-ami) == 0 ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["AlmaLinux OS 8.8.*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"] # Marketplace
}
locals {
  ami-id   = length(var.aws-ami) == 0 ? data.aws_ami.ami[0].id : var.aws-ami
  hostname = length(var.hostname) > 0 ? var.hostname : replace(lower("${var.name}-${var.prefix}"), "/[^0-9A-Za-z]/", "-")
  device_name = [ "/dev/sdh", "/dev/sdi", "/dev/sdj", "/dev/sdk", "/dev/sdl", "/dev/sdm", "/dev/sdn", "/dev/sdo", ]
}

data "aws_key_pair" "keypair" {
  key_name           = var.aws-keypair-name
  include_public_key = true
}
data "aws_subnet" "subnet" {
  id = var.aws-subnet-id
}

data "cloudinit_config" "ci" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloud-init.yaml", {
      arch             = var.arch
      boot-commands    = var.boot-commands
      packages         = var.packages
      public-key       = data.aws_key_pair.keypair.public_key
      startup-commands = var.startup-commands
      write-files      = var.files
      disk-count       = var.disk-count
    })
  }
}


resource "aws_ebs_volume" "volume" {
  count = var.disk-count
// Here , We need to give same AZ as the INstance Have.
  availability_zone = data.aws_subnet.subnet.availability_zone
// Size IN GiB
  size = var.disk-size-gb
  tags = var.tags
}

resource "aws_instance" "vm" {
  ami                    = local.ami-id
  instance_type          = var.aws-machine-type
  vpc_security_group_ids = var.aws-security-group-ids
  subnet_id              = var.aws-subnet-id
  iam_instance_profile   = var.aws-instance-profile
  key_name               = var.aws-keypair-name
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  user_data_base64 = data.cloudinit_config.ci.rendered
  tags = merge(var.tags, {
    Name = "${var.prefix}-${var.name}"
  })
  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_volume_attachment" "ebs_att" {
  count = var.disk-count
  device_name = local.device_name[count.index]
  volume_id   = aws_ebs_volume.volume[count.index].id
  instance_id = aws_instance.vm.id
}
resource "aws_eip" "vm-public-ip" {
  count  = var.assign-public-ip ? 1 : 0
  domain = "vpc"
}
resource "aws_eip_association" "vm-public-ip" {
  count         = var.assign-public-ip ? 1 : 0
  instance_id   = aws_instance.vm.id
  allocation_id = aws_eip.vm-public-ip[0].id
}
data "aws_route53_zone" "dns-public-zone" {
  count = length(var.aws-public-hosted-zone-name) > 0 && var.assign-public-ip ? 1 : 0
  name  = var.aws-public-hosted-zone-name
}

resource "aws_route53_record" "vm-public-dns" {
  count   = length(var.aws-private-hosted-zone-name) > 0 && var.assign-public-ip  ? 1 : 0
  zone_id = data.aws_route53_zone.dns-public-zone[0].zone_id
  name    = "${local.hostname}.${data.aws_route53_zone.dns-public-zone[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.vm-public-ip[0].public_ip]
}
resource "aws_route53_record" "star-vm-public-dns" {
  count   = length(var.aws-private-hosted-zone-name) > 0 && var.assign-public-ip ? 1 : 0
  zone_id = data.aws_route53_zone.dns-public-zone[0].zone_id
  name    = "*.${local.hostname}.${data.aws_route53_zone.dns-public-zone[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.vm-public-ip[0].public_ip]
}


data "aws_route53_zone" "dns-private-zone" {
  count = length(var.aws-private-hosted-zone-name) > 0 && var.assign-public-ip ? 1 : 0
  name  = var.aws-private-hosted-zone-name
}

resource "aws_route53_record" "vm-private-dns" {
  count   = length(var.aws-private-hosted-zone-name) > 0 && var.assign-public-ip ? 1 : 0
  zone_id = data.aws_route53_zone.dns-private-zone[0].zone_id
  name    = "${local.hostname}.${data.aws_route53_zone.dns-private-zone[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.vm.private_ip]
}
resource "aws_route53_record" "star-vm-private-dns" {
  count   = length(var.aws-private-hosted-zone-name) > 0 && var.assign-public-ip ? 1 : 0
  zone_id = data.aws_route53_zone.dns-private-zone[0].zone_id
  name    = "*.${local.hostname}.${data.aws_route53_zone.dns-private-zone[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.vm.private_ip]
}
