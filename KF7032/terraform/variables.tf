locals {
  resource_group_name = "beznoruni-rg"
  location            = "Norway East"
}

variable "linux_vm_username" {
  description = "The username of the Linux vm"
  type        = string
}

variable "linux_vm_ssh_public_key_path" {
  description = "The path to the Public Key which should be used for authentication to the virtual machine"
  type        = string
}
