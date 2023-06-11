data "http" "myip" {
  url = "https://ifconfig.me"
}

locals {
  prefix = var.prefix
  workshop-title = var.title
  expiry = var.expiry
  registration-form = var.registration-form
  participants = var.participants
  instructors = var.instructors
  allowed-cidrs = concat(var.allowed-networks, [
    "${chomp(data.http.myip.response_body)}/32"
  ])

  participant-google-accounts = [ for p in local.participants : p.google-account ]
  instructor-google-accounts = [ for i in local.instructors : i.google-account ]

  asset-bucket = module.infra.asset-bucket
  license-file = var.yba-license == "" ?  "${path.root}/private/yba.lic" : var.yba-license
  gcp-workshop-root-dns-zone = var.gcp-dns-zone
  workshop-domain = var.base-domain
  domain = "${local.prefix}.${local.workshop-domain}"
  yba-fqdn = "yba.${local.domain}"
  main-instructor = local.instructors[0]
}





