# 🔬 Lab 1 : Créer et configurer votre premier tenant Entra ID

## 📝 Objectif
Ce tutoriel vous guide à travers la création et la configuration de votre premier **tenant Microsoft Entra ID** (anciennement Azure AD).

---

##  Prérequis
✔ Un compte Microsoft avec accès à **Azure Portal**.    
✔ Permissions suffisantes pour créer un tenant Entra ID.

---

##  1. Création du tenant Entra ID

###  Accéder au portail Azure
1️⃣ Connectez-vous à [Azure Portal](https://portal.azure.com).  
2️⃣ Microsoft propose un **mois d'essai gratuit** pour Azure. Vous pouvez créer un compte d'essai si vous n'avez pas encore d'abonnement actif : [Créer un compte d'essai](https://azure.microsoft.com/fr-fr/free/).  
3️⃣ Recherchez **Microsoft Entra ID** dans la barre de recherche.

###  Créer un nouveau tenant
1️⃣ Cliquez sur **Gérer les tenants** puis sur **Créer un tenant**.  
2️⃣ Choisissez **Microsoft Entra ID** comme type de tenant.  
3️⃣ Remplissez les informations :  
   - **Nom du tenant** : my-entra-id-lab  
   - **Nom de domaine initial** : myentra.onmicrosoft.com  
   - **Région** : Choisissez la région la plus proche de votre entreprise.  
4️⃣ Cliquez sur **Réviser + Créer** puis **Valider**.

###  Vérifier la création
- Une fois créé, accédez au tenant depuis **Microsoft Entra Admin Center**.

---

##  2. Configuration de base

###  Ajouter un utilisateur test
Vous pouvez créer des utilisateurs de plusieurs manières dans **Entra ID** :

#### 1️⃣ Via le Portail Azure
1. Accédez à **Utilisateurs** > **Nouvel utilisateur**.  
2. Remplissez les champs :  
   - **Nom** : Test User  
   - **Nom principal** : testuser@myentra.onmicrosoft.com  
   - **Rôle** : Utilisateur standard  
3. Cliquez sur **Créer**.

#### 2️⃣ Via un fichier d'import CSV
Vous pouvez également créer plusieurs utilisateurs en **important un fichier CSV** :
1. Accédez à **Utilisateurs** > **Importer des utilisateurs**.  
2. Téléchargez le modèle CSV proposé par Microsoft.  
3. Remplissez les informations des utilisateurs (Nom, UPN, Rôle, etc.).  
4. Importez le fichier et vérifiez la création des utilisateurs.

#### 3️⃣ Via PowerShell
Vous pouvez également créer un utilisateur en exécutant cette commande dans PowerShell :
```powershell
Install-Module AzureAD
Connect-AzureAD
New-AzureADUser -DisplayName "Test User" -UserPrincipalName "testuser@myentra.onmicrosoft.com" -AccountEnabled $true -PasswordProfile @{Password="P@ssword123"; ForceChangePasswordNextLogin=$true} -MailNickName "testuser"
```

---

###  Créer un groupe de sécurité
1️⃣ Allez dans **Groupes** > **Nouveau groupe**.  
2️⃣ Type : **Sécurité**  
3️⃣ Nom : "Admins Entra ID"  
4️⃣ Ajoutez l'utilisateur test au groupe.

###  Activer la sécurité par défaut (incluant MFA)
Microsoft applique désormais des paramètres de **sécurité par défaut** pour renforcer la protection des comptes. Pour vérifier et activer ces paramètres :
1️⃣ Accédez à **Microsoft Entra Admin Center** > **Propriétés du tenant**.  
2️⃣ Recherchez l'option **Paramètres de sécurité par défaut**.  
3️⃣ Vérifiez que l'option est **activée**. Cela inclura automatiquement MFA pour tous les utilisateurs.

---

##  3. Premiers tests

✔ Connectez-vous avec l'utilisateur test : [portal.azure.com](https://portal.azure.com).  
✔ Vérifiez que l'authentification MFA est bien demandée lors de la connexion.

---

##  Conclusion
Vous avez maintenant un tenant **Entra ID** fonctionnel avec un utilisateur, un groupe et les paramètres de **sécurité par défaut** activés, incluant MFA.  

🚀 **Prochaine étape : Configurer l'authentification Passwordless et Conditional Access.**
