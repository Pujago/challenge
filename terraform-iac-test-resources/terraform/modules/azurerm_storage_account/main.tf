locals {
  account_tier             = (var.account_kind == "FileStorage" ? "Premium" : split("_", var.skuname)[0])
  account_replication_type = (local.account_tier == "Premium" ? "LRS" : split("_", var.skuname)[1])
  mandatory_tags = {
    DeployedBy = "Terraform"
  }
}

data "azurerm_resource_group" "rgrp" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storeacc" {
  name                      = var.storage_account_name
  resource_group_name       = data.azurerm_resource_group.rgrp.name
  location                  = data.azurerm_resource_group.rgrp.location
  account_kind              = var.account_kind
  account_tier              = local.account_tier
  access_tier               = var.access_tier
  account_replication_type  = local.account_replication_type
  enable_https_traffic_only = true
  min_tls_version           = var.min_tls_version
  allow_blob_public_access  = var.allow_blob_public_access
  tags                      = merge(var.tags, local.mandatory_tags)

  dynamic "identity" {
    for_each = var.assign_identity == false ? [] : [false]
    content {
      type = var.assign_identity ? "SystemAssigned" : ""
    }
  }

  dynamic "blob_properties" {
    for_each = var.soft_delete_retention == null ? [] : [true]
    content {
      delete_retention_policy {
        days = var.soft_delete_retention
      }
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = "Deny"
      bypass                     = var.network_rules.bypass
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
    }
  }
}

resource "azurerm_advanced_threat_protection" "atp" {
  count              = var.enable_advanced_threat_protection == true ? 1 : 0
  target_resource_id = azurerm_storage_account.storeacc.id
  enabled            = var.enable_advanced_threat_protection
}

resource "azurerm_storage_container" "container" {
  count                 = length(var.containers_list)
  name                  = var.containers_list[count.index].name
  storage_account_name  = azurerm_storage_account.storeacc.name
  container_access_type = var.containers_list[count.index].access_type
}

resource "azurerm_storage_share" "fileshare" {
  count                = length(var.file_shares)
  name                 = var.file_shares[count.index].name
  storage_account_name = azurerm_storage_account.storeacc.name
  quota                = var.file_shares[count.index].quota
}

resource "azurerm_storage_table" "tables" {
  count                = length(var.tables)
  name                 = var.tables[count.index]
  storage_account_name = azurerm_storage_account.storeacc.name
}

resource "azurerm_storage_queue" "queues" {
  count                = length(var.queues)
  name                 = var.queues[count.index]
  storage_account_name = azurerm_storage_account.storeacc.name
}

resource "azurerm_storage_management_policy" "lcpolicy" {
  count              = length(var.lifecycles) == 0 ? 0 : 1
  storage_account_id = azurerm_storage_account.storeacc.id

  dynamic "rule" {
    for_each = var.lifecycles
    iterator = rule
    content {
      name    = "rule${rule.key}"
      enabled = true
      filters {
        prefix_match = rule.value.prefix_match
        blob_types   = ["blockBlob"]
      }
      actions {
        base_blob {
          tier_to_cool_after_days_since_modification_greater_than    = rule.value.tier_to_cool_after_days
          tier_to_archive_after_days_since_modification_greater_than = rule.value.tier_to_archive_after_days
          delete_after_days_since_modification_greater_than          = rule.value.delete_after_days
        }
        snapshot {
          delete_after_days_since_creation_greater_than = rule.value.snapshot_delete_after_days
        }
      }
    }
  }
}
