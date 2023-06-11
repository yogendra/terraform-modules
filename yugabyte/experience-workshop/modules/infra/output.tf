output "yba" {
  value = google_compute_instance.yba
}
output "yba-dns" {
  value = var.yba-fqdn
}
output "yba-ip" {
  value =  google_compute_instance.yba.network_interface.0.access_config.0.nat_ip
}
output "tls" {
 value = acme_certificate.certificate.private_key_pem
}
output "backup-bucket" {
  value = google_storage_bucket.backup-bucket.name
}
output "attendee-role" {
  value = google_project_iam_custom_role.attendees-project-role.id
}
output "sa-key"{
  value = google_service_account_key.yba-sa-key.private_key
}


output "ws-vm-sa-email" {
  value = google_service_account.ws-sa.email
}
output "asset-bucket" {
  value = google_storage_bucket.asset-bucket.name
}

# Output variable
output "owner" {
  value = var.owner
}
output "prefix" {
  value = var.prefix
}
output "domain" {
  value = var.domain
}
output "participants" {
  value = var.participants
}
output "instructors" {
  value = var.instructors
}
output "license" {
  value = var.license
}
output "yba-fqdn" {
  value = var.yba-fqdn
}
output "expiry" {
  value = var.expiry
}
output "yba-machine-type" {
  value = var.yba-machine-type
}
output "yba-release" {
  value = var.yba-release
}
output "yba-superadmin-name" {
  value = var.yba-superadmin-name
}
output "yba-superadmin-email" {
  value = var.yba-superadmin-email
}
output "yba-superadmin-password" {
  value = var.yba-superadmin-password
}
output "yba-environment-type" {
  value = var.yba-environment-type
}
output "gcp-dns-zone" {
  value = var.gcp-dns-zone
}
output "gcp-primary-zone" {
  value = var.gcp-primary-zone
}
output "gcp-network" {
  value = var.gcp-network
}
output "gcp-region" {
  value = var.gcp-region
}
output "gcs-region" {
  value = var.gcs-region
}

output "allowed-cidrs" {
  value = var.allowed-cidrs
}
output "gke-subnet-cidr" {
  value = var.gke-subnet-cidr
}
output "gke-pod-cidr" {
  value = var.gke-pod-cidr
}
output "gke-service-cidr" {
  value = var.gke-service-cidr
}
