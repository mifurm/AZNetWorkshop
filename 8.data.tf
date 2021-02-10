data "azurerm_virtual_network" "vnet-hub" {
  name = "vnet-hub"
  resource_group_name = var.resourcegroupname
}
 
data "azurerm_subnet" "vnet-spoke-1"{
  name = "vnet-spoke-1"
  resource_group_name = var.resourcegroupname
  virtual_network_name = data.azurerm_virtual_network.vnet-hub
}
 
resource "azurerm_network_interface" "vm-wfe01-dev-nic-01" {
  name                = "vm-wfe01-dev-nic-01"
  location            = var.location
  resource_group_name = var.resourcegroupname
 
  ip_configuration {
    name                          = "vm-wfe01-dev-nic-config-01"
    subnet_id                     = data.azurerm_subnet.vnet-spoke-1.id
    private_ip_address_allocation = "Dynamic"
  }
}
