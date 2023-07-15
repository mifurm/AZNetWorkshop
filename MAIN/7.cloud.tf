###
# CLOUD-FW
###
# resource "azurerm_public_ip" "CLOUD-FW-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-FW-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-FW-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-FW-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-FW-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-cloud.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-FW-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-FW" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-FW"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-FW-NIC.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

###
# CLOUD-DC
###
# resource "azurerm_public_ip" "CLOUD-DC-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DC-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-DC-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DC-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DC-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-cloud.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DC-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DC" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DC"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-small-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DC-NIC.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

###
# CLOUD-ROOTCA
###

# resource "azurerm_public_ip" "CLOUD-ROOTCA-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-ROOTCA-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-ROOTCA-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-ROOTCA-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-ROOTCA-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-cloud.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-ROOTCA-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-ROOTCA" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-ROOTCA"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-small-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-ROOTCA-NIC.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}