#!/bin/bash


export PROJECT_ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd $PROJECT_ROOT_PATH


COMMAND="$1"


if [ "$COMMAND" == "create" ]; then
    echo "Creating user and database locally."

    createuser --connection-limit=1 cognitivo;
    createdb --owner=cognitivo cognitivo;

    read -s -p "Type new password: " PASSWORD
    echo
    psql -c "ALTER USER cognitivo PASSWORD '$PASSWORD';"

elif [ "$COMMAND" == "drop" ]; then
    echo "Dropping user and database locally."

    dropdb cognitivo
    dropuser cognitivo

elif [[ "up down clean"[*] =~ $COMMAND ]]; then
    echo "Running command '$COMMAND'."

    read -s -p "Type password for user 'cognitivo': " PASSWORD
    echo
    echo "Loading file 'sql/$COMMAND.sql'"
    PGPASSWORD=$PASSWORD psql -h localhost -p 5432 -U cognitivo -d cognitivo -f sql/$COMMAND.sql

elif [ "$COMMAND" == "populate" ]; then
    echo "Populating database."

    read -s -p "Type password for user 'cognitivo': " PASSWORD
    echo

    function augment {
        filename="$1"
        table="$2"
        fields="$3"

        python3 scripts/preproc.py ${filename} "$fields"

        PGPASSWORD=$PASSWORD psql -h localhost -p 5432 -U cognitivo -d cognitivo \
            -c "\copy ${table} FROM 'files/${filename}_aug.csv' DELIMITER ',' NULL 'NA' CSV"

        rm files/${filename}_aug.csv
    }

    augment comp_boss components "groove unique_feature orientation"
    augment bill_of_materials materials ""
    augment price_quote quotations "bracket_pricing"

elif [ "$COMMAND" == "access" ]; then
    echo "Accessing database."

    read -s -p "Type password for user 'cognitivo': " PASSWORD
    echo
    echo "Accessing database 'cognitivo'."
    PGPASSWORD=$PASSWORD psql -h localhost -p 5432 -U cognitivo -d cognitivo

fi
