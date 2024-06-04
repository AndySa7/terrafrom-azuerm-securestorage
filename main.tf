terraform {
  required_version = ">=1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
}

locals {
  tags = {
    "environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name           = var.resource_group_name
  location                      = var.location
  name                          = var.name
  account_tier                  = "Standard"
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"
  public_network_access_enabled = false
  tags                          = local.tags
}