
resource "aws_route53_zone" "internal-db-zone" {
  name = var.internal_db_domain
  vpc {
    vpc_id  = var.vpc_id
  }
}

resource "aws_route53_record" "internal-portal-01" {
  zone_id = aws_route53_zone.internal-db-zone.zone_id
  name    = local.portal-internal-fqdn
  type    = "CNAME"
  ttl     = "5"
  records = [aws_instance.yba.private_dns]
}

