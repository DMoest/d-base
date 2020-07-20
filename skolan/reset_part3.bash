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
echo ">>> Reset skolan to beginning of part 3"
loadSqlIntoSkolan "root" "" "setup.sql" "Initiera database och användare."
loadSqlIntoSkolan "user" "pass" "ddl_all.sql" "Create tables & views."
loadSqlIntoSkolan "user" "pass" "insert.sql" "Insert into larare."
loadSqlIntoSkolan "user" "pass" "dml_update_lonerevision.sql" "Utför lönerevision."
loadSqlIntoSkolan "user" "pass" "dml_insert_csv.sql" "Insert från csv/excel-fil till tabell."

echo ">>> Check larare_pre: Lönesumman = 305000, Kompetens = 8."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"

echo ">>> Check larare: Lönesumman = 330242, Kompetens = 19."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"


# 
# Extraövning från KMOM03 - ta backup och exportera databasen till excel.
# 
mysqldump -uuser -ppass skolan > skolan.sql
echo ">>> MySQL backup till SQL-filen 'skolan.sql'."
echo ">>> file skolan.sql: "
file skolan.sql

# Export av tabeller till individuella filer - Kan jag exportera allt till samma Excel-fil?
echo ">>> Export tabeller till Excel-filen 'skolan_larare.xls'."
echo ">>> Export av tabell för skolans larare_pre, dvs pre lönerevision."
mysql -uuser -ppass skolan -e "select * from larare_pre;" --batch > skolan_larare_pre.xls
echo ">>> Export av tabell för skolans larare."
mysql -uuser -ppass skolan -e "select * from larare;" --batch > skolan_larare.xls
echo ">>> Export av tabell för skolans kurser."
mysql -uuser -ppass skolan -e "select * from kurs;" --batch > skolan_kurser.xls
echo ">>> Export av tabell för kurstillfällen."
mysql -uuser -ppass skolan -e "select * from kurstillfalle;" --batch > skolan_kurstillfallen.xls
