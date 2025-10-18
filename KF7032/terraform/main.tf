terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = local.location
}

module "azure_network" {
  source              = "./module/azure_network"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = local.location
}

module "azure_linux_vm" {
  source               = "./module/azure_linux_vm"
  resource_group_name  = azurerm_resource_group.resource_group.name
  location             = local.location
  size                 = "Standard_B1s"
  admin_username       = var.linux_vm_username
  network_interface_id = module.azure_network.network_interface_id
  ssh_public_key_path  = var.linux_vm_ssh_public_key_path
  # sourced via `az vm image list --publisher can --all`
  image_publisher = "Canonical"
  image_offer     = "ubuntu-24_04-lts"
  image_sku       = "server"
  image_version   = "latest"
}
