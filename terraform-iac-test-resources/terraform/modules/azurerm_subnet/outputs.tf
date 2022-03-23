# output "id" {
#   value       = { for c in azurerm_subnet.main : c.name => c.id }
#   description = "The subnet ID."
# }

output "id" {
  value       = azurerm_subnet.main.*.id 
  description = "The subnet ID."
}

output "address_prefixes" {
  value       = azurerm_subnet.main.*.address_prefixes
  description = "The address prefixes for the subnet"
}

output "name" {
  value       = azurerm_subnet.main.*.name
  description = "The name of the subnet"
}

output "resource_group_name" {
  value       = azurerm_subnet.main.*.resource_group_name
  description = "The name of the resource group in which the subnet is created in."
}

output "virtual_network_name" {
  value       = azurerm_subnet.main.*.virtual_network_name
  description = "The name of the virtual network in which the subnet is created in."
}




