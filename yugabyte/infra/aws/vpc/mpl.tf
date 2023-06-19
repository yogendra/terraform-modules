
resource "aws_ec2_managed_prefix_list" "allow-remote" {
  count = local.create_mpl? 1 : 0
  name           = "${var.prefix}-allow-remote"
  address_family = "IPv4"
  max_entries    = 20
  tags = {
    Name = "${var.prefix}-allow-remote"
    yb_aws_service = "ec2"
    yb_resource_type = "mpl"
  }
}
resource "aws_ec2_managed_prefix_list_entry" "allow-remote" {
  for_each       = local.create_mpl? var.remote-ips : {}
  cidr           = "${each.value}"
  description    = "${each.key}"
  prefix_list_id = one(aws_ec2_managed_prefix_list.allow-remote.*.id)
}
