resource "aws_ec2_managed_prefix_list_entry" "se-ip" {
  for_each = var.se-ips
  cidr           = "${each.valye}/32"
  description    = "IP for ${each.key}"
  prefix_list_id = prefix_list_id
}
