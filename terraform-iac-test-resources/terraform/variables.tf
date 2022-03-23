# Variables Resource group variables

variable "rg_location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string

  validation {
    condition     = length(var.resource_group_name) >= 1 && length(var.resource_group_name) <= 90 && can(regex("^[a-zA-Z0-9-._\\(\\)]+[a-zA-Z0-9-_\\(\\)]$", var.resource_group_name))
    error_message = "Invalid name (check Azure Resource naming restrictions for more info)."
  }
}


variable "lock_level" {
  description = "Specifies the Level to be used for this RG Lock. Possible values are Empty (no lock), CanNotDelete and ReadOnly."
  type        = string
  default     = ""
}


# Variables for creating subnets

variable "subnet_names" {
  type        = list(string)
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "(Optional) The address prefixes to use for the subnet."
}

variable "subnet_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = map(any)
  default     = {}
}

# Vnet

variable "virtual_network_name" {
  description = "Name of the vnet to create"
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}



# Variables for creating NSGs

variable "security_group_name" {
  description = "Network security group name"
  type        = string
}

# Custom security rules
# [priority, direction, access, protocol, source_port_range, destination_port_range, description]"
# All the fields are required.
variable "custom_rules" {
  description = "Security rules for the network security group using this format name = [priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, description]"
  type        = any
  default     = []
}

variable "nsg_ids" {
  description = "A map of subnet name to Network Security Group IDs"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the resources."
  type        = map(string)
  default     = {}
}





##################################################
# Vnet integration of resources with subnet
##################################################


variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}



#############################################
# KEY VAULT variables #
#############################################

variable "key_vault_name" {
  description = "The Name of the key vault"
}

variable "key_vault_sku_pricing_tier" {
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}


variable "network_acls" {
  description = "Network rules to apply to key vault."
  type        = object({ bypass = string, default_action = string, ip_rules = list(string), virtual_network_subnet_ids = list(string) })
  default     = null
}


# public ip
variable "resource_names" {
  description = "The name of the resource's that are created"
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  type        = string
}

#############################################
# Azure Storage account variables #
#############################################

variable "storage_account_name" {
  type        = string
  description = "The name of the azure storage account"
}


variable "containers_list" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, access_type = string }))
  default     = []
}


