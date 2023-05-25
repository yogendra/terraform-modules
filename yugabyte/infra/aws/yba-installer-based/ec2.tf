data "cloudinit_config" "yba" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/yba-cloud-init.yaml", {
      public-key = data.aws_key_pair.yba-keypair.public_key
      license = local.yba-license
      yba-installer-url = local.yba-installer-url
      yba-installer-package-filename = local.yba-installer-package-filename
      yba-installer-dirname = local.yba-installer-dirname
      yba-user-email = var.yba-superadmin-email
      yba-user-name = var.yba-superadmin-name
      yba-user-password = var.yba-superadmin-password
      yba-environment-type = var.yba-environment-type
    })
  }
}
resource "aws_instance" "yba" {
  ami                    = local.yba-ami
  instance_type          = local.yba-instance-type
  key_name               = local.key-name
  iam_instance_profile   = local.yba-iam-instance-profile
  monitoring             = true
  subnet_id              = local.yba-subnet
  vpc_security_group_ids = local.yba-security-groups
  user_data_base64       = data.cloudinit_config.yba.rendered

  root_block_device {
    volume_size = 100
    tags = merge(local.tags, {
      Name = "${local.prefix}-yba-root"
      yb_aws_service = "ec2"
      yb_resource_type = "ebs"
    })
  }

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 20
    volume_type = "gp3"
    throughput = 125
    delete_on_termination = false
    tags = merge(local.tags, {
      Name = "${local.prefix}-yba-home"
      yb_aws_service = "ec2"
      yb_resource_type = "ebs"
    })
  }
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 250
    volume_type = "gp3"
    throughput = 125
    delete_on_termination = false
    tags = merge(local.tags, {
      Name = "${local.prefix}-yba-opt"
      yb_aws_service = "ec2"
      yb_resource_type = "ebs"
    })
  }

  tags = {
    Name = "${local.prefix}-yba"
    yb_aws_service = "ec2"
    yb_resource_type = "ec2"
  }
}


# resource "aws_ssm_document" "cloud_init_wait" {
#   name = "${local.prefix}-cloud-init-wait"
#   document_type = "Command"
#   document_format = "YAML"
#   content = <<-DOC
#     schemaVersion: '2.2'
#     description: Wait for cloud init to finish
#     mainSteps:
#     - action: aws:runShellScript
#       name: StopOnLinux
#       precondition:
#         StringEquals:
#         - platformType
#         - Linux
#       inputs:
#         runCommand:
#         - cloud-init status --wait
#     DOC
# }

# resource "null_resource" "init-finish" {
#   provisioner "local-exec" {
#       interpreter = ["/bin/bash", "-c"]

#       command = <<-EOF
#       set -Ee -o pipefail
#       export AWS_DEFAULT_REGION=${data.aws_region.current.name}

#       command_id=$(aws ssm send-command --document-name ${aws_ssm_document.cloud_init_wait.arn} --instance-ids ${self.id} --output text --query "Command.CommandId")
#       if ! aws ssm wait command-executed --command-id $command_id --instance-id ${self.id}; then
#         echo "Failed to start services on instance ${self.id}!";
#         echo "stdout:";
#         aws ssm get-command-invocation --command-id $command_id --instance-id ${self.id} --query StandardOutputContent;
#         echo "stderr:";
#         aws ssm get-command-invocation --command-id $command_id --instance-id ${self.id} --query StandardErrorContent;
#         exit 1;
#       fi;
#       echo "Services started successfully on the new instance with id ${self.id}!"
#       EOF
#     }
# }
