

resource "google_service_account" "yugabyte-sa" {
  account_id   = "${var.prefix}-yugabyte-sa"
  display_name = "${var.prefix} Service Account"
}

resource "google_project_iam_member" "yugaware-sa-owner-binding" {
  project = var.gcp-project-id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.yugabyte-sa.email}"
}
resource "google_service_account_key" "yugabyte-sa-key" {
  service_account_id = google_service_account.yugabyte-sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_custom_role" "attendees-project-role" {
  role_id     = replace("${var.prefix}_attendee_project_roles", "-","_")
  title       = "${var.prefix} - Attendees Project Role"
  description = "${var.prefix} - Project level role for attendees"
  permissions = ["compute.instances.setMetadata"]
}

resource "google_project_iam_member" "participant-iam-account" {
  for_each = toset(local.participants-email-list)
  project = var.gcp-project-id
  role    = "roles/viewer"
  member  = "user:${each.key}"
}

resource "google_project_iam_member" "instructor-iam-account" {
  for_each = toset(var.instructors)
  project = var.gcp-project-id
  role    = "roles/editor"
  member  = "user:${each.key}"
}


resource "google_service_account_iam_binding" "allow-use-sa" {
  service_account_id = google_service_account.yugabyte-sa.name
  role = "roles/iam.serviceAccountUser"
  members = formatlist("user:%s", local.attendees-email-list)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}

