variable "clusters" {
  description = "A map of AKS clusters to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    dns_prefix          = string
    node_count          = number
    vm_size             = string
    os_disk_size_gb     = number
    sku_tier            = string
    acr_id              = string
    network_profile = object({

      network_plugin    = string
      load_balancer_sku = string
    })
  }))
}
