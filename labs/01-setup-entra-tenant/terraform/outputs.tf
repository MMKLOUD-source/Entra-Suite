# outputs.tf - Sorties de Terraform

output "tenant_id" {
  description = "ID du tenant Entra ID créé"
  value       = azurerm_ad_tenant.entra_tenant.id
}

output "admin_username" {
  description = "Nom d'utilisateur de l'administrateur créé"
  value       = var.admin_username
}

output "tenant_domain" {
  description = "Domaine par défaut du tenant Entra ID"
  value       = "${var.tenant_name}.onmicrosoft.com"
}

