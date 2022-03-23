output "id" {
  value       = azurerm_public_ip.azure.id
  description = "The resource ID of the public IP"
}

output "ip_address" {
  value       = azurerm_public_ip.azure.ip_address
  description = "The IP of the public IP"
}

output "fqdn" {
  value       = azurerm_public_ip.azure.fqdn
  description = "The FQDN of the public IP"
}