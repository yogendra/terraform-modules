resource "aws_s3_bucket" "yba-backup" {
  bucket = "${var.prefix}-yba-backup"
}
resource "aws_s3_bucket" "yba-packages" {
  bucket = "${var.prefix}-yba-packages"
}
