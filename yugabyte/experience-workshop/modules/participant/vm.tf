data "google_compute_image" "vm_image" {
  project  = "ubuntu-os-cloud"
  family = "ubuntu-2004-lts"
}

data "cloudinit_config" "ci" {
  gzip          = false
  base64_encode = false


  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/app-cloud-init.yaml", {
      asset-bucket-location = "gs://${var.asset-bucket}"
      vm-fqdn = local.app-vm-dns
      password = local.password
    })
  }
}


resource "google_compute_instance" "app-vm" {
  name         = "${var.prefix}-app-vm"
  machine_type = var.gcp-machine-type
  zone         = var.gcp-primary-zone

  tags = ["app-vm"]
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = data.google_compute_image.vm_image.self_link
      size = 250
    }
  }
  network_interface {
    network = var.gcp-network

    access_config {
      // Ephemeral public IP
    }
  }

  labels = local.default_tags

  metadata = {
    user-data = "${data.cloudinit_config.ci.rendered}"
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.gcp-vm-sa
    scopes = ["cloud-platform"]
  }
  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}

