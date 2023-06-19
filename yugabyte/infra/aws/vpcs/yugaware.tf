
locals {
  yb-aws-cloud-provider-config = {
    name                    = "aws-${var.prefix}"
    air-gapped              = true
    internal-hosted-zone-id = module.yb-account.db-zone-id
    internal-hosted-domain  = module.yb-account.db-zone-name
    ssh-port                = 22
    ssh-user                = "ec2-user"
    regions = {
      for region, vpc in local.vpc-by-region : region => {
        security-group = vpc.sg-yb-db-nodes
        architecture   = "x86_64"
        vpc_id         = vpc.vpc_id
        az-subnets = {
          for zone, subnets in vpc.private-subnet-by-az : zone => subnets[0]
        }
      }
    }
  }
}
