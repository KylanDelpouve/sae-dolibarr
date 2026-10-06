# Journal de bord

TITRE PROJET : SAÉ 51 - Installation d’un ERP/CRM  
NOM CHEF DE PROJET : Kylan DELPOUVE  
NOMS AUTRE MEMBRES EQUIPE : Tanjona RANDRIANARISOLO  
DATE DEBUT : 22/09/2026

Ce document décrit la mise en place d'une infrastructure Docker pour l'ERP Dolibarr avec une base de données MariaDB. Il présente également l'automatisation de l'importation de données via des fichiers CSV, ainsi que la configuration d'un script de Plan de Reprise d'Activité (PRA) pour restaurer l'environnement en cas de crash.

# 1. Utilisation

Le projet utilise 3 scripts Bash principaux rangés dans le dossier sources :
- import.csv.sh : Lit le fichier clients.csv et injecte les données directement dans la table llx_societe de MariaDB.
- backup.sh : Exécute un mariadb-dump pour sauvegarder toute la base de données dans le dossier data.
- install.sh : Script de PRA qui monte l'infrastructure, restaure la base de données SQL, allume Dolibarr et lance l'importation CSV.

Dolibarr est accessible depuis le navigateur sur http://localhost:8080 une fois les conteneurs lancés.

# 2. Journal de bord

## Séance n° 1 date - heure : 22/09/2026 - 08:30 à 10:00

Travail effectué :
- Analyse du sujet et des consignes.
- Création du dépôt Git local et connexion en SSH au dépôt distant GitHub sae-dolibarr.
- Création du fichier docker-compose.yml et lancement des conteneurs MariaDB et Dolibarr.
- Connexion à l'interface web (localhost) pour faire la configuration initiale manuelle : création de l'entreprise, activation du module Tiers et ajout d'un compte utilisateur standard non-admin.
- Préparation de l'arborescence avec les dossiers data et sources, et création du fichier de test clients.csv avec des points-virgules.

Difficultés rencontrées :
- PowerShell se fige lors de l'utilisation de docker compose exec avec le terminal interactif de MariaDB.

A faire à la prochaine séance :
- Faire le script Bash pour lire le CSV et l'envoyer dans la BDD.
- Gérer la sauvegarde et le script d'installation PRA.

## Séance n° 2 date - heure : 23/09/2026 - 08:30 à 10:00

Travail effectué :
- Écriture du script import.csv.sh. Utilisation d'une boucle while pour lire les variables et d'une requête INSERT INTO.
- Écriture de backup.sh pour exporter la BDD en SQL.
- Écriture de install.sh. On a testé de tout casser avec docker compose down -v puis on a lancé le script pour vérifier que l'infrastructure, la sauvegarde et l'importation se relançaient toutes seules avec succès.

Difficultés rencontrées :
- Le script d'importation ne lisait pas la dernière ligne du fichier CSV à cause du format Windows (CRLF). On a dû utiliser sed pour nettoyer les retours à la ligne (\r).
- La commande Docker "aspirait" les lignes du CSV dans la boucle Bash, empêchant l'importation du deuxième client.
- Lors du test du PRA, MariaDB et Dolibarr démarraient en même temps, ce qui créait un conflit de tables dans la BDD. On a dû modifier le script pour démarrer la BDD en premier, faire la restauration, puis allumer l'application.

A faire à la prochaine séance :
- Tests complets
- Finir la rédaction des derniers fichiers

## Séance n° 3 date - heure : 28/09/2026 - 08:30 à 11:30

