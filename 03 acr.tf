resource "azurerm_container_registry" "dev_acr" {
  name                = var.dev_acr_name ## Global value should be defined and we can use random terraform method instead of harcoding name
  resource_group_name = azurerm_resource_group.dev_rg.name
  location            = azurerm_resource_group.dev_rg.location
  sku                 = "Premium"
  admin_enabled       = false 
  tags = local.tags
  identity {
    type = "SystemAssigned"
  }
  
}
## for now azure acr is public registry for testing
## Always enable private registry and access via vnet private endpoint 