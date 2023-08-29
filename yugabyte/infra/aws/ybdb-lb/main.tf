

locals {
  nginx-config = templatefile("${path.module}/templates/nginx.conf", {
    listener-port     = var.listener-port
    forward-addresses = var.forward-addresses
  })

}
module "lb" {

  source                     = "../generic-box"
  arch                       = var.arch
  hostname                   = var.hostname
  aws-ami                    = var.aws-ami
  assign-public-ip           = var.assign-public-ip
  aws-instance-profile       = var.aws-instance-profile
  aws-keypair-name           = var.aws-keypair-name
  aws-machine-type           = var.aws-machine-type
  aws-security-group-ids     = var.aws-security-group-ids
  aws-subnet-id              = var.aws-subnet-id
  aws-public-hosted-zone-id  = var.aws-public-hosted-zone-id
  aws-private-hosted-zone-id = var.aws-private-hosted-zone-id
  disk-count                 = 0
  files = [
    {
      path    = "/etc/nginx/nginx.conf"
      content = local.nginx-config
      defer   = true
    }
  ]
  name = "dssmdcmlb"
  packages = [
    "nginx"
  ]
  startup-commands = [
    "sudo systemctl enable nginx",
    "sudo systemctl start nginx"
  ]
  tags = merge(var.tags, {
    yb_component = "lb"
  })
  prefix = var.prefix
}
