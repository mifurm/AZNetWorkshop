resource "azurerm_resource_group" "global-net-rg" {
        provider = azurerm.sub-10
        name = "global-net-rg"
        location = var.location-swc
}

resource "azurerm_resource_group" "hub-net-rg" {
        provider = azurerm.sub-10
        name = "hub-net-rg"
        location = var.location-swc
}

# resource "azurerm_resource_group" "dev-prolab-rg" {
#         count = var.number-of-net
#         name = "dev-prolab${count.index}-rg"
#         location = var.location
# }