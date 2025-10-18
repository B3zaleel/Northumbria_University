output "network_interface_id" {
  value = azurerm_network_interface.kf7032_nic.id
}

output "public_ip_address" {
  value = azurerm_public_ip.kf7032_public_ip.ip_address
}

output "public_ip_fqdn" {
  value = azurerm_public_ip.kf7032_public_ip.fqdn
}
