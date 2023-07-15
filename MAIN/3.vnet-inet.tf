resource "azurerm_virtual_network" "vnet-inet" {
  provider            = azurerm.sub-06
  name                = "vnet-inet"
  location            = azurerm_resource_group.ws-rg01.location
  resource_group_name = azurerm_resource_group.ws-rg01.name
  address_space       = var.vnet-inet
}

resource "azurerm_subnet" "vnet-inet-defaultsubnet" {
    provider = azurerm.sub-06
    name                 = "default"
    virtual_network_name = azurerm_virtual_network.vnet-inet.name
    resource_group_name  = azurerm_resource_group.ws-rg01.name
    address_prefixes     = var.vnet-inet
}