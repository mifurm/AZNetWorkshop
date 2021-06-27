resource "azurerm_redis_cache" "redis" {
  name                = "karoltestuje"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 3
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  #shard_count = 1

  redis_configuration {
  }
}