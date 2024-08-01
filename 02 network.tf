
resource "azurerm_network_security_group" "nsg_dev_app" {
  name                = var.dev_app_nsg_name
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  tags = local.tags
}

resource "azurerm_network_security_group" "nsg_dev_db" {
  name                = var.dev_db_nsg_name
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  tags = local.tags
}

resource "azurerm_virtual_network" "dev_vnet" {
  name                = var.dev_vnet_name
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  address_space       = var.dev_vnet_address_space
  tags = local.tags
}

resource "azurerm_subnet" "dev_app_sub" {
  name                 = var.dev_app_subnet_name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  resource_group_name  = azurerm_resource_group.dev_rg.name
  address_prefixes     = var.dev_app_subnet_address_prefix
  delegation {
    name = "example-delegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  
}

resource "azurerm_subnet" "dev_db_sub" {
  name                 = var.dev_db_subnet_name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  resource_group_name = azurerm_resource_group.dev_rg.name
  address_prefixes     = var.dev_db_subnet_address_prefix
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "dev_appsub_association" {
  subnet_id                 = azurerm_subnet.dev_app_sub.id
  network_security_group_id = azurerm_network_security_group.nsg_dev_app.id
}

resource "azurerm_subnet_network_security_group_association" "dev_dbsub_association" {
  subnet_id                 = azurerm_subnet.dev_db_sub.id
  network_security_group_id = azurerm_network_security_group.nsg_dev_db.id
}

