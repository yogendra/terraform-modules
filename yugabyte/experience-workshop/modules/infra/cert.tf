resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.owner
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = "*.${var.domain}"
  subject_alternative_names = ["${var.domain}"]

  dns_challenge {
    provider = "gcloud"
    config = {
      GCE_PROJECT = data.google_project.current.project_id
    }
  }
}


resource "google_storage_bucket_object" "tls-certificate-pem" {
  name   = "certs/server-cert.pem"
  content_type = "application/octet-stream"
  content = acme_certificate.certificate.certificate_pem
  bucket = google_storage_bucket.asset-bucket.name
}

resource "google_storage_bucket_object" "tls-certificate-p12" {
  name   = "certs/server-cert.p12"
  content_type = "application/octet-stream"
  content = acme_certificate.certificate.certificate_p12
  bucket = google_storage_bucket.asset-bucket.name
}


resource "google_storage_bucket_object" "tls-private-key-pem" {
  name   = "certs/server-key.pem"
  content_type = "application/octet-stream"
  content = acme_certificate.certificate.private_key_pem
  bucket = google_storage_bucket.asset-bucket.name
}

resource "google_storage_bucket_object" "tls-issuer-pem" {
  name   = "certs/ca_cert.pem"
  content_type = "application/octet-stream"
  content = acme_certificate.certificate.issuer_pem
  bucket = google_storage_bucket.asset-bucket.name
}
