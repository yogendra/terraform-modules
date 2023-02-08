
output "yba-instance-01" {
  value = module.yba-portal-01.ec2_ids[0]
}

output "yba-info" {
  value = <<-INFO
## YBA Manual AWS Config Settings

  * Hosted Zone ID       : ${module.internal-db-zone.zone_id}
  * VPC ID               : ${var.management_vpc_id}
  * Region               : ${var.region}
  * DB Security Group ID : ${module.subnets.sg_db}
  * DB AMI               : ${var.yba-db-ami}
  * AZ Subnets
  %{~for i, az in var.az_list}
  * ${az}    : ${module.subnets.subnet_ids_db[i]}
  %{~endfor}

## Package Bucket

ID             : ${module.yba-packages-bucket.s3_bucket_id}
ARN            : ${module.yba-packages-bucket.s3_bucket_arn}
Domain Name    : ${module.yba-packages-bucket.s3_bucket_domain_name}
Hosted Zone ID : ${module.yba-packages-bucket.s3_bucket_hosted_zone_id}
Region         : ${module.yba-packages-bucket.s3_bucket_region}

## Backup Bucket

ID             : ${module.yba-backup-bucket.s3_bucket_id}
ARN            : ${module.yba-backup-bucket.s3_bucket_arn}
Domain Name    : ${module.yba-backup-bucket.s3_bucket_domain_name}
Hosted Zone ID : ${module.yba-backup-bucket.s3_bucket_hosted_zone_id}
Region         : ${module.yba-backup-bucket.s3_bucket_region}
  INFO
}

output "debug-tips" {
  value = <<-INFO

## Connect to YBA Node(s)
%{for i in module.yba-portal-01.ec2_ids[*]}
  SSH
    aws ssm start-session --target ${i}

  Replicated Port Forward
    aws ssm start-session --target ${i} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["8800"],"localPortNumber":["8800"]}'
  YugabyteDB Anywhere Port Forward
    aws ssm start-session --target ${i} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["443"],"localPortNumber":["8080"]}'
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
    YB_PASSWORD='$YB_PASSWORD'"> $PROJECT_DIR/private/.pyenv

    echo "Host temp-gcc-yba-portal-01
      IdentityFile $PWD/poc-usecase1/kp-yugabyte-01-poc-usecase1iena
      User ec2-user
      UserKnownHostsFile /dev/null
      StrictHostKeyChecking no
      ProxyCommand bash -c \"aws ssm start-session --target ${module.yba-portal-01.ec2_ids[0]} --profile $AWS_PROFILE --region ap-southeast-1 --document-name AWS-StartSSHSession --parameters 'portNumber=%p'\"" > ~/.ssh/configs/temp-gcc-yba-portal-01

    echo aws ssm start-session --target ${module.yba-portal-01.ec2_ids[0]}

    # Replicated Port Forward
    echo aws ssm start-session --target ${module.yba-portal-01.ec2_ids[0]} --document-name AWS-StartPortForwardingSession \
        --parameters '{"portNumber":["8800"],"localPortNumber":["8800"]}' &

    # YugabyteDB anywhere Port Forward
    echo aws ssm start-session --target ${module.yba-portal-01.ec2_ids[0]} --document-name AWS-StartPortForwardingSession \
        --parameters '{"portNumber":["80"],"localPortNumber":["8080"]}' &
  SSH
}




