resource "azurerm_postgresql_server" "pssql_db" {
  name                = "kaorl-psqlserver"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = var.db_name
  administrator_login_password =  var.db_pass

  sku_name   = "B_Gen5_2"
  version    = "10"
  storage_mb =  250 * 1024 //TODO: enoght?

  #backup_retention_days        = 7
  #geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  #public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  #ssl_minimal_tls_version_enforced = "TLS1_2"
}