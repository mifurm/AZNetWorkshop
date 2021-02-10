###
### TODO: Setup Your provider
###
provider "azurerm" {

  #TODO
  subscription_id= "<SUB ID>"
  
  #TODO
  tenant_id="<TENANT ID>"
  
  #TODO
  client_id="<APP ID>"
  
  #TODO
  client_secret="<SECRET>"
  
  version = "=2.30.0"
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
