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

provider "azurerm" {
  features {}
}


### Authenticate with Azure before running terraform script

# az login --tenant <myTenantID> (sign in with a different tenant)
# az account set --subscription "My Demos" (set to subscription where you want to provision infra)

