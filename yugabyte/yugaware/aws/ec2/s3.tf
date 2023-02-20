// packages bucket
// backup bucket

resource "aws_s3_bucket" "yba-backup" {
  bucket = "${var.prefix}-yba-backup"
}
resource "aws_s3_bucket_acl" "yba-backup" {
  bucket = aws_s3_bucket.yba-backup.id
  acl    = "private"
}
resource "aws_s3_bucket" "yba-packages" {
  bucket = "${var.prefix}-yba-packages"
}
resource "aws_s3_bucket_acl" "yba-package" {
  bucket = aws_s3_bucket.yba-packages.id
  acl    = "private"
}

locals {
  yb-version = replace(var.yb-release, "/-.+/", "")

  yba-airgap-filename = "yugaware-${var.yb-release}-linux-x86_64.airgap"
  yba-airgap-url      = "https://downloads.yugabyte.com/releases/${local.yb-version}/${local.yba-airgap-filename}"

  replicated-url      = "https://get.replicated.com/airgap"
  replicated-filename = "replicated.tar.gz"

}

resource "null_resource" "yba-package" {
  count = var.yba-online-install ? 0 : 1
  triggers = {
    package-hash = fileexists("${local.yba-airgap-filename}") ? filesha256("${local.yba-airgap-filename}") : ""
  }

  provisioner "local-exec" {
    command = "curl -sSL ${local.yba-airgap-url} -o ${local.yba-airgap-filename}"
  }
}

resource "null_resource" "replicated-package" {
  count = var.yba-online-install ? 0 : 1
  triggers = {
    package-hash = fileexists("${local.replicated-filename}") ? filesha256("${local.replicated-filename}") : ""
  }

  provisioner "local-exec" {
    command = "curl -sSL ${local.replicated-url} -o ${local.replicated-filename}"
  }
}

resource "aws_s3_object" "replicated-package" {
  count  = var.yba-online-install ? 0 : 1
  key    = "packages/replicated/${local.replicated-filename}"
  bucket = aws_s3_bucket.yba-packages.id
  source = local.replicated-filename
  depends_on = [
    null_resource.replicated-package
  ]
}

resource "aws_s3_object" "yba-package" {
  count  = var.yba-online-install ? 0 : 1
  key    = "packages/yugabyte/${local.yba-airgap-filename}"
  bucket = aws_s3_bucket.yba-packages.id
  source = local.yba-airgap-filename
  depends_on = [
    null_resource.yba-package
  ]
}
