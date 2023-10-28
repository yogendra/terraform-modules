
## YBA Namesapce
resource "kubernetes_namespace" "yba" {
  metadata {
    name = local.yba-ns
  }
}

## YBA Pull Secret
resource "kubernetes_manifest" "yugabyte-k8s-pull-secret" {

  manifest = merge(
    yamldecode(local.yba-pull-secret), {
      metadata = {
        namespace = local.yba-ns
        name      = local.yba-k8s-pull-secret-name
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
  namespace        = local.yba-ns
  values = local.yba-values
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
        namespace = local.yba-ns
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



locals {
  yb-eks-region-metadata = yamldecode(data.http.yb-eks-region-metadata.response_body)
  yba-customer-uuid      = yba_customer_resource.superadmin.cuuid
  yba-customer-api-url   = "${local.yba-api-url}/customers/${local.yba-customer-uuid}"
  yba-api-token          = yba_customer_resource.superadmin.api_token
  yba-pull-secret        = yamlencode(yamldecode(file(local.yugabyte_k8s_pull_secret)))
  yba-provider-eks-request = local.yba-cloud-k8s-config
}
provider "yba" {
  host      = local.yba-domain
  api_token = local.yba-api-token
}
