data "azurerm_kubernetes_service_versions" "current" {
  for_each = var.clusters

  location        = each.value.location
  include_preview = false
}

data "azurerm_container_registry" "this" {
  for_each = var.clusters

  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
}
