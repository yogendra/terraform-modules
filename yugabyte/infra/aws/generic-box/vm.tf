locals{
  tags = merge ( var.tags, {
    Name = "${var.prefix}-${var.name}"
    yb-app = var.name
    yb-env = var.prefix

  })

}
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
  filter {
    name = "architecture"
    values = [var.arch]
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
data "aws_route53_zone" "private"{
  count = var.aws-private-hosted-zone-id != null ? 1: 0
  zone_id = var.aws-private-hosted-zone-id
}
data "aws_route53_zone" "public"{
  count =  var.aws-public-hosted-zone-id != null ? 1 : 0
  zone_id = var.aws-public-hosted-zone-id
}

resource "aws_network_interface" "eni"{
  subnet_id       = var.aws-subnet-id
  security_groups = var.aws-security-group-ids
  tags = merge(local.tags , {
    resource-type = "ec2"
    resource-subtype = "eni"
  })
}

resource "aws_route53_record" "vm-private-dns" {
  count   = var.aws-private-hosted-zone-id != null ? 1 : 0
  zone_id = var.aws-private-hosted-zone-id
  name    = "${local.hostname}.${data.aws_route53_zone.private[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_network_interface.eni.private_ip]
  # tags = merge(local.tags , {
  #   resource-type = "route53"
  #   resource-subtype = "record"
  # })
}
resource "aws_route53_record" "star-vm-private-dns" {
  count   = var.aws-private-hosted-zone-id != null ? 1 : 0
  zone_id = var.aws-private-hosted-zone-id
  name    = "*.${local.hostname}.${data.aws_route53_zone.private[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_network_interface.eni.private_ip]
  # tags = merge(local.tags , {
  #   resource-type = "route53"
  #   resource-subtype = "record"
  # })
}

resource "aws_eip" "vm-public-ip" {
  count  = var.assign-public-ip ? 1 : 0
  domain = "vpc"
  tags = merge(local.tags , {
    resource-type = "ec2"
    resource-subtype = "eip"
  })
}


resource "aws_route53_record" "vm-public-dns" {
  count   = var.aws-public-hosted-zone-id != null && var.assign-public-ip  ? 1 : 0
  zone_id = var.aws-public-hosted-zone-id
  name    = "${local.hostname}.${data.aws_route53_zone.public[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.vm-public-ip[0].public_ip]
  # tags = merge(local.tags , {
  #   resource-type = "route53"
  #   resource-subtype = "record"
  # })
}
resource "aws_route53_record" "star-vm-public-dns" {
  count   = var.aws-public-hosted-zone-id != null && var.assign-public-ip ? 1 : 0
  zone_id = var.aws-public-hosted-zone-id
  name    = "*.${local.hostname}.${data.aws_route53_zone.public[0].name}"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.vm-public-ip[0].public_ip]

}

locals{
  internal-address =  coalesce(one(aws_route53_record.vm-private-dns[*].fqdn), aws_network_interface.eni.private_ip)
  external-address = coalesce( one(aws_route53_record.vm-public-dns[*].fqdn), one(aws_eip.vm-public-ip[*].public_ip), local.internal-address )
}

resource "aws_ebs_volume" "volume" {
  count = var.disk-count
// Here , We need to give same AZ as the INstance Have.
  availability_zone = data.aws_subnet.subnet.availability_zone
// Size IN GiB
  size = var.disk-size-gb
  tags = merge(local.tags , {
    resource-type = "ec2"
    resource-subtype = "ebs"
  })
}


data "cloudinit_config" "ci" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloud-init.yaml", {
      # arch             = var.arch
      boot-commands    = var.boot-commands
      packages         = var.packages
      public-key       = data.aws_key_pair.keypair.public_key
      startup-commands = var.startup-commands
      write-files      = var.files
      disk-count       = var.disk-count
      internal-address = local.internal-address
      external-address = local.external-address
      cloud-init-extras = var.cloud-init-extras
    })
  }
}


resource "aws_instance" "vm" {
  ami                    = local.ami-id
  instance_type          = var.aws-machine-type
  # vpc_security_group_ids = var.aws-security-group-ids
  # subnet_id              = var.aws-subnet-id
  iam_instance_profile   = var.aws-instance-profile
  key_name               = var.aws-keypair-name
  network_interface {
    network_interface_id = aws_network_interface.eni.id
    device_index         = 0
  }
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  user_data_base64 = data.cloudinit_config.ci.rendered

  tags = merge(local.tags , {
    Name = "${var.prefix}-${var.name}"
    resource-type = "ec2"
    resource-subtype = "ec2"
  })
  lifecycle {
    ignore_changes = [ami]
  }
}
resource "aws_eip_association" "vm-public-ip" {
  count         = var.assign-public-ip ? 1 : 0
  instance_id   = aws_instance.vm.id
  allocation_id = aws_eip.vm-public-ip[0].id
}

resource "aws_volume_attachment" "ebs_att" {
  count = var.disk-count
  device_name = local.device_name[count.index]
  volume_id   = aws_ebs_volume.volume[count.index].id
  instance_id = aws_instance.vm.id
}
