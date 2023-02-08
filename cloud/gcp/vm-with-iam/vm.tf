terraform {
    required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
resource "google_compute_instance" "yugaware" {
  name         = "${var.prefix}-${var.user-group-name}-yugaware"
  machine_type = var.yugaware-machine-type
  zone         = var.zone
  tags = ["yugaware", var.user-group-name]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.vm_image.self_link
      size = 100
    }
  }
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    network = var.gcp-network
    access_config {
    }
  }
  metadata = merge({ "user-group-name" = var.user-group-name}, var.tags)
  metadata_startup_script = "echo hi > /test.txt"
  service_account {
    email  = var.sa-email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance_iam_binding" "instance-iam-binding-login" {

  instance_name =  google_compute_instance.yugaware.name
  zone = var.zone
  role = "roles/compute.osLogin"
  members = formatlist("user:%s", var.user-emails)
  condition {
    title = var.expiry-title
    description = var.expiry-desc
    expression = var.expiry-expression
  }
}


resource "google_compute_instance_iam_binding" "instance-iam-binding-setmd" {
  instance_name = google_compute_instance.yugaware.name
  zone = var.primary-zone
  role = var.additional-role
  members = formatlist("user:%s", var.user-emails)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}
