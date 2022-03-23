variable "resource_group_name" {
  type        = string
  description = "A container that holds related resources for an Azure solution"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the azure storage account"
}

variable "account_kind" {
  type        = string
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = "StorageV2"
}

variable "skuname" {
  type        = string
  description = "The SKUs supported by Microsoft Azure Storage. Valid options are Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS, Standard_ZRS"
  default     = "Standard_RAGRS"
}

variable "access_tier" {
  type        = string
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
}

variable "min_tls_version" {
  type        = string
  description = "The minimum supported TLS version for the storage account"
  default     = "TLS1_2"
}

variable "assign_identity" {
  type        = bool
  description = "Set to `true` to enable system-assigned managed identity, or `false` to disable it."
  default     = true
}

variable "soft_delete_retention" {
  type        = number
  description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
  default     = null
}

variable "allow_blob_public_access" {
  type        = bool
  description = "Allow or disallow public access to all blobs or containers in the storage account. Defaults to false."
  default     = false
}

variable "enable_advanced_threat_protection" {
  type        = bool
  description = "Boolean flag which controls if advanced threat protection is enabled."
  default     = false
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = object({ bypass = list(string), ip_rules = list(string), subnet_ids = list(string) })
  default     = null
}

variable "containers_list" {
  description = "List of containers to create and their access levels."
  type        = any
  default     = []
}

variable "file_shares" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, quota = number }))
  default     = []
}

variable "queues" {
  description = "List of storages queues"
  type        = list(string)
  default     = []
}

variable "tables" {
  description = "List of storage tables."
  type        = list(string)
  default     = []
}
variable "lifecycles" {
  description = "Configure Azure Storage firewalls and virtual networks"
  type        = list(object({ prefix_match = set(string), tier_to_cool_after_days = number, tier_to_archive_after_days = number, delete_after_days = number, snapshot_delete_after_days = number }))
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
