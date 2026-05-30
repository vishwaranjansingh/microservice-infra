environments = {
  dev = {
    location            = "Japan West"
    resource_group_name = "microservice-dev-rg"
    tags = {
      Environment = "Development"
      Project     = "Microservice"
      ManagedBy   = "Terraform"
    }
    acr_config = {
      name            = "microdevacr2026"
      sku             = "Basic"
      admin_enabled   = true
      georeplications = []
    }
    aks_config = {
      name            = "aks-dev-cluster"
      dns_prefix      = "aksdev"
      node_count      = 1
      vm_size         = "Standard_B2s"
      os_disk_size_gb = 30
      sku_tier        = "Free"
      network_profile = {
        network_plugin    = "kubenet"
        load_balancer_sku = "standard"
      }
    }
  }

  # prod = {
  #   location            = "Japan West"
  #   resource_group_name = "microservice-prod-rg"
  #   tags = {
  #     Environment = "Production"
  #     Project     = "Microservice"
  #     ManagedBy   = "Terraform"
  #   }
  #   acr_config = {
  #     name            = "microprodacr2026"
  #     sku             = "Basic"
  #     admin_enabled   = false
  #     georeplications = []
  #   }
  #   aks_config = {
  #     name            = "aks-prod-cluster"
  #     dns_prefix      = "aksprod"
  #     node_count      = 1
  #     vm_size         = "Standard_B2s"
  #     os_disk_size_gb = 30
  #     sku_tier        = "Free"
  #     network_profile = {
  #       network_plugin    = "kubenet"
  #       load_balancer_sku = "standard"
  #     }
  #   }
  # }
}
