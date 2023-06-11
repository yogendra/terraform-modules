
# resource "google_compute_subnetwork" "gke" {
#   name          = "${var.prefix}-gke-subnet"
#   ip_cidr_range =  var.gke-subnet-cidr
#   region        = var.gcp-region
#   network       = var.gcp-network
#   secondary_ip_range {
#     range_name    = "services-range"
#     ip_cidr_range = var.gke-service-cidr
#   }

#   secondary_ip_range {
#     range_name    = "pod-ranges"
#     ip_cidr_range = var.gke-pod-cidr
#   }
# }

# resource "google_container_cluster" "gke" {
#   name               = "${var.prefix}-gke"
#   location           = var.gcp-region
#   initial_node_count = 1

#   network    = var.gcp-network
#   subnetwork = google_compute_subnetwork.gke.id

#   ip_allocation_policy {
#     cluster_secondary_range_name  = "pod-ranges"
#     services_secondary_range_name = google_compute_subnetwork.gke.secondary_ip_range.0.range_name
#   }
# }


# # Retrieve an access token as the Terraform runner
# data "google_client_config" "provider" {}


# provider "kubernetes" {
#   host  = "https://${google_container_cluster.gke.endpoint}"
#   token = data.google_client_config.provider.access_token
#   cluster_ca_certificate = base64decode(
#     data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate,
#   )
# }
