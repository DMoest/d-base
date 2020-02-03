-- Samples to show reports from DB
USE dbwebb;

-- Show all tabels in DB
SHOW TABLES;

-- Show content from tabels
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student2course;

-- A report joining all tables
SELECT
    CONCAT(s.name, ' (', s.acronym, ')') AS "student",
    CONCAT(c.name, ' (', c.nick, ')') AS "course",
    sc.grade
FROM student AS s
    INNER JOIN student2course AS sc
        ON s.acronym = sc.acronym
    INNER JOIN course AS c
        ON c.code = sc.code
ORDER BY s.name
;
