
resource "azurerm_network_security_group" "nsg-app" {
  name                = var.app_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}

resource "azurerm_network_security_group" "nsg-db" {
  name                = var.db_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}

resource "azurerm_subnet" "app-sub" {
  name                 = var.app_subnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.app_subnet_address_prefix
  delegation {
    name = "example-delegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "db-sub" {
  name                 = var.db_subnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes     = var.db_subnet_address_prefix
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

resource "azurerm_subnet_network_security_group_association" "appsub-association" {
  subnet_id                 = azurerm_subnet.app-sub.id
  network_security_group_id = azurerm_network_security_group.nsg-app.id
}

resource "azurerm_subnet_network_security_group_association" "dbsu-association" {
  subnet_id                 = azurerm_subnet.db-sub.id
  network_security_group_id = azurerm_network_security_group.nsg-db.id
}

