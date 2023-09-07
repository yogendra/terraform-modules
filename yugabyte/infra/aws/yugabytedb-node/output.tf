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
output "cloud" {
  value = "aws"
}
output "cloud-location"{
  value = local.ydb-cloud-location.cloud_location
}
output "name" {
  value = module.this.name
}
output "hostname" {
  value = module.this.hostname
}
output "additional-info"{
  value = <<EOF
${module.this.vm-ssh-command-template}

## Query programs
YSQLSH        : ysqlsh -h ${module.this.vm-private-ip}
YSQLSH        : ycqlsh ${module.this.vm-private-ip}

## UI
Master UI     : http://${module.this.vm-private-ip}:7000
Tserver UI    : http://${module.this.vm-private-ip}:9000
Yugabyted Web : http://${module.this.vm-private-ip}:15433

## YB Cluster Configuration
Zone Level FT : yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=zone --rf  3
Regional FT   : yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=region --rf  3
EOF
}
