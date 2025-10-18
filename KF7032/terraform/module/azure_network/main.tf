resource "azurerm_virtual_network" "kf7032_virtual_network" {
  name                = "kf7032-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "kf7032_subnet" {
  name                 = "kf7032-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.kf7032_virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "kf7032_public_ip" {
  name                = "kf7032-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_security_group" "kf7032_nsg" {
  name                = "kf7032-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "kf7032_nic" {
  name                = "kf7032-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "kf7032-ipconfig"
    subnet_id                     = azurerm_subnet.kf7032_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.kf7032_public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "vm_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.kf7032_nic.id
  network_security_group_id = azurerm_network_security_group.kf7032_nsg.id
}
