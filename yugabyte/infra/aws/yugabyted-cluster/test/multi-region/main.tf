module "single-region" {
  source = "../.."
  name = "sr"
  aws-instance-profile = "shr-SSMInstanceProfile"
  topology = [
      {
        region = "ap-southeast-1"
        nodes  = 1
        subnet-id = "subnet-049ef6f8b94f9d6ee"
        security-group-ids = ["sg-0a1bc2191b4b94603"]
        keypair-name = "shr-0"
        assign-public-ip = false
      },
      {
        region = "ap-south-1"
        nodes  = 1
        subnet-id = "subnet-0b633cf4a1d42aad7"
        security-group-ids = ["sg-0a1bc2191b4b94603"]
        keypair-name = "shr-0"
        assign-public-ip = false
      },
      {
        region = "ap-southeast-2"
        nodes  = 1
        subnet-id = "subnet-0f80c2725cafab73b"
        security-group-ids = ["sg-0a1bc2191b4b94603"]
        keypair-name = "shr-0"
        assign-public-ip = false

      }

  ]
}
output "ybcluster" {
  value = module.single-region
}
