output "yba-instance-profile" {
  value = aws_iam_instance_profile.yba.name
}
output "yba-instance-profile-arn" {
  value = aws_iam_instance_profile.yba.arn
}
output "ssm-instance-profile" {
  value = aws_iam_instance_profile.ssm.name
}
output "ssm-instance-profile-arn" {
  value = aws_iam_instance_profile.ssm.arn
}
output "backup-bucket" {
  value = aws_s3_bucket.yba-backup.id
}
output "package-bucket" {
  value = aws_s3_bucket.yba-packages.id
}

output "db-zone-id" {
  value = aws_route53_zone.internal-db-zone.zone_id
}

output "db-zone-name" {
  value = aws_route53_zone.internal-db-zone.name
}
