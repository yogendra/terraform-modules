provider "aws" {
  default_tags {

    tags = {
      "yb-task" = "test"
      "yb-tf-module" = "github.comyogendra/terraform-modules/yugabyte/aws/generic-box/test"
    }
  }
}
locals {
  subnet = "subnet-0f80c2725cafab73b"
  keypair ="shr-0"
  security-groups = ["sg-09fe348b872db4f7d"]
  private-hosted-zone = "Z049254415LX47SHT1KMU"
  public-hosted-zone = "Z04311021JK3VSZKS3Q9R"

}
module "basic" {
  source = "../"
  name = "gbtest-basic"
  prefix = "test-1"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
}

module "private-dns" {
  source = "../"
  name = "gbtest-pvt-dns"
  prefix = "test-2"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
  aws-private-hosted-zone-id = local.private-hosted-zone
}

module "assign-public-ip" {
  source = "../"
  name = "gbtest-public"
  prefix = "test-3"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
  # aws-private-hosted-zone-id = local.private-hosted-zone
  assign-public-ip = true
}

module "assign-public-ip-and-private-dns" {
  source = "../"
  name = "gbtest-private-dns"
  prefix = "test-4"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
  aws-private-hosted-zone-id = local.private-hosted-zone
  assign-public-ip = true
}

module "assign-public-ip-and-private-dns-and-public-dns" {
  source = "../"
  name = "gbtest-all-dns"
  prefix = "test-5"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
  aws-private-hosted-zone-id = local.private-hosted-zone
  aws-public-hosted-zone-id = local.public-hosted-zone
  assign-public-ip = true
}


module "data-disk" {
  source = "../"
  name = "data-disk-test"
  prefix = "test-6"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
  disk-count = 1
}
output "data-disk" {
  value = module.data-disk
}
module "data-disk-custom-mount-point" {
  source = "../"
  name = "data-disk-test"
  prefix = "test-8"
  aws-subnet-id = local.subnet
  aws-keypair-name = local.keypair
  aws-security-group-ids = local.security-groups
  mount-points = ["/home/yugabyte/data/disk0"]
  disk-count = 1
}
output "data-disk-custom-mount-point" {
  value = module.data-disk-custom-mount-point
}
