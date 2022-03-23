resource "azurerm_public_ip" "azure" {
  name                    = local.resource_names
  resource_group_name     = data.azurerm_resource_group.resource_group.name
  location                = data.azurerm_resource_group.resource_group.location
  allocation_method       = var.allocation_method
  sku                     = var.sku
  sku_tier                = var.sku_tier
  availability_zone       = var.availability_zone
  ip_version              = var.ip_version
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  domain_name_label       = var.domain_name_label
  reverse_fqdn            = var.reverse_fqdn
  public_ip_prefix_id     = var.public_ip_prefix_id
  ip_tags                 = var.ip_tags
  tags                    = merge(var.tags, local.mandatory_tags)
}