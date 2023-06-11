resource "google_service_account" "yba-sa" {
  account_id   = "${var.prefix}-yba"
  display_name = "${var.prefix} YBA Service Account"
}
resource "google_project_iam_member" "yba-sa-owner-binding" {
  project = data.google_project.current.project_id
  role    = "roles/owner"
  member  = google_service_account.yba-sa.member
}
resource "google_service_account_key" "yba-sa-key" {
  service_account_id = google_service_account.yba-sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_storage_bucket_object" "gcp-sa" {
  name   = "scripts/${local.gcp-sa-key-filename}"
  content_type = "application/json"
  content = base64decode(google_service_account_key.yba-sa-key.private_key)
  bucket = google_storage_bucket.asset-bucket.name
}


resource "google_service_account" "ws-sa" {
  account_id   = "${var.prefix}-ws"
  display_name = "${var.prefix} Workstation Service Account"
}
resource "google_project_iam_member" "ws-sa-viewer-binding" {
  project = data.google_project.current.project_id
  role    = "roles/viewer"
  member  = google_service_account.ws-sa.member
}

resource "google_project_iam_member" "participant-iam-account" {
  for_each = toset(var.participants)
  project = data.google_project.current.project_id
  role    = "roles/viewer"
  member  = "user:${each.key}"
}

resource "google_project_iam_member" "instructor-iam-account" {
  for_each = toset(var.instructors)
  project = data.google_project.current.project_id
  role    = "roles/editor"
  member  = "user:${each.key}"
}

resource "google_service_account_iam_binding" "allow-use-yba-sa" {
  service_account_id = google_service_account.yba-sa.name
  role = "roles/iam.serviceAccountUser"
  members = formatlist("user:%s", local.attendees)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}

resource "google_service_account_iam_binding" "allow-use-ws-sa" {
  service_account_id = google_service_account.ws-sa.name
  role = "roles/iam.serviceAccountUser"
  members = formatlist("user:%s", local.attendees)
  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}

resource "google_project_iam_custom_role" "attendees-project-role" {
  role_id     = replace("${var.prefix}_attendee_project_role", "-","_")
  title       = "${var.prefix} - Attendees"
  description = "${var.prefix} - Role for attendees"
  permissions = ["compute.instances.setMetadata", "iap.tunnelInstances.accessViaIAP"]
}
