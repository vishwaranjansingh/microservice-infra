terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

variable "client_id" {
  type    = string
  default = null
}

variable "client_secret" {
  type      = string
  default   = null
  sensitive = true
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "tenant_id" {
  type    = string
  default = null
}

provider "azurerm" {
  features {}

  # Allow authentication via environment variables or explicit variables
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  # Often required for Service Principals with limited permissions
  skip_provider_registration = true
}
