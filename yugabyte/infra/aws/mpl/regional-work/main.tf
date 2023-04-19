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

variable "cidrs" {
  type = list(string)
  description = "List of CIDRs to associate with entry"
}
variable "description" {
  type = string
  description = "decription for mpl entry"
}


data "aws_ec2_managed_prefix_list" "prefix_list"{
  name = var.prefix-list-name
}

resource "aws_ec2_managed_prefix_list_entry" "entries" {
  count          = length(var.cidrs)
  cidr           = var.cidrs[count.index]
  description    = "${var.description} [${count.index}]"
  prefix_list_id = data.aws_ec2_managed_prefix_list.prefix_list.id
}
