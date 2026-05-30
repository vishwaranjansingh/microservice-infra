resource "azurerm_container_registry" "this" {
  for_each = var.container_registries

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  tags                = each.value.tags

  dynamic "georeplications" {
    for_each = each.value.sku == "Premium" ? each.value.georeplications : []
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
    }
  }
}
