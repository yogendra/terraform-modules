terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "prefix-list-name"{
  type = string
  description = "Name of the prefix list to update"
}

variable "cidr" {
  type = list(string)
  description = "List of CIDRs to allow"
}

data "aws_ec2_managed_prefix_list" "prefix_list"{
  name = var.prefix_list_name
}

resource "aws_ec2_managed_prefix_list_entry" "allow-me" {
  count          = length(var.cidr)
  cidr           = var.cidr
  description    = "Owner: ${var.owner} [${count.indx}]"
  prefix_list_id = data.aws_ec2_managed_prefix_list.prefix_list.id
}
