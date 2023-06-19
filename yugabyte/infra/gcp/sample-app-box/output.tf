
output "vm" {
  value =  aws_instance.vm
}

output "vm-private-ip" {
  value =  aws_instance.vm.private_ip
}

output "vm-public-ip" {
  value =  aws_instance.vm.public_ip
}
output "vm-instance-id" {
  value =  aws_instance.vm.id
}
