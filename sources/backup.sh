#!/bin/bash

# Variables de connexion pour faciliter les modifications futures
CONTENEUR_BDD="mariadb"
UTILISATEUR="doliuser"
MDP="dolipassword"
BASE="dolibarr"

echo "Lancement de la sauvegarde..."
# Export complet de la base avec mariadb-dump
docker compose exec -T $CONTENEUR_BDD mariadb-dump -u "$UTILISATEUR" -p"$MDP" "$BASE" > data/sauvegarde.sql
echo "Sauvegarde terminée !"