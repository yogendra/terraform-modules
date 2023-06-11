
terraform {
  required_providers {
    acme = {
      source = "vancluever/acme"
      version = "2.14.0"
    }
    google = {
      source = "hashicorp/google"
      version = "4.66.0"
    }
  }
}
