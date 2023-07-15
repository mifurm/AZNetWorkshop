resource "azurerm_resource_group" "ws-rg01" {
        provider = azurerm.sub-06
        name = "ws-rg01"
        location = var.location-swc
}

resource "azurerm_resource_group" "ws-rg02" {
        provider = azurerm.sub-10
        name = "ws-rg02"
        location = var.location-plc
}

# resource "azurerm_resource_group" "dev-prolab-rg" {
#         count = var.number-of-net
#         name = "dev-prolab${count.index}-rg"
#         location = var.location
# }