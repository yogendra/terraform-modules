

locals {
  worker-per-zone = var.workers-per-az
  project-name      = var.project-name
  prefix            = var.prefix

  create_vpc = var.vpc_id == "" || var.vpc_id == null



  region            = data.aws_region.current.name
  selected_vpc_subnets_to_az = local.create_vpc ? {} :  {for subnet-id, subnet in data.aws_subnet.selected-vpc-subnet: subnet.id => subnet.availability_zone }
  selected_vpc_az = local.create_vpc ? [] : tolist(toset(values(local.selected_vpc_subnets_to_az)))
  azs               = local.create_vpc ? data.aws_availability_zones.current.names : local.selected_vpc_az

  control-plane-azs = slice(local.azs,0,3)
  cidr              = local.create_vpc ?  var.vpc-cidr : data.aws_vpc.selected[0].cidr_block

  tags = merge(
    var.tags,
    {
      project_name = var.project-name
      prefix = var.prefix
      Terraform   = "true"
    }
  )

  vpc_id = local.create_vpc ? module.vpc[0].vpc_id : var.vpc_id
  sg_id = local.create_vpc ? module.vpc[0].default_security_group_id : var.security_group_id
  public_subnets = local.create_vpc ? module.vpc[0].public_subnets: var.public-subnets
  private_subnet = local.create_vpc ? module.vpc[0].private_subnets : var.private-subnets


  # cidr for new vpc, not required for existing vpc
  az_count       = length(local.azs)
  az_cidr_newbit = ceil(pow(local.az_count, 0.5))
  az_cidrs             = [for i, cidr in local.azs : cidrsubnet(local.cidr, local.az_cidr_newbit, i)]
  public_subnet_cidrs  = local.create_vpc ? [for i, cidr in local.az_cidrs : cidrsubnet(cidr, 1, 0)] : []
  private_subnet_cidr  = local.create_vpc ? [for i, cidr in local.az_cidrs : cidrsubnet(cidr, 1, 1)] : []

  private-subnet-by-az = local.create_vpc ? { for idx, subnet in module.vpc[0].private_subnets : module.vpc[0].azs[idx] => subnet } : { for subnet-id in var.public-subnets : local.selected_vpc_subnets_to_az[subnet-id] => subnet-id }

  nat_gw_ips = local.create_vpc ?  module.vpc[0].nat_public_ips : data.aws_nat_gateway.ngws.*.public_ip

  workers-config = {
    for i, instance in setproduct(keys(local.private-subnet-by-az), range(local.worker-per-zone)) :
    "${local.prefix}-wk-${instance[0]}-${instance[1]}" => {
      name              = "${local.prefix}-wk-${instance[0]}-${instance[1]}"
      subnet            = local.private-subnet-by-az[instance[0]]
      az-instance-index = instance[1]
    }
  }

  bastion_entries = var.use-bastion ? [ {
      description = "bastion"
      cidr = "${aws_instance.bastion[0].public_ip}/32"
      }
  ]: []

  well-knowns = concat(
    [
      {
        description = "workstation"
        cidr = "${chomp(data.http.my-ip.response_body)}/32"
      },
      {
        description = "vpc"
        cidr = local.cidr
      }
    ],
    [ for i, nat_cidr in local.nat_gw_ips :  { description = "NAT GW - ${i}", cidr = "${nat_cidr}/32" } ],
    local.bastion_entries
  )
}


data "aws_region" "current" {}
data "aws_availability_zones" "current" {
  state = "available"
}

data "aws_vpc" "selected" {
  count = local.create_vpc ? 0 : 1
  id = var.vpc_id
}

