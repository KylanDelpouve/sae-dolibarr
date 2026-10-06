#!/bin/bash
set -e
# Variables de connexion pour faciliter les modifications futures
CONTENEUR_BDD="mariadb"
UTILISATEUR="doliuser"
MDP="dolipassword"
BASE="dolibarr"

echo "Lancement de la sauvegarde..."
# Export complet de la base avec mariadb-dump
# -T : Désactive l'allocation d'un terminal. C'est obligatoire pour un script qui tourne tout seul ou quand on redirige la sortie avec ">".
# -u : Spécifie le nom de l'utilisateur de la base de données.
# -p : Spécifie le mot de passe.
docker compose exec -T $CONTENEUR_BDD mariadb-dump --single-transaction -u "$UTILISATEUR" -p"$MDP" "$BASE" > data/sauvegarde.sql.tmp
 
# Le dump a réussi (sinon set -e aurait arrêté le script) : on remplace l'ancienne sauvegarde.
mv data/sauvegarde.sql.tmp data/sauvegarde.sql
echo "Sauvegarde terminée !"