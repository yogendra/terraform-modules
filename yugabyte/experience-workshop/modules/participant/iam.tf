resource "google_compute_instance_iam_binding" "allow-set-metadata" {
  instance_name = google_compute_instance.app-vm.name
  zone = var.gcp-primary-zone
  role = var.gcp-attendee-role
  members = formatlist("user:%s", local.users)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}



resource "google_compute_instance_iam_binding" "allow-login" {
  instance_name = google_compute_instance.app-vm.name
  zone = var.gcp-primary-zone
  role = "roles/compute.osLogin"
  members = formatlist("user:%s", local.users)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}

