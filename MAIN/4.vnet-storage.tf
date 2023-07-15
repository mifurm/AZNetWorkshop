resource "azurerm_virtual_network" "vnet-storage" {
  provider = azurerm.sub-10
  name                = "vnet-storage"
  location            = azurerm_resource_group.ws-rg02.location
  resource_group_name = azurerm_resource_group.ws-rg02.name
  address_space       = var.vnet-storage
}

resource "azurerm_subnet" "vnet-storage-defaultsubnet" {
  provider = azurerm.sub-10
  name                 = "default"
  resource_group_name  = azurerm_resource_group.ws-rg02.name
  virtual_network_name = azurerm_virtual_network.vnet-storage.name
  address_prefixes     = var.vnet-storage
}