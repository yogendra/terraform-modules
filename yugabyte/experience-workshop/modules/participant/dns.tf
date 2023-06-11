resource "google_dns_record_set" "app-dns" {
  name = "${local.app-vm-dns}."
  type = "A"
  ttl  = 30
  managed_zone = var.gcp-dns-zone
  rrdatas = [ google_compute_instance.app-vm.network_interface.0.access_config.0.nat_ip]
}


resource "google_dns_record_set" "svc-dns" {
  name = "*.${local.app-vm-dns}."
  type = "A"
  ttl  = 30
  managed_zone = var.gcp-dns-zone
  rrdatas = [ google_compute_instance.app-vm.network_interface.0.access_config.0.nat_ip]
}
