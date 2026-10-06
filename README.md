# SAE 51 - Installation d'un ERP/CRM (Dolibarr)

Équipe : Kylan DELPOUVE et Tanjona RANDRIANARISOLO

## Arborescence du projet
- data/ : Contient le fichier de données (clients.csv) et la sauvegarde SQL du système (sauvegarde.sql)
- sources/ : Contient les scripts Bash d'automatisation (backup.sh, import.csv.sh et install.sh)
- docker-compose.yml : Fichier de configuration de l'infrastructure Docker
- suivi_projet.md : Journal de bord du projet
- sources.md : Liste des liens et de la documentation utilisés
- gitignore : empêche d'envoyer certains types de fichiers sur Git
- gitattributes : pour le format Linux

## Prérequis
- Docker et Docker Compose : pour la conteneurisation de l'infrastructure.
- MariaDB : version 11.8 (spécifiée dans le docker-compose).
- Dolibarr : version 24.0.0 (dernière version stable officielle de l'image).
- Système d'exploitation : Compatible Windows (via Git Bash) ou Linux.

## Utilisation et plan de reprise d'activité
Le projet utilise 3 scripts Bash principaux rangés dans le dossier sources :
- import.csv.sh : Lit le fichier clients.csv et injecte les données directement dans la table llx_societe de MariaDB.
- backup.sh : Exécute un mariadb-dump pour sauvegarder toute la base de données dans le dossier data.
- install.sh : Script de PRA qui monte l'infrastructure, restaure la base de données SQL, allume Dolibarr et lance l'importation CSV.

Dolibarr est accessible depuis le navigateur sur http://localhost:8080 une fois les conteneurs lancés.