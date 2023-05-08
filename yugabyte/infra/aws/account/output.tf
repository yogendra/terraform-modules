output "yba-instance-profile" {
  value = aws_iam_instance_profile.yba.arn
}

output "ssm-instance-profile" {
  value = aws_iam_instance_profile.ssm.arn
}
