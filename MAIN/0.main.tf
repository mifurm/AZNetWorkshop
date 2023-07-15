###
### TODO: Setup Your provider
###
provider "azurerm" {
  alias = "sub-06"
  subscription_id = var.sub-06
  features {}
}

provider "azurerm" {
  alias = "sub-10"
  subscription_id = var.sub-10
  features {}
}

provider "azurerm" {
  alias = "sub-03"
  subscription_id = var.sub-03
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

