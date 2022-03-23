variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet. If blank Azure DNS will be used."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default     = {}
}

variable "vnet_location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = null
}
