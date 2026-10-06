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

## Importation et exportation manuelle

En plus de l'automatisation avec les scripts, il est possible de gérer les données directement depuis l'interface web de Dolibarr (il faut d'abord activer le module "Import" et "Export" dans "Configuration" puis "Modules/Applications").

1. Faire une importation
Pour importer des données :
- Aller dans le menu Outils > Nouvel import.
- Choisir le jeu de données correspondant au besoin (par exemple : les Tiers pour les clients, ou les Utilisateurs pour les employés).
- Uploader le fichier source au format .csv
- Liaison des champs : Si ce n'est pas déjà fait, il faut associer manuellement chaque colonne du fichier (Nom, Adresse, Code postal, ...) au champ correspondant dans la base de données de Dolibarr.
- Lancer la simulation (cela permet au système de vérifier qu'il n'y a pas d'erreurs de format avant de valider l'importation définitive) puis si il n'y a aucune erreur, valider l'importation.

2. Faire une exportation
Pour extraire des données du système :
- Aller dans Outils > Nouvel export.
- Sélectionner le jeu de données à récupérer (ex: liste des Tiers).
- Choisir les champs spécifiques à inclure (on peut par exemple seulement sélectionner le nom et l'adresse mail des clients).
- Une fois généré, Dolibarr crée et fait télécharger un fichier .csv contenant toutes les données formatées et prêtes à être utilisées sur un tableur par exemple.