terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-navarup-rg"
    storage_account_name = "tfdevbackendnavarup"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}

