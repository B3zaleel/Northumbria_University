variable "resource_group_name" {
  description = "The name of the resource group to create the resources in"
  type        = string
}

variable "location" {
  description = "The Azure region to create the resources in"
  type        = string
}

variable "size" {
  description = "The hardware resource quota to support the compute workloads"
  type        = string
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine"
  type        = string
}

variable "network_interface_id" {
  description = "The primary network interface to attach to the virtual machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the Public Key which should be used for authentication to the virtual machine"
  type        = string
}

variable "image_publisher" {
  description = "The publisher of the image used to create the virtual machine"
  type        = string
}

variable "image_offer" {
  description = "The offer of the image used to create the virtual machine"
  type        = string
}

variable "image_sku" {
  description = "The SKU of the image used to create the virtual machine"
  type        = string
}

variable "image_version" {
  description = "The version of the image used to create the virtual machine"
  type        = string
}
