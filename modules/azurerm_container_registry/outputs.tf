output "registry_ids" {
  description = "A map of container registry IDs"
  value       = { for k, v in azurerm_container_registry.this : k => v.id }
}

output "registry_names" {
  description = "A map of container registry names"
  value       = { for k, v in azurerm_container_registry.this : k => v.name }
}
