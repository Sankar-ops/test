resource_group_name = "rg-dev-australiaeast-001"
#location = "Central US"
location = "Australia East"
vnet_name = "vnet-dev-australiaeast-001"
app_nsg_name = "app-nsg-dev-australiaeast-001"
db_nsg_name = "db-nsg-dev-australiaeast-001"
vnet_address_space = ["10.1.0.0/16"]
app_subnet_name = "app-subnet-dev-australiaeast-001"
app_subnet_address_prefix = ["10.1.0.0/28"]
db_subnet_name = "db-subnet-dev-australiaeast-001"
db_subnet_address_prefix = ["10.1.0.16/28"]
app_service_plan_name = "app-plan-dev-australiaeast-001"
app_service_name = "web-app-dev-australiaeast-001"
dns_zone= "dev.postgres.database.azure.com"
dns_zone_link= "devvnetzone.com"
sql_name= "devpocsqlflexibleserver02"
administrator_login= "psqladmin"
administrator_password= "H@Sh1CoR3!"
acr_name= "acrdevaustraliaeast1"
upload_storage_account_name= "stguploaddev" 
static_storage_account_name= "stgstaticdev"
Environment = "DEV"
Owner       = "Ravi"
Project     = "POC"

