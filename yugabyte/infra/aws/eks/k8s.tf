# Deploy common services
# Create ingress dns record
resource "kubernetes_manifest" "gp3" {
  manifest = yamldecode(file("${path.module}/templates/gp3.yaml"))
  depends_on = [ module.eks ]
}

resource "helm_release" "cert-manager" {
  name  = "cert-manager"
  version = "v1.13.1"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  create_namespace = true
  namespace = "cert-manager"
  skip_crds = false
  values = [
    file("${path.module}/templates/cert-manager-values.yaml")
  ]
}

# resource "local_exec" "letsencrypt-prod" {

# }

# resource "kubernetes_manifest" "letsencrypt-prod" {
#   manifest = yamldecode(
#     templatefile( "${path.module}/templates/letsencrypt-prod.yaml",{
#       email = local.owner-email
#       project-domain = local.project-domain
#       aws-hosted-zone-id = data.aws_route53_zone.project-hosted-zone.id
#       aws-region = data.aws_region.current.name
#     })
#   )
#   depends_on = [
#     helm_release.cert-manager,
#     kubernetes_secret.route53-credentials-secret
#   ]
# }



resource "helm_release" "nginx-ingress" {
  name  = "ingress-nginx"
  version = "4.8.3"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  create_namespace = true
  namespace = "ingress-nginx"
  skip_crds = false
  values = [
    file("${path.module}/templates/ingress-nginx-values.yaml")
  ]
}

data "kubernetes_service" "ingress-nginx-controller" {
  metadata {
    name = "ingress-nginx-controller"
    namespace = "ingress-nginx"
  }
  depends_on = [
    helm_release.nginx-ingress
   ]
}

resource "aws_route53_record" "ingress-star" {
  zone_id = local.project-route53-hosted-zone
  name    = "*.${local.project-domain}"
  type    = "CNAME"
  ttl     = 30
  records = [ data.kubernetes_service.ingress-nginx-controller.status[0].load_balancer[0].ingress[0].hostname ]
}
