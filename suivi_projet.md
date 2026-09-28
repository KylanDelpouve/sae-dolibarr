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

3. Astuces techniques
- Mettre l'option -T sur les commandes docker compose exec dans les scripts pour éviter que ça plante sous Windows.
- Ajouter < /dev/null à la fin d'une commande Docker dans une boucle while pour l'empêcher de consommer les données du fichier texte en cours de lecture.
- Séparer l'allumage des conteneurs (docker compose up -d mariadb puis dolibarr) permet de charger des données SQL sans que l'application ne vienne gêner.

4. Limites connues
- Comme on a inséré les clients en SQL brut sans remplir tous les champs cachés de Dolibarr, l'interface web refuse de supprimer ces clients manuellement (il faut faire un DELETE en SQL).
- L'exécution des scripts Bash nécessite Git Bash sous Windows.

5. A faire pour la prochaine séance :
- Tests complets
- Finir la rédaction des derniers fichiers

## Séance n° 3 date - heure : 28/09/2026 - 08:30 à 11:30

- Tests complets sur le fonctionnement de toutes les fonctionnalités demandées (script automatisation de l'installation et situation de crash)
- Rédaction du fichier sources.md listant les sources utilisées
- Rédaction du fichier README.md