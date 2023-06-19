
data "google_compute_image" "vm_image" {
  project  = "ubuntu-os-cloud"
  family = "ubuntu-2204-lts"
}

data "cloudinit_config" "ci" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/demobox-cloud-init.yaml", {
      strtup-commands = var.startup-commands
      boot-commands = var.boot-commands
    })
  }
}



resource "google_compute_instance" "vm" {
  name         = "${var.prefix}-appbox"
  machine_type = var.machine-type
  zone         = var.gcp-zone

  tags = ["appbox"]

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

  labels = var.tags

  metadata = {
    user-data = "${data.cloudinit_config.ci.rendered}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service-account-email
    scopes = ["cloud-platform"]
  }
  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}
