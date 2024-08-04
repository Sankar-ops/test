resource "random_id" "storage-account-static" {
  byte_length = 2
}

resource "random_id" "storage-account-upload" {
  byte_length = 2
}

resource "azurerm_storage_account" "storage-static" {
  name                     = "${var.static_storage_account_name}${random_id.storage-account-static.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}

resource "azurerm_storage_account" "storage-upload" {
  name                     = "${var.upload_storage_account_name}${random_id.storage-account-upload.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}
 
## This is public storage accounts to upload  files and acess static assets (Froom cdn ) in in a container 
## Azure CDN will be mapped with Azure storage Account ( storage-static) as orgin name 
