#!/bin/bash
set -e

echo "Démarrage de MariaDB uniquement..."
docker compose up -d mariadb

echo "Attente de MariaDB..."
until docker compose exec -T mariadb mariadb -h127.0.0.1 -uroot -proot -e "SELECT 1" >/dev/null 2>&1; do
  sleep 2
done
echo "MariaDB est prête."

echo "Restauration de la sauvegarde SQL..."
docker compose exec -T mariadb mariadb -u doliuser -pdolipassword dolibarr < data/sauvegarde.sql

echo "Démarrage de l'application Dolibarr..."
docker compose up -d dolibarr

echo "Importation des nouvelles données CSV..."
bash sources/import.csv.sh

echo "Succès !"