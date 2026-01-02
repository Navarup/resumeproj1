terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-navarup-rg"
    storage_account_name = "tfstagebackendnavarup"
    container_name       = "tfstate"
    key                  = "stage.tfstate"
  }
}
