resource "azurerm_virtual_network" "vnet-windows-env" {
  provider            = azurerm.sub-10
  name                = "vnet-windows-env"
  location            = azurerm_resource_group.ws-rg02.location
  resource_group_name = azurerm_resource_group.ws-rg02.name
  address_space       = var.vnet-windows-env
}

resource "azurerm_subnet" "subnet-cloud" {
  provider = azurerm.sub-10
  name                 = "subnet-cloud"
  resource_group_name  = azurerm_resource_group.ws-rg02.name
  virtual_network_name = azurerm_virtual_network.vnet-windows-env.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_subnet" "subnet-pl" {
  provider = azurerm.sub-10
  name                 = "subnet-pl"
  resource_group_name  = azurerm_resource_group.ws-rg02.name
  virtual_network_name = azurerm_virtual_network.vnet-windows-env.name
  address_prefixes     = ["10.2.0.0/24"]
}

resource "azurerm_subnet" "subnet-dk" {
  provider = azurerm.sub-10
  name                 = "subnet-dk"
  resource_group_name  = azurerm_resource_group.ws-rg02.name
  virtual_network_name = azurerm_virtual_network.vnet-windows-env.name
  address_prefixes     = ["10.3.0.0/24"]
}



# resource "azurerm_subnet_network_security_group_association" "subnet-frontend-nsg-association" {
#   count                     = var.number-of-net
#   subnet_id                 = azurerm_subnet.subnet-frontend[count.index].id
#   network_security_group_id = azurerm_network_security_group.NSG-FRONTEND[count.index].id
# }


# resource "azurerm_subnet_network_security_group_association" "subnet-backend-nsg-association" {
#   count                     = var.number-of-net
#   subnet_id                 = azurerm_subnet.subnet-backend[count.index].id
#   network_security_group_id = azurerm_network_security_group.NSG-BACKEND[count.index].id
# }

# resource "azurerm_subnet_network_security_group_association" "subnet-data-nsg-association" {
#   count                     = var.number-of-net
#   subnet_id                 = azurerm_subnet.subnet-data[count.index].id
#   network_security_group_id = azurerm_network_security_group.NSG-DATA[count.index].id
# }

# resource "azurerm_subnet_network_security_group_association" "subnet-dedicated-nsg-association" {
#   count                     = var.number-of-net
#   subnet_id                 = azurerm_subnet.subnet-dedicated[count.index].id
#   network_security_group_id = azurerm_network_security_group.NSG-DEDICATED[count.index].id
# }

