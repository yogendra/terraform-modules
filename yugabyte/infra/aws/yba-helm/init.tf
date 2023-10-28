
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }
}

locals{
  project-name = local.project-name
  yba-version = var.yba-version
  yba-domain = var.yba-domain
  azs = var.azs
  yba-prometheus-domain = var.yba-prometheus-domain
  yba-api-url = "https://${local.yba-domain}/api/v1"
  yugabyte_k8s_pull_secret  = var.yugabyte_k8s_pull_secret == null ? "${path.root}/private/yugabyte-k8s-pull-secret.yaml": var.yugabyte_k8s_pull_secret
}
data "kubernetes_nodes" "nodes" {}
