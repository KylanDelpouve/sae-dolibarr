#!/bin/bash

# -e : Coupe immédiatement le script si n'importe quelle commande renvoie une erreur. Ça évite de continuer si un truc plante.
set -e

echo "Démarrage de MariaDB uniquement..."
# -d (detached) : Lance le conteneur en arrière-plan. Ça permet au script de continuer à s'exécuter sans rester bloqué sur les logs de MariaDB.
docker compose up -d mariadb

echo "Attente de MariaDB..."
# Explication des options de la commande de vérification :
# -T : Pas de terminal interactif.
# -h : Précise l'hôte (adresse IP) sur lequel on veut se connecter à la base (ici 127.0.0.1, le réseau local interne du conteneur).
# -u et -p : On utilise le compte root pour avoir les droits de faire le test.
# -e : On exécute la simple requête "SELECT 1" pour voir si la base est capable de répondre.
until docker compose exec -T mariadb mariadb -h127.0.0.1 -uroot -proot -e "SELECT 1" >/dev/null 2>&1; do
  sleep 2
done
echo "MariaDB est prête."

echo "Restauration de la sauvegarde SQL..."
# On utilise toujours -T pour éviter l'interactif, ainsi que -u et -p pour l'authentification.
docker compose exec -T mariadb mariadb -u doliuser -pdolipassword dolibarr < data/sauvegarde.sql

echo "Démarrage de l'application Dolibarr..."
# Option -d pour lancer le serveur web en tâche de fond.
docker compose up -d dolibarr

echo "Importation des nouvelles données CSV..."
bash sources/import.csv.sh

echo "Succès !"