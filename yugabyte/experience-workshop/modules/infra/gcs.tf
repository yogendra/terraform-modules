# database backup bucket
resource "google_storage_bucket" "backup-bucket" {
  name = "${var.prefix}-backup"
  location = var.gcs-region
  uniform_bucket_level_access = true
}

# Allow instructors and YBA to read and write to backup bucket
resource "google_storage_bucket_iam_binding" "backup-bucket-access" {
  bucket = google_storage_bucket.backup-bucket.name
  role = "roles/storage.admin"
  members = concat(formatlist("user:%s", var.instructors), [google_service_account.yba-sa.member])

  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}

# Allow participants and their workstation to read backup bucket
resource "google_storage_bucket_iam_binding" "backup-bucket-readonly-access" {
  bucket = google_storage_bucket.backup-bucket.name
  role = "roles/storage.objectViewer"
  members = concat(
    formatlist("user:%s", var.participants),
    [google_service_account.ws-sa.member]
  )

  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}


# Asset bucket for keeping shared assets
resource "google_storage_bucket" "asset-bucket" {
  name = "${var.prefix}-assets"
  location = var.gcs-region
  uniform_bucket_level_access = true
}

# Allow instructor to read and write to asset buckets
resource "google_storage_bucket_iam_binding" "asset-bucket-access" {
  bucket = google_storage_bucket.asset-bucket.name
  role = "roles/storage.admin"
  members = formatlist("user:%s", var.instructors)

  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}


# Allow participants, yba and workstation to read from asset buckets
resource "google_storage_bucket_iam_binding" "asset-bucket-readonly-access" {
  bucket = google_storage_bucket.asset-bucket.name
  role = "roles/storage.objectViewer"
  members = concat(
    formatlist("user:%s", var.participants),
    [
      google_service_account.yba-sa.member,
      google_service_account.ws-sa.member
    ]
  )

  condition {
    title = local.expiry_title
    description = local.expiry_desc
    expression = local.expiry_expression
  }
}
