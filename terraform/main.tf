# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  subscription_id = "3038df55-5424-492e-b9b5-eafbdac21ff7"
  client_id       = "21280ce6-5127-4813-a9d9-581db0f2abf3"
  client_secret   = "9zU8Q~UnzAfT2MKrgRho0NEcNHfYALOO1x7pMdgD"
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

resource "azurerm_resource_group" "rg" {
  name     = "practica_rg"
  location = var.location

  tags = {
    environment = "CP2"
  }

}
# Storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "stAccount" {
  name                     = "storageaccountunir1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }

}
