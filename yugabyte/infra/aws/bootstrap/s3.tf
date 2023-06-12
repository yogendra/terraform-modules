
resource "aws_s3_bucket" "iac" {
  bucket = "${var.prefix}-iac"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "iac_versioning" {
  bucket = aws_s3_bucket.iac.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
locals {
  ignore_files = [
    ".DS_Store",
    ".gitignore",
    ".gitkeep"
  ]
  asset_source = "${path.root}/private"
  assets = toset([
    for i in fileset(local.asset_source,"**") :
      i if !contains(local.ignore_files, basename(i))
  ])
  mime_types = {
    ".html" = "text/html"
    ".json" = "application/json"
    ".lic" = "text/plain"
    ".pem" = "text/plain"
    ".pub" = "text/plain"
    ".sh" = "text/plain"
  }
}
resource "aws_s3_object" "object" {
  for_each = local.assets
  bucket = aws_s3_bucket.iac.bucket
  key    = "assets/${each.value}"
  source = "${local.asset_source}/${each.value}"


  content_type = length(regexall("\\.[^.]+$", each.key)) > 0 ? local.mime_types[regex("\\.[^.]+$", each.key)] : "binary/octet-stream"

  etag = filemd5("${local.asset_source}/${each.value}")
}
