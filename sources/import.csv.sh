#!/bin/bash

FICHIER_CSV="data/clients.csv"
UTILISATEUR="doliuser"
MDP="dolipassword"
BASE="dolibarr"

sed '1d; s/\r$//' "$FICHIER_CSV" | while IFS=';' read -r nom adresse cp ville tel email || [ -n "$nom" ]; do
    if [ -n "$nom" ]; then
        REQUETE="INSERT INTO llx_societe (nom, address, zip, town, phone, email, client) VALUES ('$nom', '$adresse', '$cp', '$ville', '$tel', '$email', 1);"
        echo "$REQUETE"
        docker compose exec -T mariadb mariadb -u "$UTILISATEUR" -p"$MDP" "$BASE" -e "$REQUETE" < /dev/null
    fi
done