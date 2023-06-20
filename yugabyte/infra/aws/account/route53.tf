resource "aws_route53_zone" "internal-db-zone" {
  name = "${var.prefix}-ybdb.internal"
  vpc {
    vpc_id = local.vpc-id
    vpc_region = local.vpc-region
  }
  lifecycle {
    ignore_changes = [ vpc ]
  }
}
