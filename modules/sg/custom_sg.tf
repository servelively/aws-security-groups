# main.tf
variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "create_security_group" {
  type = bool
  default = true
}

variable "sg_description" {
  type = string
}

variable "sg_tags" {
  type = map(string)
  default = {  Terraform = "true" }
}

resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0
  name        = var.sg_name
  vpc_id      = var.vpc_id
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  sg_tags = var.sg_tags
}


output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}