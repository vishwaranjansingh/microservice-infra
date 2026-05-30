variable "environments" {
  description = "A map of environments to deploy, each with its own configuration"
  type = map(object({
    location            = string
    resource_group_name = string

    acr_config = object({
      name          = string
      sku           = string
      admin_enabled = bool
      georeplications = list(object({
        location                = string
        zone_redundancy_enabled = bool
      }))
    })

    aks_config = object({
      name       = string
      dns_prefix = string
      node_count = number
      vm_size    = string
      network_profile = object({
        network_plugin    = string
        load_balancer_sku = string
      })
    })

    tags = map(string)
  }))
}