Travail effectué :
- Rédaction du fichier sources.md listant les sources utilisées.
- Rédaction du fichier README.md.
- Ajout de commentaires dans les scripts.
- Ajout du fichier .gitignore (exclusion du fichier .env contenant les mots de passe et des fichiers temporaires *.tmp, avec un modèle .env.example).
- Ajout du fichier .gitattributes (fins de ligne LF forcées pour les .sh, .yml, .csv et .env.example, afin d'éviter les scripts cassés par les \r entre Windows et Linux).

Difficultés rencontrées :
- Aucune difficulté majeure sur cette séance.

A faire à la prochaine séance :
- Rédiger la documentation (README.md, sources.md) et commenter les scripts.
- Sécuriser le dépôt (mots de passe, fins de ligne).

## Séance n° 4 date - heure : 28/09/2026 - 14:30 à 17:30


Travail effectué :
- Tests complets sur le fonctionnement de toutes les fonctionnalités demandées (script d'automatisation de l'installation et situation de crash).
- Test de l'import natif de Dolibarr : import d'un fichier CSV via le menu Outils de l'interface web (accessible sur localhost:8080), pour vérifier que la base de données fonctionne et comprendre le fonctionnement de l'import côté Dolibarr, en complément de notre script import.csv.sh.
- Choix d'une version stable de MariaDB (11.8) dans docker-compose.yml plutôt que la dernière version publiée ("latest"), afin de garantir un déploiement reproductible.


Difficultés rencontrées :
- Lors de l'import natif, le module d'import disparaît du menu après chaque import.
- Toujours à l'import natif, la correspondance des colonnes avec le format attendu par Dolibarr pose problème : certaines colonnes n'ont pas de nom au moment de l'import, ou refusent d'être importées.
A faire à la prochaine séance :
- Tester le dépôt cloné sur un second poste (poste de Tanjona) pour valider la reproductibilité.

## Séance n° 5 date - heure : 05/10/2026 - 13:00 à 16:00

Travail effectué :
- Clonage du dépôt sur le GitHub pour tester l'installation depuis zéro sur une seconde machine.
- Installation et activation de WSL pour que Docker fonctionne sur ce poste.
- Amélioration de install.sh : ajout d'une boucle d'attente (until ... SELECT 1) qui vérifie que MariaDB répond réellement aux requêtes avant de lancer la restauration du fichier sauvegarde.sql. Le script ne passe plus à l'étape suivante tant que la base n'est pas prête.
- Nouveau test complet de la chaîne installation, restauration, démarrage de Dolibarr, puis import CSV.

Difficultés rencontrées :
- Après le clonage, Docker ne fonctionnait pas correctement sur le poste de Tanjona : WSL (sous-système Linux pour Windows) n'était pas installé/activé, or Docker Desktop en a besoin pour faire tourner les conteneurs.
- Au lancement de install.sh, la création des conteneurs prenait beaucoup de temps sur ce poste. Le script enchaînait pourtant déjà les étapes suivantes alors que MariaDB n'était pas prête, ce qui provoquait des erreurs en cascade (restauration lancée trop tôt, connexion refusée). Résolu par la boucle d'attente décrite ci-dessus.

A faire à la prochaine séance :
- [À compléter : finalisation du README, relecture, rendu final...]

## Séance n° 6 date - heure : 06/10/2026 - 13h à 15h30

Travail effectué :

- Revue des scripts par rapport au cahier des charges du sujet (installation automatisée, import automatisé, dockerisation, sauvegarde et PRA).
- Correction de import_csv.sh :
ajout de set -e et set -o pipefail : si une insertion échoue ou si le CSV est introuvable, le script s'arrête et install.sh n'affiche plus "Succès !" à tort ;
protection des apostrophes et des antislashs dans les valeurs avant de construire la requête SQL (un client comme "L'Atelier" cassait l'insertion) ;
ajout d'une condition WHERE NOT EXISTS (même nom et même email) pour éviter les doublons quand install.sh restaure une sauvegarde déjà remplie puis relance l'import.
- Correction de backup.sh :
le dump est écrit dans un fichier temporaire data/sauvegarde.sql.tmp puis renommé en sauvegarde.sql seulement s'il a réussi, pour ne pas écraser l'ancienne sauvegarde en cas d'échec ;
ajout de set -e et de l'option --single-transaction pour un export cohérent pendant que Dolibarr tourne.
- Correction du nom du script d'import dans la documentation (import_csv.sh).
- Tests : lancement de install.sh, connexion à Dolibarr et vérification des Tiers, exécution de backup.sh (fichier sauvegarde.sql de 827 Ko, non vide), puis test du PRA avec docker compose down -v suivi de install.sh : l'infrastructure et les données sont bien restaurées.

# 3. Astuces techniques

- Mettre l'option -T sur les commandes docker compose exec dans les scripts pour éviter que ça plante sous Windows.
- Ajouter < /dev/null à la fin d'une commande Docker dans une boucle while pour l'empêcher de consommer les données du fichier texte en cours de lecture.
- Séparer l'allumage des conteneurs (docker compose up -d mariadb puis dolibarr) permet de charger des données SQL sans que l'application ne vienne gêner.
- Ne pas se fier au simple "docker compose up -d" : le conteneur est créé avant que le service soit prêt. Attendre la disponibilité de MariaDB avec une boucle until (SELECT 1) avant de restaurer la base.
- Fixer la version de MariaDB (11.8) plutôt que d'utiliser latest, pour éviter les surprises entre deux machines ou deux dates d'installation.
- Forcer les fins de ligne LF via .gitattributes pour que les scripts .sh restent exécutables sous Linux et dans les conteneurs, même quand le dépôt est cloné sous Windows.
- Sous Windows, Docker Desktop nécessite WSL 2 : à installer et activer avant de lancer les scripts.
- Lancer les scripts depuis la racine du dépôt (les chemins data/ et sources/ sont relatifs).

# 4. Limites connues

- Comme on a inséré les clients en SQL brut sans remplir tous les champs cachés de Dolibarr, l'interface web refuse de supprimer ces clients manuellement (il faut faire un DELETE en SQL).
- L'exécution des scripts Bash nécessite Git Bash (ou WSL) sous Windows.
- L'import natif de Dolibarr (menu Outils) n'est pas automatisable et pose des problèmes de correspondance de colonnes ; c'est pourquoi l'import est fait par script directement en base.
- Le premier lancement de install.sh peut être long selon la machine (téléchargement des images Docker et création des conteneurs).