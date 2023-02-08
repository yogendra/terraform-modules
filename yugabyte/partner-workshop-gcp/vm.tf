

resource "google_compute_instance" "yugaware" {
  for_each = var.participants
  name         = "${var.prefix}-${each.key}-yugaware"
  machine_type = var.yugaware-machine-type
  zone         = var.primary-zone

  tags = ["yugaware", each.key]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.vm_image.self_link
      size = 100
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.gcp-network

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = merge({ org = each.key}, var.tags)

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.yugabyte-sa.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance_iam_binding" "instance-iam-binding-login" {
  for_each = var.participants
  instance_name =  google_compute_instance.yugaware[each.key].name
  zone = var.primary-zone
  role = "roles/compute.osLogin"
  members = formatlist("user:%s", concat(each.value, var.instructors))
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}


resource "google_compute_instance_iam_binding" "instance-iam-binding-setmd" {
  for_each = var.participants
  instance_name = google_compute_instance.yugaware[each.key].name
  zone = var.primary-zone
  role = google_project_iam_custom_role.attendees-project-role.id
  members = formatlist("user:%s", concat(each.value, var.instructors))
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }

}




resource "google_compute_instance" "instructor-yugaware" {

  name         = "${var.prefix}-instructor-yugaware"
  machine_type = var.yugaware-machine-type
  zone         = var.primary-zone

  tags = ["yugaware", "instructor"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.vm_image.self_link
      size = 100
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.gcp-network

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = merge({ org = "instructor"}, var.tags)

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.yugabyte-sa.email
    scopes = ["cloud-platform"]
  }
}


resource "google_compute_instance_iam_binding" "instructor-instance-iam-binding-setmd" {
  instance_name = google_compute_instance.instructor-yugaware.name
  zone = var.primary-zone
  role = google_project_iam_custom_role.attendees-project-role.id
  members = formatlist("user:%s",var.instructors)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }

}

resource "google_compute_instance_iam_binding" "instructor-instance-iam-binding-login" {

  instance_name =  google_compute_instance.instructor-yugaware.name
  zone = var.primary-zone
  role = "roles/compute.osLogin"
  members = formatlist("user:%s", var.instructors)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}


