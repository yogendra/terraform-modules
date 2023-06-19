resource "aws_route53_zone" "internal-db-zone" {
  name = "${var.prefix}-ybdb.internal"
  lifecycle {
    ignore_changes = [ vpc ]
  }
}
