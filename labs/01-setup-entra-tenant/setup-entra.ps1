# Script PowerShell - Création d'un tenant Entra ID

# Se connecter à Azure
Connect-AzAccount

# Créer un tenant Entra ID
New-AzADTenant -DisplayName "MyEntraTenant" -Country "FR"

# Obtenir l'ID du tenant créé
$tenant = Get-AzTenant | Where-Object {$_.DisplayName -eq "MyEntraTenant"}
Write-Output "Tenant ID: $($tenant.Id)"

# Créer un utilisateur administrateur
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "P@ssw0rd!"
New-AzADUser -DisplayName "Admin Entra" -UserPrincipalName "admin@myentratenant.onmicrosoft.com" -PasswordProfile $PasswordProfile -MailNickName "AdminEntra"

# Assigner un rôle Global Administrator
New-AzRoleAssignment -ObjectId (Get-AzADUser -UserPrincipalName "admin@myentratenant.onmicrosoft.com").Id -RoleDefinitionName "Global Administrator"

Write-Output "Tenant et administrateur créés avec succès !"

