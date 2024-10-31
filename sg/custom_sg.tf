// variables
variable "vpc_id" {}
variable "sg_allowed_cidrblock" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_allowed_security_groups" {
  type = list(string)
  default = []
}
variable "sg_tags" {
  type = map(string)
  default = {  Terraform = "true" }
}

variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}
variable "sg_rule_description" {
  type = string
  default = ""
}

variable "sg_protocol"{
  type = string
  default = "tcp"
}
variable "sg_allowed_ports" {
  type =  number
  default = 0
}
variable "sg_self" {
  type = bool
  default = false
}
variable "create_security_group" {
  type = bool
  default = true
}

resource "aws_security_group" "custom_sg" {
  count = var.create_security_group ? 1 : 0
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    description = var.sg_rule_description
    from_port   = var.sg_allowed_ports
    to_port     = var.sg_allowed_ports
    protocol    = var.sg_protocol
    cidr_blocks = var.sg_allowed_cidrblock
    security_groups = var.sg_allowed_security_groups
    self        = var.sg_self
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}


output "sg_custom_id" {
  value = join("",aws_security_group.custom_sg.*.id)
}