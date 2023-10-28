
## YBA Namesapce
resource "kubernetes_namespace" "yba" {
  metadata {
    name = "yba"
  }
}

## YBA Pull Secret
resource "kubernetes_manifest" "yugabyte-k8s-pull-secret" {

  manifest = merge(
    yamldecode(local.yba-pull-secret), {
      metadata = {
        namespace = "yba"
        name      = "yugabyte-k8s-pull-secret"
      }
  })
  depends_on = [
    kubernetes_namespace.yba
  ]
}

## YBA Install
resource "helm_release" "yba" {
  name    = "yba"
  version = local.yba-version

  repository       = "https://charts.yugabyte.com"
  chart            = "yugaware"
  create_namespace = true
  namespace        = "yba"
  values = [
    templatefile("${path.module}/templates/yba-values.yaml", {
      yba-domain = local.yba-domain
      yba-prometheus-domain = local.yba-prometheus-domain
    })
  ]
  depends_on = [
    kubernetes_manifest.yugabyte-k8s-pull-secret
  ]
}

## YBA Ingress
resource "kubernetes_manifest" "yba-ingress" {

  manifest = merge(
    yamldecode(
      templatefile(
        "${path.module}/templates/yba-ingress.template.yaml", {
          yba-domain = local.yba-domain
          yba-prometheus-domain = local.yba-prometheus-domain
        }
      )
      ), {
      metadata = {
        namespace = "yba"
        name      = "yba-ingress"
      }
  })
  depends_on = [
    kubernetes_namespace.yba
  ]
}

provider "yba" {
  alias = "unauthenticated"
  host  = local.yba-domain

}

resource "yba_customer_resource" "superadmin" {
  provider = yba.unauthenticated
  code     = "admin"
  email    = local.yba-username
  name     = "Super Admin"
}


data "http" "yb-eks-region-metadata" {
  url    = "https://raw.githubusercontent.com/yugabyte/yugabyte-db/master/managed/src/main/resources/configs/kubernetes/eks-region-metadata.yml"
  method = "GET"
}
locals {
  yb-eks-region-metadata = yamldecode(data.http.yb-eks-region-metadata.response_body)
  yba-customer-uuid      = yba_customer_resource.superadmin.cuuid
  yba-customer-api-url   = "${local.yba-api-url}/customers/${local.yba-customer-uuid}"
  yba-api-token          = yba_customer_resource.superadmin.api_token
  yba-pull-secret        = yamlencode(yamldecode(file(local.yugabyte_k8s_pull_secret)))
  yba-provider-eks-request = jsonencode({
    code = "kubernetes"
    name = "${local.project-name}-eks"
    details = {
      airGapped = false
      cloudInfo = {
        kubernetes = {
          kubernetesPullSecretContent   = local.yba-pull-secret
          kubernetesImageRegistry       = "quay.io/yugabyte/yugabyte"
          kubernetesProvider            = "eks"
          kubernetesPullSecretName      = "yugabyte-k8s-pull-secret"
          kubernetesImagePullSecretName = "yugabyte-k8s-pull-secret"
        }
      }
    }
    regions = [
      {
        code = data.aws_region.current.name
        name = local.yb-eks-region-metadata[data.aws_region.current.name].name
        zones = [for idx, az in local.azs :
          {
            code = az,
            name = az,
            details = {
              cloudInfo = {
                kubernetes = {
                  kubernetesStorageClass = "gp3"
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
provider "yba" {
  host      = local.yba-domain
  api_token = local.yba-api-token
}
