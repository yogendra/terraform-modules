output "db-node" {
  value = module.db-node
}
output "node-ip" {
  value = module.db-node.vm-private-ip
}
output "cloud-localtion" {
  value = local.ydb-cloud-location
}
