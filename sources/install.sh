#!/bin/bash

echo "Démarrage de MariaDB uniquement..."
docker compose up -d mariadb

echo "Attente de l'initialisation de MariaDB (20 secondes)..."
sleep 20

echo "Restauration de la sauvegarde SQL..."
docker compose exec -T mariadb mariadb -u doliuser -pdolipassword dolibarr < data/sauvegarde.sql

echo "Démarrage de l'application Dolibarr..."
docker compose up -d dolibarr

echo "Importation des nouvelles données CSV..."
bash sources/import.csv.sh

echo "Succès !"