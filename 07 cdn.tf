resource "azurerm_cdn_profile" "dev_cdn_profile" {
  name                = "example-cdn"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "dev_cdn_endpoint" {
  name                = "example"
  profile_name        = azurerm_cdn_profile.dev_cdn_profile.name
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name

  origin {
    name      = "storage"
    host_name = azurerm_storage_account.dev_storage.primary_web_host
  }
}

### Azure CDN Configuring with azure storage account url (orgin host)
## We need to copy azure cdn url with child asset path and map inside application code. 