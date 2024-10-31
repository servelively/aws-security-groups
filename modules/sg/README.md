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
| [aws_security_group.custom_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | n/a | `bool` | `true` | no |
| <a name="input_sg_allowed_cidrblock"></a> [sg\_allowed\_cidrblock](#input\_sg\_allowed\_cidrblock) | n/a | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_sg_allowed_ports"></a> [sg\_allowed\_ports](#input\_sg\_allowed\_ports) | n/a | `number` | `0` | no |
| <a name="input_sg_allowed_security_groups"></a> [sg\_allowed\_security\_groups](#input\_sg\_allowed\_security\_groups) | n/a | `list(string)` | `[]` | no |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | n/a | `string` | n/a | yes |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | n/a | `string` | n/a | yes |
| <a name="input_sg_protocol"></a> [sg\_protocol](#input\_sg\_protocol) | n/a | `string` | `"tcp"` | no |
| <a name="input_sg_rule_description"></a> [sg\_rule\_description](#input\_sg\_rule\_description) | n/a | `string` | `""` | no |
| <a name="input_sg_self"></a> [sg\_self](#input\_sg\_self) | n/a | `bool` | `false` | no |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | n/a | `map(string)` | <pre>{<br/>  "Terraform": "true"<br/>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | variables | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_custom_id"></a> [sg\_custom\_id](#output\_sg\_custom\_id) | n/a |
