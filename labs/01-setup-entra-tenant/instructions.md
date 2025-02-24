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
![image](https://github.com/user-attachments/assets/e92859d6-a399-4c73-8d06-3a92a58d2cf4)

2️⃣ Microsoft propose un **mois d'essai gratuit** pour Azure. Vous pouvez créer un compte d'essai si vous n'avez pas encore d'abonnement actif : [Créer un compte d'essai](https://azure.microsoft.com/fr-fr/free/).  
![image](https://github.com/user-attachments/assets/11208313-fd6d-4c92-8a6a-37319e64e701)

3️⃣ Recherchez **Microsoft Entra ID** dans la barre de recherche.
![image](https://github.com/user-attachments/assets/2dc5121c-6a11-4ef2-be6c-400d2ad8c06a)

###  Vérifier la création
- Une fois créé, accédez au tenant depuis **Microsoft Entra Admin Center**.
![image](https://github.com/user-attachments/assets/12cbb866-ee67-4fd2-aed3-82ce7a1fde01)

---

##  2. Configuration de base

###  Ajouter un utilisateur test
Vous pouvez créer des utilisateurs de plusieurs manières dans **Entra ID** :

#### 1️⃣ Via le Portail Azure
1. Accédez à **Utilisateurs** > **Nouvel utilisateur**.
![image](https://github.com/user-attachments/assets/c394b9d5-c742-457d-83f3-73abe2f3c58e)

2. Remplissez les champs :
   **Basics**
   - **User principal name (UPN)** : Identifiant unique de l’utilisateur sous la forme `nom@domaine.onmicrosoft.com`.
   - **Domain** : Sélection du domaine associé à l’utilisateur.
   - **Mail nickname** : Surnom de messagerie généré automatiquement.
   - **Display name** : Nom affiché pour l’utilisateur.
   - **Password** : Mot de passe initial de l’utilisateur (généré automatiquement si coché).
   - **Account enabled** : Active ou désactive le compte utilisateur.
   **Properties** permet de définir des informations supplémentaires pour l'utilisateur :
   - **Job title** : Titre du poste.
   - **Department** : Département d'affectation.
   - **Office location** : Lieu de travail.
   - **Manager** : Responsable hiérarchique.
   - **Company name** : Nom de l'entreprise.
   - **Country/Region** : Pays ou région d’affectation.
   **Assignments** permet d'attribuer des rôles et des accès à l'utilisateur :
   - **Roles** : Attribution d’un rôle administratif (ex. Global Admin, User Admin).
   - **Licenses** : Attribution de licences Microsoft 365 ou Azure.
   - **Groups** : Ajout de l’utilisateur à un ou plusieurs groupes de sécurité.
  

   Assignements
4. Cliquez sur **Créer**.

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
