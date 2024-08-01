resource "azurerm_storage_account" "dev_storage" {
  name                     = var.dev_storage_account_name ## Global value should be defined and we can use random terraform method instead of harcoding name
  resource_group_name      = azurerm_resource_group.dev_rg.name
  location                 = azurerm_resource_group.dev_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = local.tags
}
 
## This is public storage account to upload static files in a container ###
## Azure CDN will be mapped with Azure storage Account as orgin name ####
