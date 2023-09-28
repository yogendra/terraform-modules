module "this" {

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
  disk-count                 = 1
  disk-size-gb               = 5
  mount-points               = ["/var/lib/tailscale"]
  name                       = var.name
  prefix                     = var.prefix
  startup-commands = [
    "curl -fsSL https://tailscale.com/install.sh | sh",
    "systemctl enable --now tailscaled",
    "tailscale up ${var.tailscale-up-params}"
  ]

  tags = merge(var.tags, {
    yb_component = "tailscale-subnet-router"
  })
}
