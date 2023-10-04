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
