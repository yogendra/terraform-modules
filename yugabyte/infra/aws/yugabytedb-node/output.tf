output "this" {
  value = merge(module.this, {
    cloud-location = local.ydb-cloud-location.cloud_location
    additional-info = <<EOF
      Configure YufabyteDB Data Placement
      # Configure data placement for zone level toleration (execute on any one of the nodes)
      yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=zone --rf  3

      # Configure data placement for region level toleration (execute on any one of the nodes)
      yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=region --rf  3

      # YSQLSH
      ysqlsh -h ${module.this.vm-private-ip}


      # Master UI : http://${module.this.vm-private-ip}:7000
EOF
  })
}

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
output "additional-info"{
  value = <<EOF
${module.this.vm-ssh-command-template}

# Configure data placement for zone level toleration (execute on any one of the nodes)
yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=zone --rf  3

# Configure data placement for region level toleration (execute on any one of the nodes)
yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=region --rf  3
EOF
}
