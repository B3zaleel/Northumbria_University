resource "azurerm_linux_virtual_machine" "kf7032_vm" {
  name                = "kf7032-virtual-machine"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  computer_name       = "${var.admin_username}-pc"
  network_interface_ids = [
    var.network_interface_id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  # # You need to change the VM size type to one that supports hibernation
  # additional_capabilities {
  #   hibernation_enabled = true
  # }
}
