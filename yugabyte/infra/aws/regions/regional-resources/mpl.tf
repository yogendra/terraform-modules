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
output "mpl" {
  value = {
    enabled = local.create_mpl
    well-known = local.create_mpl? one(aws_ec2_managed_prefix_list.well-known.*.id): ""
  }
}
