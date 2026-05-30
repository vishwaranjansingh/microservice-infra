output "resource_group_names" {
  description = "A map of resource group names"
  value       = { for k, v in azurerm_resource_group.this : k => v.name }
}

output "resource_group_locations" {
  description = "A map of resource group locations"
  value       = { for k, v in azurerm_resource_group.this : k => v.location }
}
