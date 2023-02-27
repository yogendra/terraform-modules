

locals {
  portal-internal-fqdn = "portal-01.${var.internal_db_domain}"
  pubKey               = var.public_key
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
  cloud_providers =
  ybCloudConfig = {
    customer = {
      code     = var.yba-environment-type
      email    = var.yba-superadmin-email
      password = var.yba-superadmin-password
      name     = var.yba-superadmin-name
    },
    portal    = "https://${local.portal-internal-fqdn}"
    providers = [
      {
        airGapInstall = !var.yba-online-install
        code          = "aws"
        config = {
          HOSTED_ZONE_ID   = aws_route53_zone.internal-db-zone.zone_id
          HOSTED_ZONE_NAME = "${var.internal_db_domain}."
        }
        name    = "aws-local"
        sshPort = var.yba-db-ssh-port
        sshUser = var.yba-db-ssh-user
        regions = [
          {
            code    = var.region
            name    = var.region
            ybImage = var.yba-db-ami
            zones = [
              for i, az in var.az-list : {
                code   = az
                name   = az
                subnet = var.db-subnets[i]
              }
            ]
            details = {
              architecture = "x86_64"
              sg_id        = var.db-security-group
            }
          }
        ]
      }
    ]
    kms_configs = [
      {
        type = "AWS"
        config = {
          name       = "aws-kms"
          AWS_REGION = var.region
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
    pubKey          = local.pubKey
    replicatedConf  = local.replicatedConf
    yugawareConf    = local.yugawareConf
    yugawareLicense = local.yugawareLicense
    installYugaware = local.installYugaware
    setupYugaware   = local.setupYugaware
    serverKey       = tls_private_key.portal.private_key_pem
    serverCert      = tls_self_signed_cert.portal-01.cert_pem
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
