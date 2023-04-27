###
### TODO: Setup Your provider
###
provider "azurerm" {
  subscription_id = "4dc4b888-e3bc-4c76-951b-4ece151e3f19"
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
