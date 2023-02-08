

locals {
  portal-internal-fqdn = "portal-01.${var.internal_db_domain}"
  pubKey               = file(format("%[1]s/kp-%[2]s-%[3]s%[4]sna.pub", var.env_name, var.project_code, var.env_name, var.zone_name))
  yugawareLicense      = filebase64(format("%[1]s/yba-license-%[2]s-%[3]s%[4]s.rli", var.env_name, var.project_code, var.env_name, var.zone_name))

  replicatedConf = templatefile("${path.module}/templates/replicated.conf", {
    password      = var.yba-replicated-password
    airgapPackage = "/opt/yugabyte/packages/yugabyte/yugaware-${var.yb-release}-linux-x86_64.airgap"
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
    portal = "https://${local.portal-internal-fqdn}"
    providers = [
      {
        airGapInstall = true
        code          = "aws"
        config = {
          HOSTED_ZONE_ID   = module.internal-db-zone.zone_id
          HOSTED_ZONE_NAME = "${var.internal_db_domain}."
        }
        name    = "aws"
        sshPort = var.yba-db-ssh-port
        sshUser = var.yba-db-ssh-user
        regions = [
          {
            code    = var.region
            name    = var.region
            ybImage = var.yba-db-ami
            zones = [
              for i, az in var.az_list : {
                code   = az
                name   = az
                subnet = module.subnets.subnet_ids_db[i]
              }
            ]
            details = {
              architecture = "x86_64"
              sg_id        = module.subnets.sg_db
            }
          }
        ]
      }
    ],
    kms_configs = [
      {
        type = "AWS",
        config = {
          name       = "aws-kms",
          AWS_REGION = "ap-southeast-1"
        }
      }
    ],
    configs = [
      {
        type       = "STORAGE"
        configName = "aws-s3"
        name       = "S3"
        data = {
          BACKUP_LOCATION      = "s3://${module.yba-backup-bucket.s3_bucket_id}"
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
    stagingBucket   = "s3://${module.yba-packages-bucket.s3_bucket_id}"
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
