terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }   
}
## Defined remote backend for storing state file

## backend "azurerm" {                                    # provider backend azurerm
## resource_group_name  = "StorageAccount-ResourceGroup"  # define existing resource group
## storage_account_name = "abcd1234"                      # define existing storage account name
## container_name       = "tfstate"                       # define existing storage account container 
## key                  = "prod.terraform.tfstate"        # define state file name


provider "azurerm" {
  features {}
}



### Authenticate with Azure before running terraform script

# az login --tenant <myTenantID> (sign in with a different tenant)
# az account set --subscription "My Demos" (set to subscription where you want to provision infra)