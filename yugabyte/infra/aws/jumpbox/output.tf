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
