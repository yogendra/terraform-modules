
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
data "http" "yb-eks-region-metadata" {
  url    = "https://raw.githubusercontent.com/yugabyte/yugabyte-db/master/managed/src/main/resources/configs/kubernetes/eks-region-metadata.yml"
  method = "GET"
}
data "kubernetes_nodes" "nodes" {}

locals{
  project-name = local.project-name
  yba-version = var.yba-version
  yba-domain = var.yba-domain
  yba-prometheus-domain = var.yba-prometheus-domain
  yba-api-url = "https://${local.yba-domain}/api/v1"
  yugabyte_k8s_pull_secret  = var.yugabyte_k8s_pull_secret == null ? "${path.root}/private/yugabyte-k8s-pull-secret.yaml": var.yugabyte_k8s_pull_secret
  yba-cloud-k8s-region = var.yba-cloud-k8s-region
  yba-cloud-k8s-azs = var.yba-cloud-k8s-azs
  yba-cloud-k8s-storage-class = var.yba-cloud-k8s-storage-class
  yba-cloud-k8s-image-registry = var.yba-cloud-k8s-image-registry
  yba-cloud-k8s-type = var.yba-cloud-k8s-type
  yba-ns = var.yba-ns

  yba-pull-secret        = yamlencode(yamldecode(file(local.yugabyte_k8s_pull_secret)))
  yba-default-values = templatefile("${path.module}/templates/yba-values.yaml", {
      yba-domain = local.yba-domain
      yba-prometheus-domain = local.yba-prometheus-domain
  })
  yba-values = [
    yba-default-values,
    (var.yba-helm-values-file != null)? file(var.yba-helm-values-file):""
  ]
  yba-k8s-pull-secret-name = "yugabyte-k8s-pull-secret"
  yba-cloud-k8s-config = jsonencode({
    code = "kubernetes"
    name = "${local.project-name}-${local.yba-cloud-k8s-type}"
    details = {
      airGapped = false
      cloudInfo = {
        kubernetes = {
          kubernetesPullSecretContent   = local.yba-pull-secret
          kubernetesImageRegistry       = local.yba-cloud-k8s-image-registry
          kubernetesProvider            = local.yba-cloud-k8s-type
          kubernetesPullSecretName      = local.yba-k8s-pull-secret-name
          kubernetesImagePullSecretName = local.yba-k8s-pull-secret-name
        }
      }
    }
    regions = [
      {
        code = local.yba-cloud-k8s-region
        name = local.yb-eks-region-metadata[local.yba-cloud-k8s-region].name
        zones = [for idx, az in local.yba-cloud-k8s-azs :
          {
            code = az,
            name = az,
            details = {
              cloudInfo = {
                kubernetes = {
                  kubernetesStorageClass = local.yba-cloud-k8s-storage-class
                }
              }
            }
          }
        ]
        details = {
          cloudInfo = {
            kubernetes = {}
          }
        }
      }
    ]
  })
}
