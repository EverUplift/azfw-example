terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.107"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6.2"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.13.1"
    }
  }
}

provider "azurerm" {
  features {}
}
