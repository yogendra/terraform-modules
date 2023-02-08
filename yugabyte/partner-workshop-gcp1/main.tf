



locals {
  participants-email-list = flatten(values(var.participants))
  attendees-email-list = concat(local.participants-email-list, var.instructors)
  org_count = length(keys(var.participants))
  org_list = keys(var.participants)

  expiry_title = "expired_after_soon"
  expiry_desc = "Expiring at ${var.expiry}"
  expiry_expression  = "request.time < timestamp(\"${var.expiry}\")"

  http_cert_key_filename = "${var.prefix}-http-cert-key.pem"
  http_cert_filename = "${var.prefix}-http-cert.pem"
  http_cert_full_filename = "${var.prefix}-http-cert-full.pem"
  http_cert_issuer_filename = "${var.prefix}-http-cert-issuer.pem"
  cloud_sa_key_filename = "${var.prefix}-yugabyte-sa-key.secret.json"
  license_filename = "${var.prefix}-license.rli"

  workshop_instruction_bucket = "${var.prefix}-workshop-instruction"
  workshop_home = "https://storage.cloud.google.com/${local.workshop_instruction_bucket}"
  workshop_homepage = "${local.workshop_home}/index.html"
}


data "google_compute_image" "vm_image" {
  project  = "ubuntu-os-cloud"
  family = "ubuntu-2004-lts"
}


data "google_compute_regions" "available" {
}
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

  target_tags = ["yugaware","cluster-server"]
  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "allow-access-from-iap" {
  name    = "${var.prefix}-workshop-iap"
  network = var.gcp-network

  allow {
    protocol = "tcp"
    ports    = ["22","3389"]
  }

  target_tags = ["yugaware","cluster-server"]
  source_ranges = ["35.235.240.0/20"]
}






resource "google_storage_bucket" "backup-bucket" {
  for_each = var.participants
  name = "${var.prefix}-${each.key}-backup"
  location = var.gcs-region
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "backup-bucket-access" {
  for_each = var.participants

  bucket = google_storage_bucket.backup-bucket[each.key].name
  role = "roles/storage.admin"
  members = concat(formatlist("user:%s", concat(each.value, var.instructors)), ["serviceAccount:${google_service_account.yugabyte-sa.email}"])

  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}




resource "google_storage_bucket" "instructor-backup-bucket" {
  name = "${var.prefix}-instructor-backup"
  location = var.gcs-region
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "instructors-backup-bucket-access" {
  bucket = google_storage_bucket.instructor-backup-bucket.name
  role = "roles/storage.admin"
  members = concat(formatlist( "user:%s", var.instructors), ["serviceAccount:${google_service_account.yugabyte-sa.email}"])

  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}


