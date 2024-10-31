## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group_rule.sg_rule_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_rule_self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_rule_sourcesg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | n/a | `list(string)` | `[]` | no |
| <a name="input_create_sg_rule"></a> [create\_sg\_rule](#input\_create\_sg\_rule) | n/a | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | n/a | `number` | `0` | no |
| <a name="input_prefix_list_ids"></a> [prefix\_list\_ids](#input\_prefix\_list\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | n/a | `string` | `"-1"` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a | `any` | n/a | yes |
| <a name="input_self"></a> [self](#input\_self) | n/a | `bool` | `true` | no |
| <a name="input_source_security_group_id"></a> [source\_security\_group\_id](#input\_source\_security\_group\_id) | n/a | `list(string)` | `[]` | no |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | n/a | `number` | `0` | no |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | `"ingress"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_rule_id_cidr"></a> [sg\_rule\_id\_cidr](#output\_sg\_rule\_id\_cidr) | n/a |
| <a name="output_sg_rule_id_sourcesg"></a> [sg\_rule\_id\_sourcesg](#output\_sg\_rule\_id\_sourcesg) | n/a |
