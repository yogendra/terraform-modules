data "google_dns_managed_zone" "workshop-dns-zone" {
  name = var.gcp-dns-zone
}
resource "google_dns_record_set" "yba-dns" {
  name = "${var.yba-fqdn}."
  type = "A"
  ttl  = 30
  managed_zone = var.gcp-dns-zone
  rrdatas = [ google_compute_instance.yba.network_interface.0.access_config.0.nat_ip]
}

