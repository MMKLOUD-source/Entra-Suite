#  Prérequis pour Terraform

##  Outils nécessaires
Avant de commencer à utiliser Terraform pour déployer Microsoft Entra ID, assurez-vous d'avoir les outils suivants installés sur votre machine :

1. **Terraform** (dernière version stable)
   - Télécharger et installer : [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
   - Vérifier l'installation :
     ```sh
     terraform -v
     ```

2. **Azure CLI** (pour l'authentification et la gestion des ressources Azure)
   - Télécharger et installer : [Azure CLI](https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli)
   - Vérifier l'installation :
     ```sh
     az version
     ```

3. **Compte Azure avec droits suffisants**
   - Vous devez disposer d’un abonnement Azure valide et des permissions pour créer un tenant Entra ID.

##  Authentification à Azure
Avant d'exécuter Terraform, connectez-vous à votre compte Azure :
```sh
az login
```
Si vous avez plusieurs abonnements, définissez celui à utiliser :
```sh
az account set --subscription "ID_DE_VOTRE_ABONNEMENT"
```

##  Configuration de Terraform
1. **Initialiser Terraform dans le projet**
   ```sh
   terraform init
   ```
2. **Vérifier la configuration**
   ```sh
   terraform validate
   ```
3. **Simuler les modifications à appliquer**
   ```sh
   terraform plan
   ```
4. **Appliquer la configuration**
   ```sh
   terraform apply -auto-approve
   ```

##  Étapes suivantes
Une fois le tenant Entra ID déployé, vous pourrez consulter les valeurs retournées par Terraform dans `outputs.tf` et procéder à d'autres configurations selon vos besoins.

 **Besoin d’aide ?** Consultez la documentation officielle [Terraform & Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/)

