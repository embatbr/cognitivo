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
    # read -s -p "Type password for user 'cognitivo': " PASSWORD
    # echo
    PASSWORD='password'
    echo "Loading file 'sql/$COMMAND.sql'"
    PGPASSWORD=$PASSWORD psql -h localhost -p 5432 -U cognitivo -d cognitivo -f sql/$COMMAND.sql

elif [ "$COMMAND" == "populate" ]; then
    # read -s -p "Type password for user 'cognitivo': " PASSWORD
    # echo
    PASSWORD='password'

    function augment {
        filename="$1"
        fields="$2"
        table="$3"

        python3 scripts/preproc.py ${filename} "$fields"

        PGPASSWORD=$PASSWORD psql -h localhost -p 5432 -U cognitivo -d cognitivo \
            -c "\copy ${table} FROM 'files/${filename}_aug.csv' DELIMITER ',' NULL 'NA' CSV"

        rm files/${filename}_aug.csv
    }

    augment comp_boss "groove unique_feature orientation" components

elif [ "$COMMAND" == "access" ]; then
    # read -s -p "Type password for user 'cognitivo': " PASSWORD
    # echo
    PASSWORD='password'
    echo "Accessing database 'cognitivo'."
    PGPASSWORD=$PASSWORD psql -h localhost -p 5432 -U cognitivo -d cognitivo

fi
