# SAE 51 - Installation d'un ERP/CRM (Dolibarr)

Équipe : Kylan DELPOUVE et Tanjona RANDRIANARISOLO

## Arborescence du projet
- data/ : Contient le fichier de données (clients.csv) et la sauvegarde SQL du système (sauvegarde.sql)
- sources/ : Contient les scripts Bash d'automatisation (backup.sh, import.csv.sh et install.sh)
- docker-compose.yml : Fichier de configuration de l'infrastructure Docker
- suivi_projet.md : Journal de bord du projet
- sources.md : Liste des liens et de la documentation utilisés

## Prérequis
Utilisation de Docker pour la conteneurisation

## Utilisation et plan de reprise d'activité
L'installation est totalement automatisée via le script "install.sh". La commande suivante (à lancer à la racine du projet) permet de déployer l'infrastructure de zéro, restaurer la configuration de base de l'entreprise et importer les clients :

bash sources/install.sh