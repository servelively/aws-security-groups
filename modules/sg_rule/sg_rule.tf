resource "aws_security_group_rule" "sg_rule_sourcesg" {
  count = var.create_sg_rule  &&  length(var.cidr_blocks) == 0  ? length(var.source_security_group_id) :  0
  type              = var.type
  to_port           = var.to_port
  protocol          = var.protocol
  prefix_list_ids   = var.prefix_list_ids
  from_port         = var.from_port
  security_group_id = var.security_group_id
  source_security_group_id = var.source_security_group_id[count.index]
  description = var.description
}

resource "aws_security_group_rule" "sg_rule_cidr" {
  count = var.create_sg_rule && length(var.cidr_blocks) > 0 ? 1 : 0
  type              = var.type
  to_port           = var.to_port
  protocol          = var.protocol
  prefix_list_ids   = var.prefix_list_ids
  from_port         = var.from_port
  cidr_blocks       =  var.cidr_blocks
  security_group_id = var.security_group_id
  description = var.description
}


resource "aws_security_group_rule" "sg_rule_self" {
  count = var.create_sg_rule && length(var.cidr_blocks)  == 0 && length(var.source_security_group_id) == 0 ? 1 : 0
  type              = var.type
  to_port           = var.to_port
  protocol          = var.protocol
  prefix_list_ids   = var.prefix_list_ids
  from_port         = var.from_port
  security_group_id = var.security_group_id
  self              =  var.self
  description = var.description
}

variable "self" {
    type = bool
    default = true
}

variable "create_sg_rule" {
    type = bool
    default = false
}

variable "description" {
    type = string
    default = null
}
variable "to_port" {
    type = number
    default = 0
}

variable "type" {
    type = string
    default = "ingress"
}

variable "protocol" {
    type = string
    default = "-1"
}

variable "prefix_list_ids" {
    default = []
    type= list(string)
}
variable "from_port" {
    type = number
    default = 0
}

variable "security_group_id" {
}


variable "source_security_group_id" {
    type = list(string)
    default = []
}

variable "cidr_blocks" {
  type = list(string)
  default = []
}


 output "sg_rule_id_sourcesg" {
  value = aws_security_group_rule.sg_rule_sourcesg.*.id
 }

output "sg_rule_id_cidr" {
  value = aws_security_group_rule.sg_rule_cidr.*.id
}
