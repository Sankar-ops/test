resource "random_id" "acr-suffix" {
  byte_length = 2
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.acr_name}${random_id.acr-suffix.hex}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = false 
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
  identity {
    type = "SystemAssigned"
  }
  
}
## for now azure acr is public registry for testing
## Always enable private registry and access via vnet private endpoint 