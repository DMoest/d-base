#!/usr/bin/env bash
# shellcheck disable=SC2181
# --------------------------------------------------
# DV1606, Databasteknologier för webben VT20
# Daniel Andersson, DAAP19
# Module: reset_db.bash
# Module content: Reset database Eshop with setup, ddl & insert.
# --------------------------------------------------



# --------------------------------------------------
# Load a SQL file into Eshop.
# --------------------------------------------------
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



# --------------------------------------------------
# Recreate and reset the database.
# --------------------------------------------------
echo ">>> Reset database Eshop."
loadSqlIntoDB "root" "" "setup.sql" "Init database and users."
loadSqlIntoDB "user" "pass" "ddl.sql" "Create tables, views, stored procedures & triggers."
loadSqlIntoDB "user" "pass" "insert.sql" "Insert data into tables."
loadSqlIntoDB "user" "pass" "dml.sql" "DML describe tables, views, procedures & triggers in the database."



# --------------------------------------------------
# Describe Tables:
# --------------------------------------------------
# The following can be use by comented in again.
# Maybe it will help you to search if errors occur.
# --------------------------------------------------
# echo ">>> Describe all TABLES:"
# echo ">>> Describe table products."
# mysql -uuser -ppass eshop -e "describe products;"
# echo ">>> Describe table product_types."
# mysql -uuser -ppass eshop -e "describe product_types;"
# echo ">>> Describe table product_pictures."
# mysql -uuser -ppass eshop -e "describe product_pictures;"
# echo ">>> Describe table inventory."
# mysql -uuser -ppass eshop -e "describe inventory;"
# echo ">>> Describe table customers."
# mysql -uuser -ppass eshop -e "describe customers;"
# echo ">>> Describe table order_from_customer."
# mysql -uuser -ppass eshop -e "describe order_from_customer;"
# echo ">>> Describe table customer_phones."
# mysql -uuser -ppass eshop -e "describe customer_phones;"
# echo ">>> Describe table orders."
# mysql -uuser -ppass eshop -e "describe orders;"
# echo ">>> Describe table invoices."
# mysql -uuser -ppass eshop -e "describe invoices;"
# echo ">>> Describe table picking_list."
# mysql -uuser -ppass eshop -e "describe picking_list;"
# echo ">>> Describe table products_to_picking_list."
# mysql -uuser -ppass eshop -e "describe products_to_picking_list;"
# echo ">>> Describe table log_producs."
# mysql -uuser -ppass eshop -e "describe log_producs;"

# Show tables:
# --------------------------------------------------
# echo ">>> Show tables in database eshop."
# mysql -uuser -ppass eshop -e "SHOW TABLES;"

# Describe Procedures:
# --------------------------------------------------
# echo ">>> Show procedure get_all_from_table."
# mysql -uuser -ppass eshop -e "show create procedure get_all_from_table;"
# echo ">>> Show procedure show_all_products."
# mysql -uuser -ppass eshop -e "show create procedure show_all_products;"
# echo ">>> Show procedure show_product."
# mysql -uuser -ppass eshop -e "show create procedure show_product;"
# echo ">>> Show procedure show_product_categories."
# mysql -uuser -ppass eshop -e "show create procedure show_product_categories;"
# echo ">>> Show procedure create_product."
# mysql -uuser -ppass eshop -e "show create procedure create_product;"
# echo ">>> Show procedure update_product."
# mysql -uuser -ppass eshop -e "show create procedure update_product;"
# echo ">>> Show procedure delete_product."
# mysql -uuser -ppass eshop -e "show create procedure delete_product;"

# Show Trigger:
# --------------------------------------------------
# echo ">>> Show create TRIGGERS."
# echo ">>> Show triggerslog_product_insert."
# mysql -uuser -ppass eshop -e "show create trigger log_product_insert;"
# echo ">>> Show triggerslog_product_update."
# mysql -uuser -ppass eshop -e "show create trigger log_product_update;"
# echo ">>> Show triggerslog_product_delete."
# mysql -uuser -ppass eshop -e "show create trigger log_product_delete;"



# Backup:
# --------------------------------------------------
mysqldump -uuser -ppass eshop > eshop_backup.sql
echo ">>> MySQL backup from database Eshop to SQL-file 'eshop_backup.sql'."
echo ">>> file eshop_backup.sql: "
file eshop_backup.sql

# Export av tabeller till individuella filer - Kan jag exportera allt till samma Excel-fil?
echo ">>> Export of all tables to Excel-files: "
echo ">>> Export from table Eshop.Products."
mysql -uuser -ppass eshop -e "select * from products;" --batch > products.xls

echo ">>> Export from table Eshop.Invoices."
mysql -uuser -ppass eshop -e "select * from invoices;" --batch > invoices.xls

echo ">>> Export from table Eshop.Order_from_customer."
mysql -uuser -ppass eshop -e "select * from order_from_customer;" --batch > order_from_customer.xls

echo ">>> Export from table Eshop.orders."
mysql -uuser -ppass eshop -e "select * from orders;" --batch > orders.xls

echo ">>> Export from table Eshop.Customer_phones."
mysql -uuser -ppass eshop -e "select * from customer_phones;" --batch > customer_phones.xls

echo ">>> Export from table Eshop.Customers."
mysql -uuser -ppass eshop -e "select * from customers;" --batch > customers.xls

echo ">>> Export from table Eshop.Products_to_picking_list."
mysql -uuser -ppass eshop -e "select * from products_to_picking_list;" --batch > products_to_picking_list.xls

echo ">>> Export from table Eshop.Picking_list."
mysql -uuser -ppass eshop -e "select * from picking_lists;" --batch > picking_list.xls

echo ">>> Export from table Eshop.Product_types."
mysql -uuser -ppass eshop -e "select * from product_types;" --batch > product_types.xls

echo ">>> Export from table Eshop.Product_pictures."
mysql -uuser -ppass eshop -e "select * from product_pictures;" --batch > product_pictures.xls

echo ">>> Export from table Eshop.Inventory."
mysql -uuser -ppass eshop -e "select * from inventory;" --batch > inventory.xls

echo ">>> Export from table Eshop.Log_products."
mysql -uuser -ppass eshop -e "select * from log_products;" --batch > log_products.xls
