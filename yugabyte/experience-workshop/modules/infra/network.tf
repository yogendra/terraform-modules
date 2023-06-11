data "google_compute_network" "network" {
  name = var.gcp-network
}
data "google_compute_subnetwork" "regional-subnet" {
  for_each = toset(data.google_compute_network.network.subnetworks_self_links)
  self_link = each.key
}
resource "google_compute_firewall" "allow-access" {
  name    = "${var.prefix}-workshop"
  network = var.gcp-network

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80", "443","3000","5000","5433","8080","8443","8800", "6379","7000", "7100","9100","9000","9042","30000-32767","54422"]
  }

  target_tags = ["yba","cluster-server", "app-vm"]
  source_ranges = var.allowed-cidrs
}
resource "google_compute_firewall" "allow-access-from-iap" {
  name    = "${var.prefix}-workshop-iap"
  network = var.gcp-network

  allow {
    protocol = "tcp"
    ports    = ["22","3389"]
  }

  target_tags = ["yba","cluster-server"]
  source_ranges = ["35.235.240.0/20"]
}
