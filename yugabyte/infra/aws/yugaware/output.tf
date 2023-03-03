
output "yba" {
  value = aws_instance.yba.id
}

output "aws-yb-providers" {
  value = local.aws-yb-providers
}
output "yba-info" {
  value = <<-INFO
## Package Bucket

ID             : ${aws_s3_bucket.yba-packages.id}
ARN            : ${aws_s3_bucket.yba-packages.arn}
Domain Name    : ${aws_s3_bucket.yba-packages.bucket_domain_name}
Hosted Zone ID : ${aws_s3_bucket.yba-packages.hosted_zone_id}
Region         : ${aws_s3_bucket.yba-packages.region}

## Backup Bucket

ID             : ${aws_s3_bucket.yba-backup.id}
ARN            : ${aws_s3_bucket.yba-backup.arn}
Domain Name    : ${aws_s3_bucket.yba-backup.bucket_domain_name}
Hosted Zone ID : ${aws_s3_bucket.yba-backup.hosted_zone_id}
Region         : ${aws_s3_bucket.yba-backup.region}
  INFO
}

output "debug-tips" {
  value = <<-INFO

## Connect to YBA Node(s)
%{for i in [aws_instance.yba.id]}
  SSH
    aws ssm start-session --target ${i}

  Replicated Port Forward
    aws ssm start-session --target ${i} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["8800"],"localPortNumber":["8800"]}'
  YugabyteDB Anywhere Port Forward
    aws ssm start-session --target ${i} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["443"],"localPortNumber":["3000"]}'
%{endfor}
  INFO
}
output "debug-env" {
  value = <<-SSH
    export YB_PORTAL="https://localhost:3000"
    export YB_API="$YB_PORTAL/api/v1"
    export YB_USER="${var.yba-superadmin-email}"
    export YB_PASSWORD="${var.yba-superadmin-password}"
    echo "CLOUD_CONFIG_JSON='$( echo '${jsonencode(local.ybCloudConfig)}' | jq -c 'del(.portal)')'
    YB_PORTAL='$YB_PORTAL'
    YB_API='$YB_API'
    YB_USER='$YB_USER'
    YB_PASSWORD='$YB_PASSWORD'"> $PROJECT_DIR/private/.env-yba

    echo "Host ${var.prefix}-yba
      User cloud-user
      UserKnownHostsFile /dev/null
      StrictHostKeyChecking no
      ProxyCommand bash -c \"aws ssm start-session --target ${aws_instance.yba.id} --profile $AWS_PROFILE --region ap-southeast-1 --document-name AWS-StartSSHSession --parameters 'portNumber=%p'\"" > ~/.ssh/configs/temp-${var.prefix}-yba

    echo ssh                            : ssh -i ~/.ssh/id_rsa ${var.prefix}-yba
    echo ssm                            : aws ssm start-session --target ${aws_instance.yba.id}

    # Replicated Port Forward
    echo "ssm port forward to replicated: aws ssm start-session --target ${aws_instance.yba.id} --document-name AWS-StartPortForwardingSession --parameters '{\"portNumber\":[\"8800\"],\"localPortNumber\":[\"8800\"]}'" &

    # YugabyteDB anywhere Port Forward
    echo "ssm port forward to YBA       : aws ssm start-session --target ${aws_instance.yba.id} --document-name AWS-StartPortForwardingSession --parameters '{\"portNumber\":[\"443\"],\"localPortNumber\":[\"3000\"]}'" &
  SSH
}