data "aws_subnets" "selected-vpc-subnet-list" {
  count = local.create_vpc ? 0 : 1
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
data "aws_subnet" "selected-vpc-subnet" {
  count    = local.create_vpc ? 0 : length(data.aws_subnets.selected-vpc-subnet-list[0].ids)
  id       = data.aws_subnets.selected-vpc-subnet-list[0].ids[count.index]
}
data "aws_nat_gateways" "ngws" {
  count = local.create_vpc ? 0 : 1
  vpc_id = var.vpc_id
  filter {
    name   = "state"
    values = ["available"]
  }
}
data "aws_nat_gateway" "ngws" {
  count = local.create_vpc? 0 : length(data.aws_nat_gateways.ngws[0].ids)
  id = data.aws_nat_gateways.ngws[0].ids[count.index]


}

module "vpc" {
  count = local.create_vpc ? 1 : 0
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.prefix}-vpc"
  cidr = local.cidr

  azs             = local.azs
  private_subnets = local.private_subnet_cidr
  public_subnets  = local.public_subnet_cidrs

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = local.tags
}

  
resource "aws_security_group_rule" "allow_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = local.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allow_known_ingress" {
  security_group_id = local.sg_id
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  prefix_list_ids   = [aws_ec2_managed_prefix_list.well-known.id]
  # cidr_blocks       = [local.cidr]
}
resource "aws_ec2_managed_prefix_list" "well-known" {
  name           = "${local.prefix} Well known CIDRs"
  address_family = "IPv4"
  max_entries    = length(local.well-knowns)


  dynamic "entry" {
    for_each =  local.well-knowns
    content {
      cidr        = entry.value.cidr
      description = entry.value.description
    }

  }
}
data "http" "my-ip" {
  url = "https://ifconfig.me"
}

data "http" "talos-ami" {
  url = "https://github.com/siderolabs/talos/releases/download/v1.7.0/cloud-images.json"
}
locals {
  talos-amis-json = jsondecode(data.http.talos-ami.response_body)
  talos-ami       = one([for each in local.talos-amis-json : each.id if each.cloud == "aws" && each.region == data.aws_region.current.name && each.arch == "amd64"])
}


resource "tls_private_key" "sshkey" {
  algorithm = "RSA"
}
resource "local_file" "sshkey" {
  filename = "${path.root}/private/sshkey"
  content = tls_private_key.sshkey.private_key_openssh
  file_permission = "0600"
}
resource "local_file" "sshkey-public-key" {
  filename = "${path.root}/private/sshkey.pub"
  content = tls_private_key.sshkey.public_key_openssh
  file_permission = "0600"
}
resource "aws_key_pair" "sshkey" {
  key_name   = "${local.prefix}-sshkey"
  public_key = tls_private_key.sshkey.public_key_openssh
}


resource "aws_lb" "lb" {
  name                       = "${local.prefix}-lb"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = local.public_subnets
  enable_deletion_protection = false
  security_groups            = [local.sg_id]
}


resource "aws_lb_target_group" "k8s-api" {
  name        = "${local.prefix}-k8s-api"
  port        = 6443
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = local.vpc_id
}
resource "aws_lb_listener" "k8s-api" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.k8s-api.arn
  }
}
resource "aws_lb_target_group" "talos-50000" {
  name        = "${local.prefix}-talos-50000"
  port        = 50000
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = local.vpc_id
}
resource "aws_lb_listener" "talos-50000" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "50000"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.talos-50000.arn
  }
}
resource "aws_lb_target_group" "talos-50001" {
  name        = "${local.prefix}-talos-50001"
  port        = 50001
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = local.vpc_id
}
resource "aws_lb_listener" "talos-50001" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "50001"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.talos-50001.arn
  }
}

resource "null_resource" "talos-config-generator" {
  triggers = {
    lb = aws_lb.lb.id
  }
  provisioner "local-exec" {
    working_dir = "${path.root}/private"
    command = "talosctl gen config ${local.prefix} https://${aws_lb.lb.dns_name}:443 --additional-sans ${aws_lb.lb.dns_name} --with-examples=false --with-docs=false --force"
  }
  provisioner "local-exec" {
    when    = destroy
    working_dir = "${path.root}/private"
    command = "rm -rf talosconfig worker.yaml controlplane.yaml"
  }
  depends_on = [ aws_lb.lb ]
}

