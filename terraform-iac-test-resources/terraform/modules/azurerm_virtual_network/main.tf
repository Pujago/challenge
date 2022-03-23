locals {
  mandatory_tags = {
    DeployedBy = "Terraform"
  }
}

#Azure Generic vNet Module
# References:
# - https://github.com/Azure/terraform-azurerm-vnet

data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet.name
  location            = var.vnet_location != null ? var.vnet_location : data.azurerm_resource_group.vnet.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = merge(var.tags, local.mandatory_tags)
}


