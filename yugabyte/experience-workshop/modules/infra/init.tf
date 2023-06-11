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
  expiry_title = "expired_after_soon"
  expiry_desc = "Expiring at ${var.expiry}"
  expiry_expression  = "request.time < timestamp(\"${var.expiry}\")"

  # YBA Installer Config
  yba-release = var.yba-release
  yba-version = split("-",var.yba-release)[0]
  gcp-sa-key-filename = "gcp-sa.json"
  attendees = concat(var.participants, var.instructors)

  default_tags = merge(var.tags, {
    workshop = var.prefix
    owner = split("@", var.owner)[0]
  })
}

data "google_project" "current" {
}
