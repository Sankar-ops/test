 resource "azurerm_resource_group" "dev_rg" {
  name     = var.dev_resource_group_name
  location = var.dev_location
  tags = local.tags
}