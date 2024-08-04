 resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment = var.Environment
    Owner = var.Owner
    Project = var.Project
  }
}