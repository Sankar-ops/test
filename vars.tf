variable "dev_resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "dev_location" {
  description = "Name of the Azure Resource Group location"
}

variable "dev_vnet_name" {
  description = "Name of the Virtual Network"
}

variable "dev_app_nsg_name"{
  description = "Name of the Dev NSG"
}

variable "dev_db_nsg_name"{
  description = "Name of the Db NSG"
}

variable "dev_vnet_address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "dev_app_subnet_name" {
  description = "Name of the Subnet"
}

variable "dev_app_subnet_address_prefix" {
  description = "Address prefix of the APPSubnet"
  type        = list(string)
  
}

variable "dev_db_subnet_name" {
  description = "Name of the Subnet"
}

variable "dev_db_subnet_address_prefix" {
  description = "Address prefix of the DBSubnet"
  type        = list(string)
}

variable "dev_app_service_plan_name" {
  description = "Name of the App Service Plan"
}

variable "dev_app_service_name" {
  description = "Name of the App Service"
}
variable "dev_dns_zone"{
  description = "Name of the Dns zone"
}
variable "dev_dns_zone_link" {
  description = "Name of the Dns zone link"
}
variable "dev_sql_name" {
  default = "Name of the sql"
}
variable "dev_acr_name" {
  default = "Name of the acr "
}
variable "dev_storage_account_name" {
  default = "Name of the storage account  " 
}

