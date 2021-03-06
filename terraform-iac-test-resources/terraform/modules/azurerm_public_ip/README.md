<!-- BEGIN_TF_DOCS -->
## Overview
This file was generated by [terraform-docs](https://terraform-docs.io/)
## Usage
Potential examples can be found under [./examples](./examples/main.tf)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.80.0 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the existing resource group | `string` | n/a | yes |
| <a name="input_resource_names"></a> [resource\_names](#input\_resource\_names) | The name of the resource's that are created | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone to allocate the Public IP in. Possible values are Zone-Redundant, 1, 2, 3, and No-Zone. Defaults to Zone-Redundant | `string` | `null` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system | `string` | `null` | no |
| <a name="input_idle_timeout_in_minutes"></a> [idle\_timeout\_in\_minutes](#input\_idle\_timeout\_in\_minutes) | Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes | `string` | `null` | no |
| <a name="input_ip_tags"></a> [ip\_tags](#input\_ip\_tags) | A mapping of IP tags to assign to the public IP | `map(string)` | `null` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | The IP Version to use, IPv6 or IPv4 | `string` | `"IPv4"` | no |
| <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id) | If specified then public IP address allocated will be provided from the public IP prefix resource | `string` | `null` | no |
| <a name="input_reverse_fqdn"></a> [reverse\_fqdn](#input\_reverse\_fqdn) | A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN | `string` | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic | `string` | `null` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags for each resource | `map(string)` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the public IP |
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the public IP |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The IP of the public IP |

<!-- END_TF_DOCS -->