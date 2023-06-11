output "iac-bucket" {
  value = aws_s3_bucket.iac-assets.bucket
}

output "iac-state-prefix" {
  value = "states"
}
output "iac-assets-prefix" {
  value = "assets"
}
