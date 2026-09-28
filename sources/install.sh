#!/bin/bash

echo "Démarrage de MariaDB uniquement..."
docker compose up -d mariadb

echo "Attente de l'initialisation de MariaDB (20 secondes)..."
# Pause de 20 secondes pour laisser le temps au moteur SQL de s'initialiser totalement
sleep 20

echo "Restauration de la sauvegarde SQL..."
# Injection silencieuse du fichier SQL pour reconstruire la structure de base
docker compose exec -T mariadb mariadb -u doliuser -pdolipassword dolibarr < data/sauvegarde.sql

echo "Démarrage de l'application Dolibarr..."
docker compose up -d dolibarr

echo "Importation des nouvelles données CSV..."
bash sources/import.csv.sh

echo "Succès !"