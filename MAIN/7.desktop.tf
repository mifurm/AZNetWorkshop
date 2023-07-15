###
# CLOUD-DKAPP
###
resource "azurerm_public_ip" "CLOUD-DESKTOP-PIP" {
   provider                = azurerm.sub-10
   name                    = "CLOUD-DESKTOP-PIP"
   location                = azurerm_resource_group.ws-rg02.location
   resource_group_name     = azurerm_resource_group.ws-rg02.name
   allocation_method       = "Dynamic"
   idle_timeout_in_minutes = 30
}


resource "azurerm_network_interface" "CLOUD-DESKTOP-NIC" {
  provider                = azurerm.sub-10
  name                    = "CLOUD-DESKTOP-NIC"
  location                = azurerm_resource_group.ws-rg02.location
  resource_group_name     = azurerm_resource_group.ws-rg02.name

  ip_configuration {
    name                          = "CLOUD-DESKTOP-NIC-CONFIG"
    subnet_id                     = azurerm_subnet.subnet-dk.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.CLOUD-DKFW-PIP.id
  }
}

resource "azurerm_windows_virtual_machine" "CLOUD-DESKTOP" {
  provider               = azurerm.sub-10
  name                   = "CLOUD-DESKTOP"
  location               = azurerm_resource_group.ws-rg02.location
  resource_group_name    = azurerm_resource_group.ws-rg02.name
  size                   = var.default-small-vm-size
  admin_username         = var.default-admin-username
  admin_password         = var.default-admin-pass

  license_type = "Windows_Server"

  network_interface_ids = [
    azurerm_network_interface.CLOUD-DESKTOP-NIC.id,
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