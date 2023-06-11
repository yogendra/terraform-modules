data "google_compute_image" "vm_image" {
  project  = "ubuntu-os-cloud"
  family = "ubuntu-2004-lts"
}

resource "google_storage_bucket_object" "scripts" {
  for_each = fileset(path.module, "scripts/*.sh")
  name   = "${each.value}"
  content_type = "text/plain"
  content = file("${path.module}/${each.value}")
  bucket = google_storage_bucket.asset-bucket.name
}


resource "google_storage_bucket_object" "env-sh" {
  name   = "scripts/00-env.sh"
  content_type = "text/plain"
  content = templatefile("${path.module}/templates/00-env.sh",{
    yba_fqdn = var.yba-fqdn
    yba_release = var.yba-release
    yba_env = var.yba-environment-type
    yba_username = var.yba-superadmin-name
    yba_login = var.yba-superadmin-email
    yba_password = var.yba-superadmin-password
    gcp_sa_key = local.gcp-sa-key-filename
    gcp_network = var.gcp-network
    gcp_subnet = var.gcp-subnet
    gcp_backup_bucket = "gs://${google_storage_bucket.backup-bucket.name}"
    gcp_keyring_id = "${var.prefix}-keyring"
    gcp_cryptokey_id = "${var.prefix}-cryptokey"
  })
  bucket = google_storage_bucket.asset-bucket.name
}

resource "google_storage_bucket_object" "yba-ctl-yaml" {
  name   = "yba-ctl/yba-ctl.yml"
  content_type = "text/plain"
  content = templatefile("${path.module}/templates/yba-ctl.yml",{
    yba_fqdn = var.yba-fqdn
  })
  bucket = google_storage_bucket.asset-bucket.name
}

resource "google_storage_bucket_object" "yba-lic" {
  name   = "yba-ctl/yba.lic"
  content_type = "application/octet-stream"
  content = file(var.license)
  bucket = google_storage_bucket.asset-bucket.name
}

data "cloudinit_config" "yba" {
  gzip          = false
  base64_encode = false


  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/yba-cloud-init.yaml", {
      yba_fqdn = var.yba-fqdn
      asset-bucket-location = "gs://${google_storage_bucket.asset-bucket.name}"
      asset-local-dir = "/opt/workshop-assets"
    })
  }
}

resource "google_compute_instance" "yba" {
  name         = "${var.prefix}-yba"
  machine_type = var.yba-machine-type
  zone         = var.gcp-primary-zone

  tags = ["yba"]

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
    user-data = "${data.cloudinit_config.yba.rendered}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.yba-sa.email
    scopes = ["cloud-platform"]
  }
  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"]
    ]
  }
}

resource "google_compute_instance_iam_binding" "allow-attendees" {
  instance_name =  google_compute_instance.yba.name
  zone = var.gcp-primary-zone
  role = google_project_iam_custom_role.attendees-project-role.id
  members = formatlist("user:%s", local.attendees)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}
