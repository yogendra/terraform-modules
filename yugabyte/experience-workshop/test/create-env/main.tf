terraform {
  required_providers {
    acme = {
      source = "vancluever/acme"
      version = "2.14.0"
    }
  }
  backend "gcs" {
     bucket = "yb-apj-workshop-assets"
     prefix  = "terraform-states/tws"
  }
}
output "info" {
  value = module.test-ws.info
}
provider "google" {
  project = "apj-partner-enablement"
}
variable "testing" {
  type = bool
  default = false
}
provider "acme" {
  server_url = var.testing ? "https://acme-staging-v02.api.letsencrypt.org/directory" : "https://acme-v02.api.letsencrypt.org/directory"
}

module "test-ws"{
  source = "../.."
  prefix = "tws"
  expiry = "2023-06-10T00:00:00Z"
  participants = [
    {
      name = "Yogi Personal"
      email = "yogendrarampuria@gmail.com"
      google-account = "yogendrarampuria@gmail.com"
    },
    # {
    #   name = "Yogi Family"
    #   email = "yogi@rampuria.org"
    #   google-account = "yogi@rampuria.org"
    # }
  ]
  instructors = [
    {
      name = "Yogi"
      email = "yrampuria@yugabyte.com"
      google-account = "yrampuria@yugabyte.com"

    },
    {
      name = "Ron"
      email = "rxing@yugabyte.com"
      google-account = "rxing@yugabyte.com"
    }
  ]
  providers = {
    acme = acme
  }
}
