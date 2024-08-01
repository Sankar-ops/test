##data "azurerm_key_vault" "kv" {
##name                = "mykeyvault" ## Required to define existing key vault name
##resource_group_name = "some-resource-group"  ## Required to define resource group name
##}

## data "azurerm_key_vault_secret" "sec" {
##name         = "secret"
##key_vault_id = data.azurerm_key_vault.kv.id  ## passing keyvault id name 
##}

resource "azurerm_private_dns_zone" "dev_dns_zone" {
  name                = var.dev_dns_zone
  resource_group_name = azurerm_resource_group.dev_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dev_dns_zone_link" {
  name                  = var.dev_dns_zone_link
  private_dns_zone_name = azurerm_private_dns_zone.dev_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.dev_vnet.id
  resource_group_name   = azurerm_resource_group.dev_rg.name
  depends_on            = [azurerm_subnet.dev_db_sub]
}


resource "azurerm_postgresql_flexible_server" "dev_db" {
  name                          = var.dev_sql_name
  resource_group_name           = azurerm_resource_group.dev_rg.name
  location                      = azurerm_resource_group.dev_rg.location
  version                       = "16"
  delegated_subnet_id           = azurerm_subnet.dev_db_sub.id
  private_dns_zone_id           = azurerm_private_dns_zone.dev_dns_zone.id
  public_network_access_enabled = false
  administrator_login           = "psqladmin"
  zone                          = "1"
  storage_mb   = 32768
  storage_tier = "P30"

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.dev_dns_zone_link]

}
##administrator_password = data.azurerm_key_vault_secret.sec.value ## feteching scret vaule from azure key vault secret
##terraform will create azurerm_postgresql_flexible_server without administrator_password

## administrator password should be feteched from Azure key vault 
## Database is can be acessed inside vnet/privatelink. 
## now Aure App Service will talk Azure PostgreSql through vnet 
## Also Map Azure PostgreSql connection string in Azure App service and String vaule should be secured in Azure vault 
