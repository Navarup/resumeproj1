terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.57.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  subscription_id = "d2609e18-30c1-475a-95ff-1d14a3b0e636"

  features {
    
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}