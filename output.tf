output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.this.public_ip_address
}

output "ssh_public_key" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
}

output "ssh_private_key" {
  value     = jsondecode(azapi_resource_action.ssh_public_key_gen.output).privateKey
  sensitive = true
}
