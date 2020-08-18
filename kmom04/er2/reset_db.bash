#!/usr/bin/env bash
# shellcheck disable=SC2181
# DV1606, Databasteknologier för webben VT20
# Daniel Andersson, DAAP19
# Module: reset_db.bash
# Module content: Reset database Eshop with setup & ddl.



#
# Load a SQL file into Eshop
#
function loadSqlIntoDB
{
    echo ">>> $4 ($3)"
    mysql "-u$1" "-p$2" eshop < "$3" > /dev/null
    if [ $? -ne 0 ]; then
        echo "The command failed, you may have issues with your SQL code."
        echo "Verify that all SQL commands can be exeucted in sequence in the file:"
        echo " '$3'"
        exit 1
    fi
}

#
# Recreate and reset the database.
#
echo ">>> Reset database Eshop."
loadSqlIntoDB "root" "" "setup.sql" "Init database and users."
loadSqlIntoDB "user" "pass" "ddl.sql" "Create tables & views."

echo ">>> Describe table produkter."
mysql -uuser -ppass eshop -e "describe produkter;"
echo ">>> Describe table produktbilder."
mysql -uuser -ppass eshop -e "describe produktbilder;"
echo ">>> Describe table produktkategorier."
mysql -uuser -ppass eshop -e "describe produktkategorier;"
echo ">>> Describe table lager."
mysql -uuser -ppass eshop -e "describe lager;"
echo ">>> Describe table kunder."
mysql -uuser -ppass eshop -e "describe kunder;"
echo ">>> Describe table order_fran_kund."
mysql -uuser -ppass eshop -e "describe order_fran_kund;"
echo ">>> Describe table orderlista."
mysql -uuser -ppass eshop -e "describe orderlista;"
echo ">>> Describe table fakturor."
mysql -uuser -ppass eshop -e "describe fakturor;"
echo ">>> Describe table plocklista."
mysql -uuser -ppass eshop -e "describe produkter_till_plocklista;"
echo ">>> Describe table produkter_till_plocklista."
mysql -uuser -ppass eshop -e "describe plocklista;"
echo ">>> Show tables in database eshop."
mysql -uuser -ppass eshop -e "SHOW TABLES;"
