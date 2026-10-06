#!/bin/bash
set -e
set -o pipefail

FICHIER_CSV="data/clients.csv"
UTILISATEUR="doliuser"
MDP="dolipassword"
BASE="dolibarr"

# Protège une valeur avant de la mettre entre apostrophes dans une requête SQL :
# - \  devient \\  (l'antislash est un caractère d'échappement en SQL)
# - '  devient ''  (sinon un nom comme L'Atelier casserait la requête)
echapper() {
    printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e "s/'/''/g"
}
 
# sed '1d' supprime la première ligne du fichier (en-têtes)
# s/\r$// nettoie les caractères de fin de ligne Windows pour éviter les bugs SQL
# -r (pour la commande read) : Empêche que d'éventuels antislashs dans le CSV soient pris pour des caractères d'échappement.
sed '1d; s/\r$//' "$FICHIER_CSV" | while IFS=';' read -r nom adresse cp ville tel email || [ -n "$nom" ]; do
    # On vérifie que la ligne lue n'est pas vide avant de lancer le traitement
    if [ -n "$nom" ]; then
        # Échappement des valeurs avant de les insérer dans la requête
        nom=$(echapper "$nom")
        adresse=$(echapper "$adresse")
        cp=$(echapper "$cp")
        ville=$(echapper "$ville")
        tel=$(echapper "$tel")
        email=$(echapper "$email")
 
        # Préparation de la requête SQL d'insertion
        # WHERE NOT EXISTS : n'insère le client que s'il n'existe pas déjà (même nom et même email).
        # Ça évite les doublons quand install.sh restaure une sauvegarde contenant déjà ces clients puis relance l'import.
        REQUETE="INSERT INTO llx_societe (nom, address, zip, town, phone, email, client)
SELECT '$nom', '$adresse', '$cp', '$ville', '$tel', '$email', 1 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM llx_societe WHERE nom = '$nom' AND email = '$email');"
        echo "$REQUETE"
        # Exécution de la requête directement dans MariaDB
        # Le < /dev/null empêche Docker de récupérer la suite du fichier CSV
        # -T : Évite que Docker n'ouvre un accès interactif qui ferait planter la boucle while.
        # -u et -p : Transmettent les accès SQL.
        # -e : Demande à MariaDB d'exécuter la commande SQL entre guillemets juste après, puis de quitter.
        docker compose exec -T mariadb mariadb -u "$UTILISATEUR" -p"$MDP" "$BASE" -e "$REQUETE" < /dev/null
    fi
done