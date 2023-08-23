
locals {
  yb_version = split("-", var.release)[0]
  files = [
    {
      path        = "/home/yugabyte/bin/install_software.sh"
      binary      = false
      owner       = "yugabyte:yugabyte"
      permissions = "0711"
      content     = file("${path.module}/scripts/install_software.sh")
      defer       = true
      append      = false
    },
    {
      path        = "/home/yugabyte/bin/start_yugabyted.sh"
      binary      = false
      owner       = "yugabyte:yugabyte"
      permissions = "0711"
      content     = file("${path.module}/scripts/start_yugabyted.sh")
      defer       = true
      append      = false
    },
  ]
  startup-commands = [
    "sudo -u yugabyte /home/yugabyte/bin/install_software.sh ${local.yb_version}"
  ]
  boot-commands = []

  packages = [
    "wget"
  ]

  nodes = flatten([
    for itopology, topology in var.topology : [
      for inode, node in range(topology.nodes) : merge(
        topology,
        {
          arch                       = var.arch
          aws-instance-profile       = var.aws-instance-profile
          aws-keypair-name           = topology.keypair-name
          aws-private-hosted-zone-id = var.aws-private-hosted-zone-id
          aws-public-hosted-zone-id  = var.aws-public-hosted-zone-id
          aws-security-group-ids     = topology.security-group-ids
          aws-subnet-id              = topology.subnet-id
          aws-machine-type           = var.aws-machine-type
          boot-commands              = local.boot-commands
          files                      = local.files
          hostname                   = "${var.name}-${topology.region}-${inode}"
          master-gflags              = var.master-gflags
          cluster-name               = "${var.name}"
          packages                   = local.packages
          prefix                     = "ybdb"
          rf                         = var.rf
          startup-commands           = local.startup-commands
          topology-index             = itopology,
          topology-node-index        = inode
          tserver-gflags             = var.tserver-gflags
          yb-release                 = var.release
          yb-version                 = local.yb_version
          tags = merge(var.tags, {
            yb-distribution = "yugabyted"
            cluster-name    = "${var.name}"
            Name            = "${var.name}-${topology.region}-${inode}"
            zone-node-index = inode
          })
        }
      )
    ]
  ])
  
  node-config = [
    for idx, node in local.nodes : merge(node, {
      node-index = idx
      node-name  = "${var.name}-${idx}",
    })
  ]
  # first-node = node-config[0]
  # other-nodes = slice(node_config,1,length(node-config))
  node-by-region = {
    for i, nc in local.node-config : nc.region => nc...
  }
}
