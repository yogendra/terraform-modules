variable "name" {
  type = string
  description = "LB Name"
}
variable "ports" {
  type = map(string)
  description = "Port map { name = portNumber .... }"
}

variable "target-type" {
  type = string
  description = "Target type"
  default = "ip"
}

variable "targets" {
  type = list(string)
  description = "target IP, Ids, etc."
}
variable "subnet-ids" {
  type = list(string)
  description = "subnet list"
}
variable "vpc-id"{
  type = string
  description = "vpc"
}
variable "tags" {
  type = map(string)
  description = "Tags"
  default = {}
}

locals {

  ports_target_product = flatten(
    [
      for name, port in var.ports: [
        for target in var.targets: {
          portName = name
          port = port
          target   = target
        }
      ]
    ]
  )

}

resource "aws_lb" "this" {
  name               = var.name
  load_balancer_type = "network"
  subnets            = var.subnet-ids
  enable_cross_zone_load_balancing = false
  tags = merge(var.tags,{
    Name = var.name
  })
}

resource "aws_lb_target_group" "this" {
  for_each = var.ports
  port        = each.value
  protocol    = "TCP"
  vpc_id      = var.vpc-id
  target_type = var.target-type
  stickiness  {
    enabled = true
    type = "source_ip"
  }

  depends_on = [
    aws_lb.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "this" {
  for_each = var.ports

  load_balancer_arn = aws_lb.this.arn

  protocol          = "TCP"
  port              = each.value

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[each.key].arn
  }
}



resource "aws_lb_target_group_attachment" "this" {
  count = length(local.ports_target_product)

  target_group_arn  = aws_lb_target_group.this[local.ports_target_product[count.index].portName].arn
  target_id         = local.ports_target_product[count.index].target
  # availability_zone = "all"
  port              = local.ports_target_product[count.index].port
}

output "dns-name" {
  value = aws_lb.this.dns_name
}
output "arn" {
  value = aws_lb.this.arn
}
output "id" {
  value = aws_lb.this.id
}
