###
# CLOUD-PLFW
###
# resource "azurerm_public_ip" "CLOUD-PLFW-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-PLFW-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-PLFW-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-PLFW-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-PLFW-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-pl.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-PLFW-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-PLFW" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-PLFW"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-PLFW-NIC.id,
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
# CLOUD-PLDC
###
# resource "azurerm_public_ip" "CLOUD-PLDC-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-PLDC-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-PLDC-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-PLDC-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-PLDC-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-pl.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-PLDC-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-PLDC" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-PLDC"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-PLDC-NIC.id,
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
# CLOUD-PLSRV
###
# resource "azurerm_public_ip" "CLOUD-PLSRV-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-PLSRV-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-PLSRV-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-PLSRV-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-PLSRV-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-pl.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-PLSRV-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-PLSRV" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-PLSRV"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-PLSRV-NIC.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter-Core"
    version   = "latest"
  }
}

###
# CLOUD-PLCLIENT
###
# resource "azurerm_public_ip" "CLOUD-PLCLIENT-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-PLCLIENT-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-PLCLIENT-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-PLCLIENT-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-PLCLIENT-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-pl.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-PLCLIENT-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-PLCLIENT" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-PLCLIENT"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-PLCLIENT-NIC.id,
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