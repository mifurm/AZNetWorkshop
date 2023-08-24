###
# CLOUD-DKAPP
###
# resource "azurerm_public_ip" "CLOUD-DKFW-PIP" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKFW-PIP"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name
#   allocation_method       = "Dynamic"
#   idle_timeout_in_minutes = 30
# }

# resource "azurerm_network_interface" "CLOUD-DKAPP-NIC" {
#   provider                = azurerm.sub-10
#   name                    = "CLOUD-DKAPP-NIC"
#   location                = azurerm_resource_group.ws-rg02.location
#   resource_group_name     = azurerm_resource_group.ws-rg02.name

#   ip_configuration {
#     name                          = "CLOUD-DKAPP-NIC-CONFIG"
#     subnet_id                     = azurerm_subnet.subnet-dk.id
#     private_ip_address_allocation = "Dynamic"
#     #public_ip_address_id = azurerm_public_ip.CLOUD-DKFW-PIP.id
#   }
# }

# resource "azurerm_windows_virtual_machine" "CLOUD-DKAPP" {
#   provider               = azurerm.sub-10
#   name                   = "CLOUD-DKAPP"
#   location               = azurerm_resource_group.ws-rg02.location
#   resource_group_name    = azurerm_resource_group.ws-rg02.name
#   size                   = var.default-small-vm-size
#   admin_username         = var.default-admin-username
#   admin_password         = var.default-admin-pass

#   license_type = "Windows_Server"

#   network_interface_ids = [
#     azurerm_network_interface.CLOUD-DKAPP-NIC.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2022-Datacenter"
#     version   = "latest"
#   }
# }

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

resource "azurerm_network_interface" "CLOUD-DKSTORAGE-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DKSTORAGE-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DKSTORAGE-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKDC-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DKSTORAGE" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DKSTORAGE"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-small-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DKSTORAGE-NIC.id,
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