data "local_file" "controlplane" {
  filename = "${path.root}/private/controlplane.yaml"
  depends_on = [ null_resource.talos-config-generator ]
}
data "local_file" "worker" {
  filename = "${path.root}/private/worker.yaml"
  depends_on = [ null_resource.talos-config-generator ]
}
data "local_file" "talosconfig" {
  filename = "${path.root}/private/talosconfig"
  depends_on = [ null_resource.talos-config-generator ]
}

resource "aws_iam_instance_profile" "iam-profile" {
  name = "${local.prefix}-ec2_profile"
  role = aws_iam_role.iam-role.name
}
resource "aws_iam_role" "iam-role" {
  name               = "${local.prefix}-ec2-ssm-role"
  description        = "The role for the developer resources EC2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
}
resource "aws_iam_role_policy_attachment" "ssm-policy" {
  role       = aws_iam_role.iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_instance" "control-plane" {
  for_each = local.private-subnet-by-az
  # count = length(local.control-plane-azs)
  ami             = local.talos-ami
  instance_type   = "t3.large"
  subnet_id       = each.value
  security_groups = [local.sg_id]
  iam_instance_profile = aws_iam_instance_profile.iam-profile.name
  user_data = data.local_file.controlplane.content
  key_name = aws_key_pair.sshkey.key_name
  tags = {
    Name = "${local.prefix}-cp-${each.key}"
  }
  lifecycle {
    ignore_changes = [
      security_groups
    ]
  }
}
resource "aws_lb_target_group_attachment" "k8s-api" {
  for_each         = aws_instance.control-plane
  target_group_arn = aws_lb_target_group.k8s-api.arn
  target_id        = each.value.id
  port             = 6443
}

resource "aws_lb_target_group_attachment" "talos-50000" {
  for_each         = aws_instance.control-plane
  target_group_arn = aws_lb_target_group.talos-50000.arn
  target_id        = each.value.id
  port             = 50000
}
resource "aws_lb_target_group_attachment" "talos-50001" {
  for_each         = aws_instance.control-plane
  target_group_arn = aws_lb_target_group.talos-50001.arn
  target_id        = each.value.id
  port             = 50001
}

resource "aws_instance" "worker" {
  for_each        = local.workers-config
  ami             = local.talos-ami
  instance_type   = "t3.2xlarge"
  subnet_id       = each.value.subnet
  security_groups = [local.sg_id]
  iam_instance_profile = aws_iam_instance_profile.iam-profile.name
  user_data = data.local_file.worker.content
  key_name = aws_key_pair.sshkey.key_name
  tags = {
    Name = each.key
  }
  lifecycle {
    ignore_changes = [
      security_groups
    ]
  }
}

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240411"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
    owners = ["099720109477"]
}

data "cloudinit_config" "bastion" {
  gzip          = true
  base64_encode = true
  part {
    filename     = "cloud-config.yaml"
    content_type = "text/cloud-config"

    content = templatefile("${path.module}/templates/bastion.yaml",{
      ssh-public-key = tls_private_key.sshkey.public_key_openssh
      ssh-private-key = tls_private_key.sshkey.private_key_openssh
      talosconfig = data.local_file.talosconfig.content
      controlplane-yaml = data.local_file.controlplane.content
      worker-yaml = data.local_file.worker.content
      control-plane-node = values(aws_instance.control-plane).*.private_ip[0]
    })
  }
}

resource "aws_instance" "bastion" {
  count = var.use-bastion ? 1 :0
  ami             = data.aws_ami.ubuntu.image_id
  instance_type   = "t3.2xlarge"
  subnet_id       = local.public_subnets[0]
  associate_public_ip_address = true
  security_groups = [local.sg_id]
  iam_instance_profile = aws_iam_instance_profile.iam-profile.name
  user_data_base64 = data.cloudinit_config.bastion.rendered
  key_name = aws_key_pair.sshkey.key_name
  tags = {
    Name = "${local.prefix}-bastion"
  }
  lifecycle {
    ignore_changes = [
      security_groups
    ]
  }
  depends_on = [ null_resource.talos-config-generator ]
}


