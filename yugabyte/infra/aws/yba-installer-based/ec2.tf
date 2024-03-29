data "cloudinit_config" "yba" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/yba-cloud-init.yaml", {
      public-key = data.aws_key_pair.yba-keypair.public_key
      license = local.yba-license
      yba-installer-url = local.yba-installer-url
      yba-installer-package-filename = local.yba-installer-package-filename
      yba-installer-dirname = local.yba-installer-dirname
      email = var.yba-superadmin-email
      name = var.yba-superadmin-name
      password = var.yba-superadmin-password
      env = var.yba-environment-type
      yba-ctl-yaml = var.yba-ctl-yaml
      files = var.files
    })
  }
}

resource "aws_instance" "yba" {
  ami                    = local.yba-ami
  instance_type          = local.yba-instance-type
  key_name               = local.key-name
  iam_instance_profile   = local.yba-iam-instance-profile
  monitoring             = true
  subnet_id              = local.yba-subnet
  vpc_security_group_ids = local.yba-security-groups
  user_data_base64       = data.cloudinit_config.yba.rendered

  root_block_device {
    volume_size = 100
    tags = merge(local.tags, {
      Name = "${local.prefix}-yba-root"
      yb_aws_service = "ec2"
      yb_resource_type = "ebs"
    })
  }

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 20
    volume_type = "gp3"
    throughput = 125
    delete_on_termination = false
    tags = merge(local.tags, {
      Name = "${local.prefix}-yba-home"
      yb_aws_service = "ec2"
      yb_resource_type = "ebs"
    })
  }
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 250
    volume_type = "gp3"
    throughput = 125
    delete_on_termination = false
    tags = merge(local.tags, {
      Name = "${local.prefix}-yba-opt"
      yb_aws_service = "ec2"
      yb_resource_type = "ebs"
    })
  }

  tags = {
    Name = "${local.prefix}-yba"
    yb_aws_service = "ec2"
    yb_resource_type = "ec2"
  }
}

locals{
  hostname = length(var.hostname) > 0? var.hostname: replace(lower("yba-${var.prefix}"), "/[^0-9A-Za-z]/","-")
  fqdn = length(var.aws-hosted-zone-name) > 0 ? aws_route53_record.vm-dns[0].fqdn : ""
}
resource "aws_eip" "vm-ip" {
  domain = "vpc"
  tags = {
    Name = "${var.prefix}-yba"
  }
}
resource "aws_eip_association" "eip-assoc" {
  instance_id   = aws_instance.yba.id
  allocation_id = aws_eip.vm-ip.id
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
  ttl     = "5"
  records = [aws_eip.vm-ip.public_ip]
}
data "external" "get-api-token" {
  program = ["${path.module}/scripts/get-api-token.sh"]
  query = {
    login = var.yba-superadmin-email
    password = var.yba-superadmin-password
    api = "https://${aws_eip.vm-ip.public_ip}/api/v1"
  }
  depends_on = [
    aws_instance.yba,
    aws_eip.vm-ip,
    aws_route53_record.vm-dns
  ]
}
