output "this" {
  value = merge(module.this, {
    node-ip = module.this.vm-private-ip
    cloud-location = local.ydb-cloud-location
    additional-info = <<EOF
# Configure data placement for zone level toleration (execute on any one of the nodes)
yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=zone --rf  3

# Configure data placement for region level toleration (execute on any one of the nodes)
yugabyted configure data_placement  --config ~/yugabyte-db/yugabyted.conf  --fault_tolerance=region --rf  3
EOF
  })
}

