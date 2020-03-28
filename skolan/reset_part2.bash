#!/usr/bin/env bash
# shellcheck disable=SC2181

#
# Load a SQL file into skolan
#
function loadSqlIntoSkolan
{
    echo ">>> $4 ($3)"
    mysql "-u$1" "-p$2" skolan < "$3" > /dev/null
    if [ $? -ne 0 ]; then
        echo "The command failed, you may have issues with your SQL code."
        echo "Verify that all SQL commands can be exeucted in sequence in the file:"
        echo " '$3'"
        exit 1
    fi
}

#
# Recreate and reset the database to be as after part II.
#
echo ">>> Reset skolan to after part 2"
loadSqlIntoSkolan "root" "" "setup.sql" "Initiera database och användare"
loadSqlIntoSkolan "user" "pass" "ddl.sql" "Create tables"
loadSqlIntoSkolan "user" "pass" "dml_insert.sql" "Insert into larare"
loadSqlIntoSkolan "user" "pass" "ddl_migrate.sql" "Alter table larare"
loadSqlIntoSkolan "user" "pass" "dml_update.sql" "Grundlön larare"
loadSqlIntoSkolan "user" "pass" "ddl_copy.sql" "Kopiera till larare_pre"
loadSqlIntoSkolan "user" "pass" "dml_update_lonerevision.sql" "Utför lönerevision"
loadSqlIntoSkolan "user" "pass" "dml_view.sql" "Skapa vyer för larare"
loadSqlIntoSkolan "user" "pass" "dml_join.sql" "Skapa vy för lönerevisionen"

echo ">>> Check larare_pre: Lönesumman = 305000, Kompetens = 8."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"

echo ">>> Check larare: Lönesumman = 330242, Kompetens = 19."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
