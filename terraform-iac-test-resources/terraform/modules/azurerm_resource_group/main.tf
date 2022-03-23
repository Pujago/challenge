locals {
  mandatory_tags = {
    DeployedBy = "Terraform"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location

  tags = merge(var.tags, local.mandatory_tags)
}

resource "azurerm_management_lock" "resource-group-level-lock" {
  name       = "${var.name}-level-lock"
  scope      = azurerm_resource_group.rg.id
  lock_level = var.lock_level
  notes      = "Resource Group '${var.name}' is locked with '${var.lock_level}' level."

  count = var.lock_level == "" ? 0 : 1
}
