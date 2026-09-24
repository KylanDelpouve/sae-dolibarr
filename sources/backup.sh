#!/bin/bash

CONTENEUR_BDD="mariadb"
UTILISATEUR="doliuser"
MDP="dolipassword"
BASE="dolibarr"

echo "Lancement de la sauvegarde..."
docker compose exec -T $CONTENEUR_BDD mariadb-dump -u "$UTILISATEUR" -p"$MDP" "$BASE" > data/sauvegarde.sql
echo "Sauvegarde terminée !"