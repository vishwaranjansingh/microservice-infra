module "resource_group" {
  source = "../modules/azurerm_resource_group"
  resource_groups = {
    for k, v in var.environments : k => {
      name     = v.resource_group_name
      location = v.location
      tags     = v.tags
    }
  }
}

module "acr" {
  source = "../modules/azurerm_container_registry"
  container_registries = {
    for k, v in var.environments : k => {
      name                = v.acr_config.name
      resource_group_name = module.resource_group.resource_group_names[k]
      location            = module.resource_group.resource_group_locations[k]
      sku                 = v.acr_config.sku
      admin_enabled       = v.acr_config.admin_enabled
      georeplications     = v.acr_config.georeplications
      tags                = v.tags
    }
  }
}

module "aks" {
  source = "../modules/azurerm_kubernetes_service"
  clusters = {
    for k, v in var.environments : k => {
      name                = v.aks_config.name
      resource_group_name = module.resource_group.resource_group_names[k]
      location            = module.resource_group.resource_group_locations[k]
      dns_prefix          = v.aks_config.dns_prefix
      node_count          = v.aks_config.node_count
      vm_size             = v.aks_config.vm_size
      os_disk_size_gb     = v.aks_config.os_disk_size_gb
      acr_id              = module.acr.registry_ids[k]
      network_profile     = v.aks_config.network_profile
    }
  }
}
