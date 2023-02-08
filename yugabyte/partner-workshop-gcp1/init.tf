
terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
    }
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  project     = var.gcp-project-id
  region      = var.gcp-region
}
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
  # server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"

}
