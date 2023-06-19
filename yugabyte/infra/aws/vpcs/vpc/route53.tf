resource "aws_route53_zone_association" "db-zone-association" {
  zone_id = var.db-zone-id
  vpc_id  = aws_vpc.vpc.id
}
