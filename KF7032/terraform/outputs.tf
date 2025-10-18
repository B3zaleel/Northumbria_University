output "vm_computer_name" {
  value = module.azure_linux_vm.computer_name
}

output "vm_user_name" {
  value = module.azure_linux_vm.user_name
}

output "vm_public_address" {
  value = module.azure_network.public_ip_address
}

output "vm_fqdn" {
  value = module.azure_network.public_ip_fqdn
}
