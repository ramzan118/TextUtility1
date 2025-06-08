output "vm_public_ip" {
  description = "Public IP address of the development VM"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}

output "ssh_connection_command" {
  description = "SSH connection command to the VM"
  value       = "ssh azureuser@${azurerm_public_ip.vm_public_ip.ip_address}"
}

output "application_url" {
  description = "URL to access the React application"
  value       = "http://${azurerm_public_ip.vm_public_ip.ip_address}"
}

output "acr_login_server" {
  description = "ACR login server URL"
  value       = "${var.acr_name}.azurecr.io"
}