locals {
    packer-manifests = fileset("${path.module}","/packer/yugabytedb-aws-*.json")
    all-builds = [
      for manifest in local.packer-manifests: jsondecode(file("${path.module}/${manifest}")).builds
    ]
    latest-builds = [
      for builds in local.all-builds :  builds[length(builds)-1]
    ]
    builds-by-tags = {
      for build in local.latest-builds : "${build.custom_data.yb_version}-${build.custom_data.arch}" => {
        for region-ami in split(",", build.artifact_id): split(":", region-ami)[0] => split(":", region-ami)[1]
      }
    }
    latest-build-by-version = {
      for build in local.latest-builds : build.custom_data.yb_version => {
        arch = build.custom_data.arch
        ami = {  for region-ami in split(",", build.artifact_id): split(":", region-ami)[0] => split(":", region-ami)[1] }
      }...
    }
    pre-built-amis = {
      for version, value in local.latest-build-by-version : version => {
        for item in value: item.arch => item.ami
      }
    }
}

# output "debug" {
#   value = {
#     packer-manifests = local.packer-manifests
#     latest-builds = local.latest-builds
#     builds-by-tags = local.builds-by-tags
#     latest-build-by-version = local.latest-build-by-version
#     amis = local.amis
#   }
# }

locals {
  pre-built-amis-old = {
    "2.18.1.0" = {
      "x86_64" = {
        "af-south-1"     = "ami-00c93b036fcab4c6f"
        "ap-east-1"      = "ami-0dc9d382edd12747c"
        "ap-northeast-1" = "ami-049080b9be4676004"
        "ap-northeast-2" = "ami-0aad100308f586e00"
        "ap-northeast-3" = "ami-0784d968fb4c0369a"
        "ap-south-1"     = "ami-088971acb164d1081"
        "ap-south-2"     = "ami-07966994c3f7fdeff"
        "ap-southeast-1" = "ami-02e7e3f126a83951c"
        "ap-southeast-2" = "ami-0874b3587d6e1a2fc"
        "ap-southeast-3" = "ami-03d05d1bb90777872"
        "ap-southeast-4" = "ami-090fbc2da49538683"
        "ca-central-1"   = "ami-08bec3bab47193c75"
        "eu-central-1"   = "ami-09620d538f7a64c06"
        "eu-central-2"   = "ami-0904e46fe59afc503"
        "eu-north-1"     = "ami-07c9f0d45b8032310"
        "eu-south-1"     = "ami-056798cde5827f7e6"
        "eu-south-2"     = "ami-09f31f5b135615c55"
        "eu-west-1"      = "ami-0f409f299692ee48a"
        "eu-west-2"      = "ami-0144244ffdb7957fa"
        "eu-west-3"      = "ami-02c97aade285830b5"
        "il-central-1"   = "ami-0976adc6516b2abb7"
        "me-central-1"   = "ami-001c70f1b6afec61a"
        "me-south-1"     = "ami-0baf85fa8d86e63d6"
        "sa-east-1"      = "ami-098de223b8547ff3d"
        "us-east-1"      = "ami-0b759b892c72d8551"
        "us-east-2"      = "ami-0412d594826682988"
        "us-west-1"      = "ami-0c2d5ee4820a17654"
        "us-west-2"      = "ami-04e6ce1ddacc363d1"
      }
    }
    "2.18.2.1" = {
      "x86_64" = {
        "af-south-1"     = "ami-074cc77b1340847af"
        "ap-east-1"      = "ami-0ddb338cd30a4e341"
        "ap-northeast-1" = "ami-05ddf4b3eade72906"
        "ap-northeast-2" = "ami-009965245c6e4aaa2"
        "ap-northeast-3" = "ami-09608460ce704d53c"
        "ap-south-1"     = "ami-00482076d84f48184"
        "ap-south-2"     = "ami-0dccafd0d03ca6882"
        "ap-southeast-1" = "ami-0bdf1ddc93e39efa2"
        "ap-southeast-2" = "ami-0a427ab446c5c438e"
        "ap-southeast-3" = "ami-0569b4fc96ac12c06"
        "ap-southeast-4" = "ami-0347735db80bee2e8"
        "ca-central-1"   = "ami-072f6f32e3176bfde"
        "eu-central-1"   = "ami-04aac8ff0efe0a701"
        "eu-central-2"   = "ami-0a731f32cf066e4e2"
        "eu-north-1"     = "ami-08487b01ef4546b57"
        "eu-south-1"     = "ami-0332bacdc1d3a4075"
        "eu-south-2"     = "ami-01c238fea7fdb1115"
        "eu-west-1"      = "ami-064da51903e435541"
        "eu-west-2"      = "ami-04bafafaa49f8de22"
        "eu-west-3"      = "ami-0628732b6eaf68a4a"
        "il-central-1"   = "ami-037fb16c9586f47ed"
        "me-central-1"   = "ami-0e9a7a7151b1833bc"
        "me-south-1"     = "ami-07448bd74de654878"
        "sa-east-1"      = "ami-049d01691cbaeea8e"
        "us-east-1"      = "ami-009c7428219242714"
        "us-east-2"      = "ami-0bb380170fee6d957"
        "us-west-1"      = "ami-007cdcc19eb63c796"
        "us-west-2"      = "ami-02c5c86a462062a31"
      }
    }
    "2.19.0.0" = {
      "arm64" = {}
      "x86_64" = {
        "af-south-1"     = "ami-0b5b2af804a916928"
        "ap-east-1"      = "ami-003ef94d3f1f289b1"
        "ap-northeast-1" = "ami-00f7daad022c3c2f1"
        "ap-northeast-2" = "ami-0f1dafc93d594ac6d"
        "ap-northeast-3" = "ami-085b7aeb0f4fdaaeb"
        "ap-south-1"     = "ami-00c706867161c8480"
        "ap-south-2"     = "ami-02f65797666711bbe"
        "ap-southeast-1" = "ami-0695e72f780825fa2"
        "ap-southeast-2" = "ami-06f1f1df46b6fdc19"
        "ap-southeast-3" = "ami-0b2adc0b35bd54371"
        "ap-southeast-4" = "ami-02352857bd4a61d12"
        "ca-central-1"   = "ami-090b8ce396df14e58"
        "eu-central-1"   = "ami-0482d041398e15bfb"
        "eu-central-2"   = "ami-0883d3022ac2859e5"
        "eu-north-1"     = "ami-0f0878456b2ade674"
        "eu-south-1"     = "ami-0399a3213e4814ac7"
        "eu-south-2"     = "ami-0cab6793f95631cca"
        "eu-west-1"      = "ami-02faa6f069f8d26e5"
        "eu-west-2"      = "ami-0326c29608a681856"
        "eu-west-3"      = "ami-03c197a4aa3e08099"
        "il-central-1"   = "ami-0b40c1555f2a23d81"
        "me-central-1"   = "ami-0a7ec727a4dbd2ad4"
        "me-south-1"     = "ami-03773de6655a7e795"
        "sa-east-1"      = "ami-051ae09b60c420dbc"
        "us-east-1"      = "ami-0a8af17a231ca7a7a"
        "us-east-2"      = "ami-058003b0a8fe8c1e6"
        "us-west-1"      = "ami-0c96c6d9c269e5e7e"
        "us-west-2"      = "ami-05d892511db1ec67f"
      }
    }
  }
}
