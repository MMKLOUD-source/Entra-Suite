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
     
   **Properties** permet de définir des informations supplémentaires pour l'utilisateur (optionnel):
   - **Job title** : Titre du poste.
   - **Department** : Département d'affectation.
   - **Office location** : Lieu de travail.
   - **Manager** : Responsable hiérarchique.
   - **Company name** : Nom de l'entreprise.
   - **Country/Region** : Pays ou région d’affectation.
     
   **Assignments** permet d'attribuer des rôles et des accès à l'utilisateur (optionnel):
   - **Roles** : Attribution d’un rôle administratif (ex. Global Admin, User Admin).
   - **Licenses** : Attribution de licences Microsoft 365 ou Azure.
   - **Groups** : Ajout de l’utilisateur à un ou plusieurs groupes de sécurité.
  
3. Cliquez sur **Créer**.
   
![image](https://github.com/user-attachments/assets/87c6a094-a1dc-4ef9-a9a8-90526760abfb)


#### 2️⃣ Via un fichier d'import CSV
Vous pouvez également créer plusieurs utilisateurs en **important un fichier CSV** :
1. Accédez à **Utilisateurs** > **Création en bloc**.
   
![image](https://github.com/user-attachments/assets/b3434b74-7f24-4d22-825e-0998a5992266)

2. Téléchargez le modèle CSV proposé par Microsoft.

![image](https://github.com/user-attachments/assets/2d2b234f-6655-4657-855e-049525ce4808)

3. Remplissez les informations des utilisateurs (Nom, UPN, Rôle, etc.).

![image](https://github.com/user-attachments/assets/67d55a4e-b83c-451b-a2de-054676715bc2)

4. Importez le fichier et vérifiez la création des utilisateurs.

#### 3️⃣ Via PowerShell
Vous pouvez également créer un utilisateur en exécutant cette commande dans PowerShell :
```powershell
Install-Module AzureAD
Connect-AzureAD
New-AzureADUser -DisplayName "Test User" -UserPrincipalName "testuser@myentra.onmicrosoft.com" -AccountEnabled $true -PasswordProfile @{Password="P@ssword123"; ForceChangePasswordNextLogin=$true} -MailNickName "testuser"
```

![image](https://github.com/user-attachments/assets/c55c0abc-3539-4b33-a061-e58b5d66d06a)

![image](https://github.com/user-attachments/assets/30bff4b0-9534-45fe-a02d-dd0115bf214c)

![image](https://github.com/user-attachments/assets/bb219718-2e49-4341-9af8-22797acbb750)

Vérifions si notre utilisateurs " User Test " a été créé sur le portail Azure:

![image](https://github.com/user-attachments/assets/b2de8d7a-7923-416c-9e89-c2f38a42a57e)




---

###  Créer un groupe de sécurité
1️⃣ Allez dans **Groupes** > **Nouveau groupe**. 

![image](https://github.com/user-attachments/assets/5d9c4ac5-7de9-400f-aa43-6fda58d8ab14)

2️⃣ Sélectionnez le **type de groupe** :
   - **Security** : Groupe de sécurité utilisé pour l'attribution de permissions et d'accès.
   - **Microsoft 365** : Groupe utilisé pour la collaboration et l'accès aux ressources Microsoft 365.

Pour notre exemple, nous choisirons **Security**
     
3️⃣ Renseignez le **nom du groupe** et une **description**.

4️⃣ Définissez le **type d’adhésion** du groupe :
   - **Assigned** : Ajout manuel des membres.
   - **Dynamic User** : Attribution automatique basée sur des règles dynamiques liées aux attributs des utilisateurs.
   - **Dynamic Device** : Attribution automatique basée sur des règles dynamiques liées aux attributs des appareils.
     
5️⃣ Cliquez sur **Créer** pour finaliser.

![image](https://github.com/user-attachments/assets/733f5185-a6ce-428a-864b-812aed0a5526)

####  Création d'un groupe via PowerShell
Vous pouvez également créer un groupe via PowerShell en utilisant la commande suivante :
```powershell
Install-Module AzureAD
Connect-AzureAD
New-AzureADGroup -DisplayName "Lab1 Entra ID" -MailEnabled $false -SecurityEnabled $true -MailNickName "adminsentra"
```




###  Activer la sécurité par défaut (incluant MFA)
Microsoft applique désormais des paramètres de **sécurité par défaut** pour renforcer la protection des comptes. Pour vérifier et activer ces paramètres :

1️⃣ Accédez à **Microsoft Entra Admin Center** > **Propriétés du tenant**.  

2️⃣ Recherchez l'option **Paramètres de sécurité par défaut**.  

3️⃣ Vérifiez que l'option est **activée**. Cela inclura automatiquement MFA pour tous les utilisateurs.

![image](https://github.com/user-attachments/assets/2469733f-52c1-4b79-b42b-4e208f2c01d8)

---

##  3. Premiers tests

✔ Connectez-vous avec l'utilisateur test : [portal.azure.com](https://portal.azure.com).  
✔ Vérifiez que l'authentification MFA est bien demandée lors de la connexion.

---

##  Conclusion
Vous avez maintenant un tenant **Entra ID** fonctionnel avec un utilisateur, un groupe et les paramètres de **sécurité par défaut** activés, incluant MFA.  

🚀 **Prochaine étape : Configurer l'authentification Passwordless et Conditional Access.**
