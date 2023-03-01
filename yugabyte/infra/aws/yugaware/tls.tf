
resource "tls_private_key" "portal" {
  count = var.yba-tls-key-pem != "" ? 0 : 1
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "portal-01" {
  count = var.yba-tls-key-pem != "" ? 0 : 1
  private_key_pem = tls_private_key.portal[0].private_key_pem

  subject {
    common_name  = "${var.prefix} - YugabyteDB Anywhere"
    organization = "Yugabyte"
  }

  dns_names = [
    "localhost"
  ]
  validity_period_hours = 1 * 365 * 24

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
