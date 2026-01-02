resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = var.location
}

# get current tenant & object info
data "azurerm_client_config" "current" {}

module "keyvault" {
  source        = "./modules/keyvault"
  keyvault_name = var.keyvault_name
  location      = var.location

  # 🔴 CHANGED: was var.rgname
  resource_group_name = azurerm_resource_group.rg1.name

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  # ✅ ADDED: explicit dependency
  depends_on = [
    azurerm_resource_group.rg1
  ]
}

module "aks" {
  source        = "./modules/aks"
  location      = var.location
  client_id     = var.client_id
  client_secret = var.client_secret

  # 🔴 CHANGED: was var.rgname
  resource_group_name = azurerm_resource_group.rg1.name

  # ✅ ADDED: explicit dependency
  depends_on = [
    azurerm_resource_group.rg1
  ]
}

resource "local_file" "kubeconfig" {
  depends_on = [module.aks]
  filename   = "./kubeconfig"
  content    = module.aks.config
}
