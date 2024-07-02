terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.107"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.13"
    }
  }
  backend "azurerm" {
    storage_account_name = "stoalzcptb1ger001izha"
    container_name       = "cptb1-tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    subscription_id      = "49832f1c-479a-4680-9227-0f16c7f51fea"
    tenant_id            = "57ad7d55-bb4d-408b-97ea-198d5023f646"
  }
}

provider "azapi" {
  skip_provider_registration = true
  subscription_id            = var.subscription_id_management
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  skip_provider_registration = true
  alias                      = "management"
  subscription_id            = var.subscription_id_management
  features {}
}

provider "azurerm" {
  skip_provider_registration = true
  alias                      = "connectivity"
  subscription_id            = var.subscription_id_connectivity
  features {}
}

provider "azurerm" {
  alias           = "identity"
  subscription_id = var.subscription_id_identity
  features {}
}
