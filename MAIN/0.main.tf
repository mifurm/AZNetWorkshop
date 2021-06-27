###
### TODO: Setup Your provider
###
provider "azurerm" {
  subscription_id = "7a3ff142-984a-4537-ad5a-cd0ace174e69"
  features {}
}

#TODO
#terraform {
#  backend "azurerm" {
#    storage_account_name = "<ACCOUNT NAME>" 
#    container_name       = "<CONTAINER>" 
#    key                  = "cloudeng.shared.terraform.tfstate"  
#    access_key  = 
#  }
#}
