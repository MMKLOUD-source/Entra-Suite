# Terraform - Création d'un tenant Entra ID

provider "azurerm" {
  features {}
}

resource "azurerm_ad_tenant" "entra_tenant" {
  display_name = "MyEntraTenant"
  country      = "FR"
}

output "tenant_id" {
  value = azurerm_ad_tenant.entra_tenant.id
}

