

resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "S1"
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}


resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id
  virtual_network_subnet_id= azurerm_subnet.app-sub.id
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
  site_config {}

}


## Now Aure App Service will talk Azure PostgreSql through vnet 
## Also Map Azure PostgreSql connection string in Azure App service and String vaule should be secured in Azure vault 
## we should pass Acr Environment varibales through App code or pipeline code to Azure appp service


## if you don't want to compromise sql server password even though secured in key vault but still
## we can go with  Manged Identity iam role assignments and pass sql connection string in azure app service like 
## Server=my-sql-server.database.windows.net,1433;Database=my-database;Authentication=Active Directory Default
