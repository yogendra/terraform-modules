
output "vm-instance-id" {
  value = aws_instance.yba.id
}
output "vm-public-ip"{
 value = aws_instance.yba.public_ip
}

output "vm-private-ip"{
 value = aws_instance.yba.private_ip
}
output "vm-fqdn" {
  value =  length(var.aws-hosted-zone-name) > 0 ? aws_route53_record.vm-dns[0].fqdn : ""

}
output "superadmin-email" {
  value = var.yba-superadmin-email
}
output "superadmin-password" {
  value = var.yba-superadmin-password
}
output "version" {
  value = var.yba-version
}
output "api-token"{
  value = data.external.get-api-token.result.api-token
}
output "customer-id" {
  value = data.external.get-api-token.result.customer-id
}

output "user-id" {
  value = data.external.get-api-token.result.user-id
}

output "customer-api" {
  value = data.external.get-api-token.result.customer-api
}

output "api" {
  value = data.external.get-api-token.result.api
}


output "helper-commands" {
  value = <<COMMAND
# Create tunnel
aws ssm start-session --target ${aws_instance.yba.id}  --region ${data.aws_region.current.name} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["443"],"localPortNumber":["8443"]}'

# Start terminal session
aws ssm start-session --target ${aws_instance.yba.id} --region ${data.aws_region.current.name}

# Add SSH Alias
echo "Host ${var.prefix}-yba
  User ubuntu
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  ProxyCommand bash -c \"aws ssm start-session --target ${aws_instance.yba.id} --region ${data.aws_region.current.name} --document-name AWS-StartSSHSession --parameters 'portNumber=%p'\"" >> ~/.ssh/config

# SSH command
ssh  -i <private-key> ${var.prefix}-yba
%{ if length(local.fqdn) > 0 ~}
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i <private-key> ubuntu@${local.fqdn}
%{ endif ~}
COMMAND
}


