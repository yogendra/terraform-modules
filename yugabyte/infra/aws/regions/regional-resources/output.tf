output "ssm-documents" {
  value = {
    tailscale-install = aws_ssm_document.tailscale-install.id
    tailscale-remove = aws_ssm_document.tailscale-remove.id
    cloud-init-finished = aws_ssm_document.cloud-init-finished.id
  }
}
