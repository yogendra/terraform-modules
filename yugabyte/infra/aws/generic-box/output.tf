output "vm-instance-id" {
  value = aws_instance.vm.id
}
output "vm-private-ip" {
  value = aws_instance.vm.private_ip
}
output "vm-public-ip" {
  value = var.assign-public-ip ?  aws_eip.vm-public-ip[0].public_ip : ""
}
output "vm-public-fqdn" {
  value = var.aws-public-hosted-zone-id != null && var.assign-public-ip ? aws_route53_record.vm-public-dns[0].fqdn : null
}
output "vm-private-fqdn" {
  value = var.aws-private-hosted-zone-id != null ? aws_route53_record.vm-private-dns[0].fqdn : null
}

output "vm-ssh-command-template" {
  value = <<EOF
  SSM        : ssh ubuntu@ssm.${aws_instance.vm.id}.$AWS_PROFILE.${data.aws_region.current.name}
%{if var.assign-public-ip ~}
  Direct SSH : ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i $PRIVATE_KEY yugabyte@${aws_eip.vm-public-ip[0].public_ip}
%{endif~}
%{if var.aws-public-hosted-zone-id != null ~}
               ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i $PRIVATE_KEY yugabyte@${aws_route53_record.vm-public-dns[0].fqdn}
%{endif~}
EOF
}
