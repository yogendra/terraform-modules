resource "aws_ec2_managed_prefix_list" "well-known" {
  count = local.create_mpl? 1 : 0
  name           = "${var.prefix}-well-known"
  address_family = "IPv4"
  max_entries    = 20
  tags = merge ( var.tags, {
    Name = "${var.prefix}-well-known"
    yb_aws_service = "ec2"
    yb_resource_type = "mpl"
  })
}

resource "aws_ec2_managed_prefix_list_entry" "allow-well-known-cidrs" {
  count          = local.create_mpl ? length(var.well-known-cidrs) : 0
  cidr           = var.well-known-cidrs[count.index]
  description    = "Access from ${var.well-known-cidrs[count.index]}"
  prefix_list_id = aws_ec2_managed_prefix_list.well-known[0].id
}

output "mpl-enabled" {
  value = local.create_mpl
}
output "mpl-lists" {
  value = {
    well-known = local.create_mpl? one(aws_ec2_managed_prefix_list.well-known.*.id): ""
  }
}
