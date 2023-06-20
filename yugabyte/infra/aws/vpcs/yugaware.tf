
locals {
  yb-aws-cloud-provider-config = {
    name                    = "aws-${var.prefix}"
    air-gapped              = true
    internal-hosted-zone-id = var.db-zone-id
    internal-hosted-domain  = var.db-zone-name
    ssh-port                = 22
    ssh-user                = "ec2-user"
    regions = {
      for region, vpc in local.vpc-by-region : region => {
        security-group = vpc.sg-yb-db-nodes
        architecture   = "x86_64"
        vpc_id         = vpc.vpc-id
        az-subnets = {
          for zone, subnets in vpc.private-subnet-by-az : zone => subnets[0]
        }
      }
    }
  }
}
