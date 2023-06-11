
module "infra" {
  source = "${path.module}/modules/infra"
  prefix = local.prefix
  domain = local.domain
  owner = local.main-instructor.google-account
  instructors = local.instructor-google-accounts
  participants = local.participant-google-accounts
  license = local.license-file
  expiry = local.expiry
  yba-fqdn = local.yba-fqdn
  gcp-dns-zone = local.gcp-workshop-root-dns-zone
  providers = {
    acme = acme
  }
  allowed-cidrs = local.allowed-cidrs
  yba-superadmin-password = var.default-password
  yba-release = var.yba-release
}
module "participant" {
  count = length(local.participants)
  source = "${path.module}/modules/participant"
  asset-bucket = local.asset-bucket
  prefix = "${local.prefix}-p${count.index + 1}"
  participant = local.participant-google-accounts[count.index]
  participant-id = count.index + 1
  instructors = local.instructor-google-accounts
  gcp-dns-zone = local.gcp-workshop-root-dns-zone
  domain = local.domain
  expiry = local.expiry
  gcp-attendee-role = module.infra.attendee-role
  password = var.default-password
  gcp-vm-sa =  module.infra.ws-vm-sa-email
  depends_on = [ module.infra ]
}

