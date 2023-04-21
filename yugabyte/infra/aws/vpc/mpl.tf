
resource "aws_ec2_managed_prefix_list" "allow-remote" {
  count = local.create_mpl? 1 : 0
  name           = "${var.project_config.prefix}-allow-remote"
  address_family = "IPv4"
  max_entries    = 20
  tags = {
    Name = "${var.project_config.prefix}-allow-remote"
  }
}
resource "aws_ec2_managed_prefix_list_entry" "allow-remote" {
  for_each       = local.create_mpl? var.project_config.remote-ips : {}
  cidr           = "${each.value}"
  description    = "${each.key}"
  prefix_list_id = one(aws_ec2_managed_prefix_list.allow-remote.*.id)
}
