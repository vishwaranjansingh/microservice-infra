resource "azurerm_kubernetes_cluster" "this" {
  for_each = var.clusters

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current[each.key].latest_version
  sku_tier            = each.value.sku_tier

  default_node_pool {
    name            = "default"
    node_count      = each.value.node_count
    vm_size         = each.value.vm_size
    os_disk_size_gb = each.value.os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? [each.value.network_profile] : []
    content {
      network_plugin    = network_profile.value.network_plugin
      load_balancer_sku = network_profile.value.load_balancer_sku
    }
  }

  tags = {
    Environment = each.key
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  for_each = var.clusters

  scope                = each.value.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this[each.key].kubelet_identity[0].object_id
}
