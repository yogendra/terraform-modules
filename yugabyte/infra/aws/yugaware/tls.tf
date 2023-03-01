
resource "tls_private_key" "portal" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "portal-01" {
  private_key_pem = tls_private_key.portal.private_key_pem

  subject {
    common_name  = "${var.prefix} - YugabyteDB Anywhere"
    organization = "Yugabyte"
  }

  dns_names = [
    "localhost",
    "*.${var.internal-db-domain}"
  ]
  validity_period_hours = 1 * 365 * 24

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
