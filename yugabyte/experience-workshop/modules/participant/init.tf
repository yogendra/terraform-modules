terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.0"
    }
    google = {
      source = "hashicorp/google"
    }
  }
}

locals{
  app-vm-dns = "p${var.participant-id}-app-vm.${var.domain}"
  password = var.password
  expiry_title = "expired_after_soon"
  expiry_desc = "Expiring at ${var.expiry}"
  expiry_expression  = "request.time < timestamp(\"${var.expiry}\")"

  default_tags = merge(var.tags, {
    workshop = var.prefix
    owner = substr(replace(split("@", var.participant)[0], ".", "-"), 0, 63)
  })

  users = concat([var.participant], var.instructors)
}
data "google_project" "current" {
}
