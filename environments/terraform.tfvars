environments = {
  dev = {
    location            = "East US"
    resource_group_name = "microservice-dev-rg"
    tags = {
      Environment = "Development"
      Project     = "Microservice"
      ManagedBy   = "Terraform"
    }
    acr_config = {
      name            = "microdevacr2026"
      sku             = "Standard"
      admin_enabled   = true
      georeplications = []
    }
    aks_config = {
      name       = "aks-dev-cluster"
      dns_prefix = "aksdev"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
      network_profile = {
        network_plugin    = "kubenet"
        load_balancer_sku = "standard"
      }
    }
  }

  prod = {
    location            = "West US"
    resource_group_name = "microservice-prod-rg"
    tags = {
      Environment = "Production"
      Project     = "Microservice"
      ManagedBy   = "Terraform"
    }
    acr_config = {
      name          = "microprodacr2026"
      sku           = "Premium"
      admin_enabled = false
      georeplications = [
        {
          location                = "East US"
          zone_redundancy_enabled = true
        }
      ]
    }
    aks_config = {
      name       = "aks-prod-cluster"
      dns_prefix = "aksprod"
      node_count = 3
      vm_size    = "Standard_DS3_v2"
      network_profile = {
        network_plugin    = "azure"
        load_balancer_sku = "standard"
      }
    }
  }
}
