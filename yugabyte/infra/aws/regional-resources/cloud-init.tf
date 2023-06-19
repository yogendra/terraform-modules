resource "aws_ssm_document" "cloud-init-finished" {
  name          = "CloudInitFinished"
  document_type = "Command"

  content = <<DOC
  {
    "schemaVersion": "1.2",
    "description": "Setup tailscale",
    "runtimeConfig": {
      "aws:runShellScript": {
        "properties": [
          {
            "id": "0.aws:runShellScript",
            "runCommand": [
              "sudo cloud-init status --wait"
            ]
          }
        ]
      }
    }
  }
DOC
}
