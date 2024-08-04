variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "location" {
  description = "Name of the Azure Resource Group location"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
}

variable "app_nsg_name"{
  description = "Name of the Dev NSG"
}

variable "db_nsg_name"{
  description = "Name of the Db NSG"
}

variable "vnet_address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "app_subnet_name" {
  description = "Name of the Subnet"
}

variable "app_subnet_address_prefix" {
  description = "Address prefix of the APPSubnet"
  type        = list(string)
  
}

variable "db_subnet_name" {
  description = "Name of the Subnet"
}

variable "db_subnet_address_prefix" {
  description = "Address prefix of the DBSubnet"
  type        = list(string)
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
}

variable "app_service_name" {
  description = "Name of the App Service"
}
variable "dns_zone"{
  description = "Name of the Dns zone"
}
variable "dns_zone_link" {
  description = "Name of the Dns zone link"
}
variable "sql_name" {
  default = "Name of the sql"
}
variable "administrator_login" {
  default = "Name of the sql admin"
}
variable "administrator_password" {
  default = "Password of the sql"
}
variable "acr_name" {
  default = "Name of the acr "
}
variable "upload_storage_account_name" {
  default = "Name of the storage account  " 
}
variable "static_storage_account_name" {
  default = "Name of the storage account  " 
}
variable "Environment" {
  default = " Name of the environment" 
}
variable "Owner" {
  default = " Name of the Owner" 
}
variable "Project" {
  default = " Name of the Project" 
}
