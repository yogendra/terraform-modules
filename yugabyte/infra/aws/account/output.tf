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
