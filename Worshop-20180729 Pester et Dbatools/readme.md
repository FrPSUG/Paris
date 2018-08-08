Paris PowerShell user group
===========================

Workshop #1 : Pester et DbaTools. Cory Corner 29 Juillet 2018
-------------------------------------------------------------

Le but du workshop était de découvrir le fonctionnement de Dbatools et son utilisation avec Pester

Pour cela un entreprise fictive a été montée, La Jupiter Mining Unlimited, qui se propose d'exploiter les richesses minières de Jupiter et de ses lunes. 
Jupiter Mining dispose de 2 Serveurs Sql (Windows 2016 Core et Sql Server 2016) et de plusieurs base.

Les équipes de Jupiter Mining on besoin d'un outil leur permetant de vérifier les paramètres des serveurs Sql et la santé de leur bases.

parmis les points à tester: 
* Verifier qu'un Backup a été fait sur l'ensemble des bases
* Controler qu'un fichier .bak est valide 
* Contrôler les ressources CPU Utilisées
* Verifier que les bases de données ont bien la même collation que le serveur
* Créer un report


une des solutions possible à l'ensemble de ces question se trouve dans le fichier SQL.test.ps1

Pour generer un rapport HTML il faut utiliser l'outil reportunit (http://reportunit.relevantcodes.com/) 

on génére un fichier XML 
Invoke-Pester -Script .\pester.ps1 -OutputFile ".\report\data.xml" -OutputFormat NUnitXml

que l'on transforme avec reportunit 

reportunit.exe report