
provider "aws" {
  region = "us-east-1"
}
module "test" {
  source = "../.."
  region = "us-east-1"
  prefix = "ic-test"
  project_cidr = "10.212.0.0/16"
  ssh_public_keys =  ["${path.cwd}/private/test.pub"]
  airgapped = false
  use_nat = false
  config = local.vpc_config["us-east-1"]
}

