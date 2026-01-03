terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfdevbackend2024piyush"
    container_name      = "tfstate"
    key                 = "dev.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }

  # Optional manual SP for local runs
  subscription_id = length(var.client_id) > 0 ? var.SUB_ID : null
  client_id       = length(var.client_id) > 0 ? var.client_id : null
  client_secret   = length(var.client_secret) > 0 ? var.client_secret : null
}
