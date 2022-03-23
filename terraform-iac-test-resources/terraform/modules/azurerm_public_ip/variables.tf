# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be passed values
# ---------------------------------------------------------------------------------------------------------------------
variable "resource_names" {
  description = "The name of the resource's that are created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the existing resource group"
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults
# ---------------------------------------------------------------------------------------------------------------------
variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
  default     = null
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "The availability zone to allocate the Public IP in. Possible values are Zone-Redundant, 1, 2, 3, and No-Zone. Defaults to Zone-Redundant"
  type        = string
  default     = null
}

variable "ip_version" {
  description = "The IP Version to use, IPv6 or IPv4"
  type        = string
  default     = "IPv4"
}

variable "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes"
  type        = string
  default     = null
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system"
  type        = string
  default     = null
}

variable "reverse_fqdn" {
  description = "A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN"
  type        = string
  default     = null
}

variable "public_ip_prefix_id" {
  description = "If specified then public IP address allocated will be provided from the public IP prefix resource"
  type        = string
  default     = null
}

variable "ip_tags" {
  description = "A mapping of IP tags to assign to the public IP"
  type        = map(string)
  default     = null
}

variable "tags" {
  description = "The tags for each resource"
  type        = map(string)
  default     = null
}
