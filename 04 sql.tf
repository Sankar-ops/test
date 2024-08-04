
resource "azurerm_private_dns_zone" "dns-zone" {
  name                = var.dns_zone
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns-zone-link" {
  name                  = var.dns_zone_link
  private_dns_zone_name = azurerm_private_dns_zone.dns-zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = azurerm_resource_group.rg.name
  depends_on            = [azurerm_subnet.db-sub]
}


resource "azurerm_postgresql_flexible_server" "db" {
  name                          = var.sql_name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  version                       = "16"
  delegated_subnet_id           = azurerm_subnet.db-sub.id
  private_dns_zone_id           = azurerm_private_dns_zone.dns-zone.id
  public_network_access_enabled = false
  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password
  zone                          = "1"
  storage_mb   = 32768
  storage_tier = "P30"

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.dns-zone-link]
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}

## Database is can be acessed inside vnet/privatelink. 
## Now Aure App Service will talk Azure PostgreSql through vnet 
