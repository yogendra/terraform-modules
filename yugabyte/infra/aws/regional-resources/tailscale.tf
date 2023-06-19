resource "aws_ssm_document" "tailscale-install" {
  name          = "TailscaleInstall"
  document_type = "Command"

  content = <<DOC
  {
    "schemaVersion": "1.2",
    "description": "Setup tailscale",
    "parameters": {
      "AuthKey": {
        "type": "String",
        "description": "(Required) Authentication Key"
      },
      "Tags": {
        "type": "String",
        "description": "(Required) Tags to put on host"
      },
      "HostName": {
        "type": "String",
        "description": "(Required) Hostname to advetise"
      }
    },
    "runtimeConfig": {
      "aws:runShellScript": {
        "properties": [
          {
            "id": "0.aws:runShellScript",
            "runCommand": [
              "curl -fsSL https://tailscale.com/install.sh | sudo sh",
              "sudo tailscale up --authkey {{ AuthKey }} --advertise-tags={{ Tags }} --hostname  {{ HostName }}  --reset"
            ]
          }
        ]
      }
    }
  }
DOC
}

resource "aws_ssm_document" "tailscale-remove" {
  name          = "TailscaleRemove"
  document_type = "Command"

  content = <<DOC
  {
    "schemaVersion": "1.2",
    "description": "Setup tailscale",
    "parameters": {
      "AuthKey": {
        "type": "String",
        "description": "(Required) Authentication Key"
      },
      "Tags": {
        "type": "String",
        "description": "(Required) Tags to put on host"
      },
      "HostName": {
        "type": "String",
        "description": "(Required) Hostname to advetise"
      }
    },
    "runtimeConfig": {
      "aws:runShellScript": {
        "properties": [
          {
            "id": "0.aws:runShellScript",
            "runCommand": [
              "sudo tailscale down --accept-risk"
            ]
          }
        ]
      }
    }
  }
DOC
}

