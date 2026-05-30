data "azurerm_kubernetes_service_versions" "current" {
  for_each = var.clusters

  location        = each.value.location
  include_preview = false
}
