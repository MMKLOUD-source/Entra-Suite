# variables.tf - Définition des variables pour Terraform

variable "tenant_name" {
  description = "Nom du tenant Entra ID à créer"
  type        = string
  default     = "MyEntraTenant"
}

variable "location" {
  description = "Emplacement Azure pour les ressources associées"
  type        = string
  default     = "francecentral"
}

variable "admin_username" {
  description = "Nom d'utilisateur de l'administrateur Entra ID"
  type        = string
  default     = "admin@myentratenant.onmicrosoft.com"
}

variable "admin_password" {
  description = "Mot de passe de l'administrateur Entra ID"
  type        = string
  sensitive   = true
}
