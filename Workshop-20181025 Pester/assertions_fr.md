Liste des Assertions sous Pester 4.4.X
======================================


Chaque assertion doit être vrais, sinon Pester leve une exception. 

Une assertion est une comparaison entre le résultat que l'on souhaite (la valeur baseline) et le résultat d'une execution de code (la valeur d'exécution)

Les mots clés sont les suivants

| ASSERTIONS   |      Description      | 
|----------|:-------------| 
| Be |  Compare les deux objets à la recherche d'une égalilé |
| BeExactly | Compare les deux objets à la recherche d'une égalilé, sensible à la case  |
| BeGreaterThan | L'objet d'exécution doit être plus grand la baseline |
| BeGreaterOrEqual | L'objet d'exécution doit être plus grand ou égale la baseline |
| BeIn | L'objet d'éxécution doit être présent dans le tableau |
| BeLessThan | L'objet d'exécution doit être plus petit la baseline |
| BeLessOrEqual | L'objet d'exécution doit être plus petit ou égale la baseline |
| BeLike | l'objet d'exécutuion doit être similaire au parterne, comme le comparateur like |
| BeLikeExactly | l'objet d'exécutuion doit être similaire au parterne, sensible à la case  |
| BeOfType | compare les types d'objets, les deux objets doivent être du même type  |
| BeTrue | Vérifie que l'objet d'exécution est un booléen égale à true |
| BeFalse | Vérifie que l'objet d'exécution est un booléen égale à false |
| HaveCount | Vérifie que l'objet est une collection ou un tableau et que le nombre d'élement est égale à la baseline  |
| Contain | Vérifie que l'objet est une collection ou un tableau et qu'un élément soit égale à la baseline, comme l'opérateur -contain |
| Exist | Vérifie que l'objet d'exécution existe dans un psprovider (file, registry, ...)  |
| FileContentMatch | Effectue une recherche regex sur un fichier ou une chaîne |
| FileContentMatchExactly | Effectue une recherche regex en mode sensible à la case sur une fichier ou une chaîne|
| FileContentMatchMultiline | Effectue une recherche regex en mode sensible à la case sur plusieurs lignes |
| Match | Effectue une comparaison regex entre les deux objets |
| MatchExactly | Effectue une comparaison regex en mode sensible à la case entre les deux objets |
| Throw | Vérifie que l'exécution génére une excpetion  |
| BeNullOrEmpty | Vérifie que l'objet d'exécution soit null ou un chaîne (string) vide |