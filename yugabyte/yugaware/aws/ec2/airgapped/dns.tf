
resource "aws_route53_record" "internal-portal-01" {
  zone_id = module.internal-db-zone.zone_id
  name    = local.portal-internal-fqdn
  type    = "CNAME"
  ttl     = "5"
  records = [data.aws_instance.portal-01.private_dns]
}

