###
# CLOUD-DKFW
###
# resource "azurerm_public_ip" "CLOUD-DKFW-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKFW-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-DKFW-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DKFW-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DKFW-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKFW-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DKFW" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DKFW"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DKFW-NIC.id,
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
# resource "azurerm_public_ip" "CLOUD-DKDC-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKDC-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
#}

resource "azurerm_network_interface" "CLOUD-DKDC-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DKDC-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DKDC-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKDC-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DKDC" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DKDC"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DKDC-NIC.id,
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
# CLOUD-DKSRV1
###
# resource "azurerm_public_ip" "CLOUD-DKSRV1-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKSRV1-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-DKSRV1-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DKSRV1-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DKSRV1-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKSRV1-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DKSRV1" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DKSRV1"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DKSRV1-NIC.id,
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
# CLOUD-DKSRV2
###
# resource "azurerm_public_ip" "CLOUD-DKSRV2-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKSRV2-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-DKSRV2-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DKSRV2-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DKSRV2-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKSRV2-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DKSRV2" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DKSRV2"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DKSRV2-NIC.id,
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
# CLOUD-DKCLIENT
###
# resource "azurerm_public_ip" "CLOUD-DKCLIENT-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKCLIENT-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

resource "azurerm_network_interface" "CLOUD-DKCLIENT-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DKCLIENT-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DKCLIENT-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKCLIENT-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DKCLIENT" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DKCLIENT"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DKCLIENT-NIC.id,
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