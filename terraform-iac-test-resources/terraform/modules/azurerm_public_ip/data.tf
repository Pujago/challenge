# Get exisiting resource group data
data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}
