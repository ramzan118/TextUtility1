variable "resource_group_name" {
  default = "Test_resource_group"
}

variable "location" {
  default = "eastus"
}

variable "vm_name" {
  default = "dev-vm"
}

variable "admin_username" {
  default = "azureuser"
}

variable "acr_name" {
  default = "myimagerepo"
}
variable "subscription_id" {
  type = string
}
variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  default     = "C:/Users/Ramzan/.ssh/id_rsa.pub"
}