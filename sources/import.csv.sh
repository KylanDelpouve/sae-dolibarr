#!/bin/bash

FICHIER_CSV="data/clients.csv"
UTILISATEUR="doliuser"
MDP="dolipassword"
BASE="dolibarr"

# sed '1d' supprime la première ligne du fichier (en-têtes)
# s/\r$// nettoie les caractères de fin de ligne Windows pour éviter les bugs SQL
sed '1d; s/\r$//' "$FICHIER_CSV" | while IFS=';' read -r nom adresse cp ville tel email || [ -n "$nom" ]; do
    # On vérifie que la ligne lue n'est pas vide avant de lancer le traitement
    if [ -n "$nom" ]; then
        # Préparation de la requête SQL d'insertion
        REQUETE="INSERT INTO llx_societe (nom, address, zip, town, phone, email, client) VALUES ('$nom', '$adresse', '$cp', '$ville', '$tel', '$email', 1);"
        echo "$REQUETE"
        # Exécution de la requête directement dans MariaDB
        # Le < /dev/null empêche Docker de récupérer la suite du fichier CSV
        docker compose exec -T mariadb mariadb -u "$UTILISATEUR" -p"$MDP" "$BASE" -e "$REQUETE" < /dev/null
    fi
done