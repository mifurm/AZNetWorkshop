provider "azurerm" {
  features {}
}

data "azurerm_subscription" "primary" {}

data "azurerm_client_config" "current" {}

provider "azuread" {}
provider "time" {}
provider "random" {}

variable "automation_account_name" {
  default = "testautomation"
}

variable "resource_group_name" {
  default = "rg"
}

variable "location" {
  default = "southeastasia"
}

resource "time_offset" "end_date" {
  offset_hours = 24 * 365
}

resource "azurerm_resource_group" "example" {
   
   name     = var.resource_group_name
   location = var.location
}

resource "random_string" "random" {
  length = 16
  special = false
}

resource "azuread_application" "test" {
  name = format("%s_%s", var.automation_account_name, random_string.random.result)
}

resource "azuread_application" "test2" {
  name = format("%s_%s", var.automation_account_name, random_string.random.result)
}

resource "azuread_application_certificate" "test" {
  application_object_id = azuread_application.test.id
  type                  = "AsymmetricX509Cert"
  value                 = file("certificate.crt")
  end_date              = time_offset.end_date.rfc3339
}

resource "azuread_application_certificate" "test2" {
  application_object_id = azuread_application.test2.id
  type                  = "AsymmetricX509Cert"
  value                 = file("certificate.crt")
  end_date              = time_offset.end_date.rfc3339
}

resource "azuread_service_principal" "test" {
  application_id = azuread_application.test.application_id

  depends_on = [
    azuread_application_certificate.test,
  ]
}

resource "azuread_service_principal" "test2" {
  application_id = azuread_application.test2.application_id

  depends_on = [
    azuread_application_certificate.test2,
  ]
}

resource "azuread_service_principal_certificate" "test" {
  service_principal_id = azuread_service_principal.test.id
  type                 = "AsymmetricX509Cert"
  value                = file("certificate.pem")
  end_date             = time_offset.end_date.rfc3339
}

resource "azuread_service_principal_certificate" "test2" {
  service_principal_id = azuread_service_principal.test2.id
  type                 = "AsymmetricX509Cert"
  value                = file("certificate.pem")
  end_date             = time_offset.end_date.rfc3339
}

#account used by automation-account
resource "azurerm_role_assignment" "test" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.test.object_id
}

resource "azurerm_role_assignment" "test2" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.test2.object_id
}

resource "azurerm_automation_account" "test" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"
}

resource "azurerm_automation_certificate" "test" {
  name                    = "AzureRunAsCertificate"
  resource_group_name     = azurerm_automation_account.test.resource_group_name
  automation_account_name = azurerm_automation_account.test.name
  base64                  = filebase64("certificate.pfx")
}

resource "azurerm_automation_connection_service_principal" "test" {
  name                    = "AzureRunAsConnection"
  resource_group_name     = azurerm_automation_account.test.resource_group_name
  automation_account_name = azurerm_automation_account.test.name
  application_id          = azuread_service_principal.test.application_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_id         = data.azurerm_client_config.current.subscription_id
  certificate_thumbprint  = azurerm_automation_certificate.test.thumbprint
}

resource "azurerm_automation_connection_service_principal" "test2" {
  name                    = "AzureRunAsConnection2"
  resource_group_name     = azurerm_automation_account.test.resource_group_name
  automation_account_name = azurerm_automation_account.test.name
  application_id          = azuread_service_principal.test2.application_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  subscription_id         = data.azurerm_client_config.current.subscription_id
  certificate_thumbprint  = azurerm_automation_certificate.test.thumbprint
}

# output "cert" {
#     value =     azurerm_automation_certificate.test.base64

# }

output "testapp" {
    value =     azuread_application.test.display_name

}
