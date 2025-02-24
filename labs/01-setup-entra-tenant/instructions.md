Prérequis pour Terraform
Outils nécessaires
Avant de commencer à utiliser Terraform pour déployer Microsoft Entra ID, assurez-vous d'avoir les outils suivants installés sur votre machine :

Terraform (dernière version stable)

Télécharger et installer : Terraform CLI
Vérifier l'installation :
terraform -v
Azure CLI (pour l'authentification et la gestion des ressources Azure)

Télécharger et installer : Azure CLI
Vérifier l'installation :
az version
Compte Azure avec droits suffisants

Vous devez disposer d’un abonnement Azure valide et des permissions pour créer un tenant Entra ID.
Authentification à Azure
Avant d'exécuter Terraform, connectez-vous à votre compte Azure :

az login
Si vous avez plusieurs abonnements, définissez celui à utiliser :

az account set --subscription "ID_DE_VOTRE_ABONNEMENT"
Configuration de Terraform
Initialiser Terraform dans le projet
terraform init
Vérifier la configuration
terraform validate
Simuler les modifications à appliquer
terraform plan
Appliquer la configuration
terraform apply -auto-approve
Étapes suivantes
Une fois le tenant Entra ID déployé, vous pourrez consulter les valeurs retournées par Terraform dans outputs.tf et procéder à d'autres configurations selon vos besoins.

Besoin d’aide ? Consultez la documentation officielle Terraform & Azure
