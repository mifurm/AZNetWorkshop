data "azurerm_virtual_network" "vnet-spoke" {
  name = "vnet-spoke"
  resource_group_name = azurerm_resource_group.dev-prolab-rg[0].name
}
 
data "azurerm_subnet" "vnet-spoke-1"{
  name = "vnet-spoke-1"
  resource_group_name = azurerm_resource_group.dev-prolab-rg[0].name
  virtual_network_name = data.azurerm_virtual_network.vnet-spoke.name
}
 
resource "azurerm_network_interface" "vm-wfe01-dev-nic-01" {
  name                = "vm-wfe01-dev-nic-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.dev-prolab-rg[0].name
 
  ip_configuration {
    name                          = "vm-wfe01-dev-nic-config-01"
    subnet_id                     = data.azurerm_subnet.vnet-spoke-1.id
    private_ip_address_allocation = "Dynamic"
  }
}
