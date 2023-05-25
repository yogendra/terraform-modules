
output "instance-id" {
  value = aws_instance.yba.id
}
output "yba"{
 value = aws_instance.yba
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
COMMAND
}


