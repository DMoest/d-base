-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: dml_export.sql
-- Module content: Export from table to excel document.
-- ***** ***** ***** ***** *****
-- This is a part of training exercises in the course DV1606("Databas") and it will cover the basics of database technologies for the web.



-- Genom terminalklienten kan vi använda komandot
-- "mysql -uuser -ppass skolan --batch < dml_export.sql > report.xls"
-- för att exportera till excel-fil.
-- "--batch" separerar kolumner per tab (\t).
-- Delarna "< dml_export.sql" & "> report.xls" kallas i Unix för input/output redirections.

-- 1. Test query:
select *
from larare limit 3;
