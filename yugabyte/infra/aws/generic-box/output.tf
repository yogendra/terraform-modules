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
  value = length(var.aws-public-hosted-zone-name) > 0 ? aws_route53_record.vm-public-dns[0].fqdn : ""
}
output "vm-private-fqdn" {
  value = length(var.aws-private-hosted-zone-name) > 0 ? aws_route53_record.vm-private-dns[0].fqdn : ""
}

output "vm-ssh-command-template" {
  value = <<EOF
  SSM        : ssh ubuntu@ssm.${aws_instance.vm.id}.$AWS_PROFILE.${data.aws_region.current.name}
%{if var.assign-public-ip ~}
  Direct SSH : ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i $PRIVATE_KEY yugabyte@${aws_eip.vm-public-ip[0].public_ip}
               ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i $PRIVATE_KEY yugabyte@${aws_route53_record.vm-public-dns[0].fqdn}
%{endif~}
EOF
}
