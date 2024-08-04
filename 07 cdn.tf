# resource "azurerm_cdn_profile" "profile" {
#   name                = "example-cdn"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku                 = "Standard_Microsoft"
# }

# resource "azurerm_cdn_endpoint" "endpoint" {
#   name                = "example"
#   profile_name        = azurerm_cdn_profile.profile.name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   origin {
#     name      = "storage"
#     host_name = azurerm_storage_account.storage-static.primary_web_host
#   }
# }

# ### Azure CDN Configuring with azure storage account url (orgin host)
# ## We need to copy azure cdn url with child asset path and map inside application code. 