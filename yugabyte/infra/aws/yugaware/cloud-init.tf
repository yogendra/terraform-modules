locals {

  aws-yb-providers = [
    for provider in var.yba-aws-providers:
    {
      airGapInstall = provider.air-gapped
      code          = "aws"
      config = {
        HOSTED_ZONE_ID   = provider.internal-hosted-zone-id
        HOSTED_ZONE_NAME = "${provider.internal-hosted-domain}."
      }
      name    = provider.name
      sshPort = provider.ssh-port
      sshUser = provider.ssh-user
      regions = [
        for region,config in provider.regions:
          {
            code    = region
            name    = region
            ybImage = lookup(local.amis.ybdb, region)
            zones = [
              for az, subnet in config.az-subnets : {
                code   = az
                name   = az
                subnet = subnet
              }
            ]
            details = {
              architecture = config.architecture
              sg_id        = config.security-group
            }
          }
      ]
    }
  ]



  portal-internal-fqdn = "localhost"
  yugawareLicense      = filebase64(var.yba-license-file)

  replicatedConf = templatefile("${path.module}/templates/replicated.conf", {
    password      = var.yba-replicated-password
    airgapPackage = var.yba-online-install ? "" : "/opt/yugabyte/packages/yugabyte/yugaware-${var.yb-release}-linux-x86_64.airgap"
    hostname      = local.portal-internal-fqdn
  })

  yugawareConf = templatefile("${path.module}/templates/yugaware.conf", {
    dbPassword = var.yba-db-password
  })
  installYugaware = file("${path.module}/scripts/install-yugaware.sh")
  setupYugaware   = file("${path.module}/scripts/setup-yugaware.py")

  ybCloudConfig = {
    customer = {
      code     = var.yba-environment-type
      email    = var.yba-superadmin-email
      password = var.yba-superadmin-password
      name     = var.yba-superadmin-name
    },
    portal    = "https://${local.portal-internal-fqdn}"
    providers = local.aws-yb-providers
    kms_configs = [
      {
        type = "AWS"
        config = {
          name       = "aws-kms"
          AWS_REGION = data.aws_region.current.name
        }
      }
    ],
    configs = [
      {
        type       = "STORAGE"
        configName = "aws-s3"
        name       = "S3"
        data = {
          BACKUP_LOCATION      = "s3://${aws_s3_bucket.yba-backup.id}"
          IAM_INSTANCE_PROFILE = "true"
        }
      }
    ]
  }

  cloudInit = templatefile("${path.module}/templates/cloud-init.yaml", {
    replicatedConf  = local.replicatedConf
    yugawareConf    = local.yugawareConf
    yugawareLicense = local.yugawareLicense
    installYugaware = local.installYugaware
    setupYugaware   = local.setupYugaware
    serverKey       = var.yba-tls-key-pem != "" ? var.yba-tls-key-pem : tls_private_key.portal[0].private_key_pem
    serverCert      = var.yba-tls-cert-pem != "" ? var.yba-tls-cert-pem : tls_self_signed_cert.portal-01[0].cert_pem
    cloudConfigJson = jsonencode(local.ybCloudConfig)
    stagingBucket   = "s3://${aws_s3_bucket.yba-packages.id}"
    onlineInstall   = var.yba-online-install ? "1" : "0"
  })
}



data "cloudinit_config" "yba" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = local.cloudInit
  }
}
