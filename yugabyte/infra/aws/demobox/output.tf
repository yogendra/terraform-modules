
output "vm" {
  value =  aws_instance.demobox
}

output "vm-private-ip" {
  value =  aws_instance.demobox.private_ip
}

output "vm-public-ip" {
  value =  aws_instance.demobox.public_ip
}
output "vm-instance-id" {
  value =  aws_instance.demobox.id
}
