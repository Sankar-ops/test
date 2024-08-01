
resource "azurerm_app_service_plan" "dev_app_plan" {
  name                = var.dev_app_service_plan_name
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
  tags = local.tags
}


resource "azurerm_app_service" "dev_app" {
  name                = var.dev_app_service_name
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  app_service_plan_id = azurerm_app_service_plan.dev_app_plan.id
  tags = local.tags
}

##vnet integration###

resource "azurerm_app_service_virtual_network_swift_connection" "dev_swift" {
  app_service_id = azurerm_app_service.dev_app.id
  subnet_id      = azurerm_subnet.dev_app_sub.id
}

## Now Aure App Service will talk Azure PostgreSql through vnet 
## Also Map Azure PostgreSql connection string in Azure App service and String vaule should be secured in Azure vault 
## we should pass Acr Environment varibales through App code or pipeline code to Azure appp service


## if you don't want to compromise sql server password even though secured in key vault but still
## we can go with  Manged Identity iam role assignments and pass sql connection string in azure app service like 
## Server=my-sql-server.database.windows.net,1433;Database=my-database;Authentication=Active Directory Default
