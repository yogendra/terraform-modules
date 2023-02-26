output "yba-instance-profile" {
  value = aws_iam_instance_profile.yba.name
}

output "ssm-instance-profile" {
  value = aws_iam_instance_profile.ssm.name
}
