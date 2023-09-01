provider "aws" {
  default_tags {

    tags = {
      "yb-task" = "test"
      "yb-tf-module" = "github.comyogendra/terraform-modules/yugabyte/aws/generic-box/test"
    }
  }
}
module "basic" {
  source = "../"
  name = "gbtest-basic"
  prefix = "test-1"
  aws-subnet-id = "subnet-012dc148"
  aws-keypair-name = "yb-15-aws-portal-1-key"
  aws-security-group-ids = ["sg-21c51347","sg-afc610c9"]
}

module "private-dns" {
  source = "../"
  name = "gbtest-pvt-dns"
  prefix = "test-2"
  aws-subnet-id = "subnet-012dc148"
  aws-keypair-name = "yb-15-aws-portal-1-key"
  aws-security-group-ids = ["sg-21c51347","sg-afc610c9"]
  aws-private-hosted-zone-id = "Z2LL3FHUFXGD90"
}

module "assign-public-ip" {
  source = "../"
  name = "gbtest-public"
  prefix = "test-3"
  aws-subnet-id = "subnet-012dc148"
  aws-keypair-name = "yb-15-aws-portal-1-key"
  aws-security-group-ids = ["sg-21c51347","sg-afc610c9"]
  # aws-private-hosted-zone-id = "Z2LL3FHUFXGD90"
  assign-public-ip = true
}

module "assign-public-ip-and-private-dns" {
  source = "../"
  name = "gbtest-private-dns"
  prefix = "test-4"
  aws-subnet-id = "subnet-012dc148"
  aws-keypair-name = "yb-15-aws-portal-1-key"
  aws-security-group-ids = ["sg-21c51347","sg-afc610c9"]
  aws-private-hosted-zone-id = "Z2LL3FHUFXGD90"
  assign-public-ip = true
}

module "assign-public-ip-and-private-dns-and-public-dns" {
  source = "../"
  name = "gbtest-all-dns"
  prefix = "test-5"
  aws-subnet-id = "subnet-012dc148"
  aws-keypair-name = "yb-15-aws-portal-1-key"
  aws-security-group-ids = ["sg-21c51347","sg-afc610c9"]
  aws-private-hosted-zone-id = "Z2LL3FHUFXGD90"
  aws-public-hosted-zone-id = "Z0193529177WHQIGWKQHO"
  assign-public-ip = true
}
