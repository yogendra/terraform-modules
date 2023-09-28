
output "vm-private-ip" {
  value = module.this.vm-private-ip
}
output "vm-private-fqdn" {
  value = module.this.vm-public-fqdn
}
output "vm-public-ip" {
  value = module.this.vm-public-ip
}
output "vm-public-fqdn" {
  value = module.this.vm-public-fqdn
}
output "vm-instance-id" {
  value = module.this.vm-instance-id
}
output "region" {
  value = data.aws_region.current.name
}
output "zone" {
  value = data.aws_subnet.subnet.availability_zone
}
