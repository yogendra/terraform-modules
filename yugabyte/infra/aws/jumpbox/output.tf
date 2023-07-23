output "vm-instance-id" {
  value =  aws_instance.vm.id
}
output "vm-private-ip" {
  value =  aws_instance.vm.private_ip
}
output "vm-public-ip" {
  value =  aws_instance.vm.public_ip
}
output "vm-fqdn" {
  value =  length(var.aws-hosted-zone-name) > 0 ? aws_route53_record.vm-dns[0].fqdn : ""
}
output "ssh-command-template" {
  value = var.assign-public-ip ?  "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $PRIVATE_KEY ubuntu@${aws_instance.vm.public_ip}" : "ssh ubuntu@ssm.${aws_instance.vm.id}.$AWS_PROFILE.${data.aws_region.current.name}"
}

output "ssh-config-template" {
  value =<<EOF
Host ${var.prefix}-jb
  Hostname ssm.${aws_instance.vm.id}.$AWS_PROFILE.${data.aws_region.current.name}
  IdentityFile  $PRIVATE_KEY
  User ubuntu
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  ProxyCommand bash -c "aws ec2-instance-connect send-ssh-public-key --profile $(echo %h|cut -d'.' -f3)  --region $(echo %h|cut -d'.' -f4) --instance-os-user %r --instance-id  $(echo %h|cut -d'.' -f2) --ssh-public-key file://$PRIVATE_KEY.pub &> /dev/null  ;aws ssm start-session --target $(echo %h|cut -d'.' -f2) --profile $(echo %h|cut -d'.' -f3) --region $(echo %h|cut -d'.' -f4) --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"

EOF
}
