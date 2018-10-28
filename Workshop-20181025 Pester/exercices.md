WORKSHOP PESTER
===============

Pour découvrir Pester, nous vous proposons une série d’exercices. Ces exercices et ces exemples nécessitent la version 4.4.x de Pester. 

Pour mettre à jour votre version de Pester 

*Sous Windows PowerShell (5.1)*
```PowerShell
Install-Module -Name Pester -Force -SkipPublisherCheck
```

*Avec PowerShell core (6.x)*
```PowerShell
Install-Module -Name Pester 
```

Les exercices se trouvent dans le répertoire workshop de ce repos. 
Vous devez donc cloner se repos en local. 

Tester une fonction
-------------------

Dans le dossier ex01, vous avez un fichier avec une fonction, Add-OneNumber. Cette fonction ajouter 1 à tous les nombre passer par le paramètre -Numnber

créer un fichier en .Test.ps1 contenant au moins deux Contextes et les tests suivants:
* Vérifier que l'on obtient 2 avec le paramètre Numnber 1 
* Vérifier que l'on n'obtient pas 5 avec le paramêtre Number 6 
* Vérifier que l'on obtient un résultat plus grand que 4 avec le paramètre Number 5
* Vérifier que l'on peut passer un nombre sans utiliser de paramètre nommé et en passant par un | 


Utiliser Invoke-Pester
----------------------

Avec votre fichier de test. Tenter d'utiliser invoke-pester.
* Tenter d'utiliser -EnableExist et récuperer le code d'érreur avec $LastErrorCode est il égale au nombre de fail ? 
* Tenter d'utiliser -CodeCoverage

Test Drive
----------

Dans le dossier ex03 vous avec une fonction get-testfiles. Cette function prend comme argument un chemin $Path et un Filtre (par défaut *.tmp). 
Vous devez tester la fonction sans pour autant avoir à utiliser un vrais dossier sur votre machine de test. 
Vous pouvez utiliser TestDrive pour créer un dossier et plusieurs fichiers 

* Tester le nombre de fichier renvoyer en utilisant TestDrive
* Tester le comportement en utilisant un chemin de fichier au lieu d'un dossier 
* Tester un autre filtre que *.tmp
* Verifier que le type d'objet renvoyé est bien un DirectoryInfo

Mocking
-------

Dans le dossier ex04, vous avez une fonction invoke-FakeRestApi qui n'est pas disponible. Elle utilise le cmdlet invoke-restapi. 

Vous devez tester plusieurs scénarios : 

* tester que l'object rentourné est bien un PSCustomObject
* tester que la location est bien égale à WestEurope
* tester qu'invoke-restapi est appelé qu'une seule fois
* tester le comportement si l'on change les paramètres MedataService pour ScheduledEvents, HttpMethod pour Post et Body 1 vous n'avez pas d'erreur. 

tip: invoke-restapi retourn un PsCustomObject

Test de module
--------------
Dans le dossier ex05, vous avez un module MyModule. Ce module dispose de deux fonctions, test-Planet qui renvois le nom et la population d'une planette à partir de son nom et get-planets qui renvois un tableau de hash. 

* Tester que test-planets -Name Mars renvois bien 0 pour la population
* Tester que test-planets -Name Earth retourne une population plus grande que 0 
* Tester que get-planets retourne bien un tableau
* Tenter d'ajouter un paramètre position (avec n'importe quoi) dans le tableau de hash de get-planets et refaite les tests. 


Tests de validation
-------------------

Vous devez tester qu'un site web qui vient d'être déployé fonctionne correctement 
L'URI du site est http://parispester2018.azurewebsites.net/

* Tester que le code HTTP de retour est bien 200
* Tester que l'entête Server est bien similaire à Microsoft-IIS 
* Tester que vous avez Azure dans le contenue du site 
* Tester que le RawContentLength est bien supérieur à 256


CI avec Pester et Appveyor
--------------------------

Pour ce test vous avez besoin d'un compte Github et avec ce compte vous avez besoin de créer un compte sur Appveyor

* Créer un repos avec un nom que vous souhaitez
* Copier les deux fichiers appveyor.yml et get-planet.ps1 
* créer un fichier de test : 
    * Tester que get-planets -Name Mars renvois bien 0 pour la population
    * Tester que get-planets -Name Earth retourne une population plus grande que 0 
* faite un commit et un push pour publier les données
* lié votre répos à Appveyor 
* faite une modification dans le code, comme l'ajout de la position dans le tableau de Hash 
* faite un commit puis un Push et regarder ce qui ce passe sur le site d'Appveyor





