-- Create DB schema
USE dbwebb;

-- Start by dropping all tables (the order may matter).
DROP TABLE IF EXISTS student2course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;

-- Student table
CREATE TABLE student
(
    code CHAR(6) NOT NULL,
    name VARCHAR(40) NOT NULL,
    nick CHAR(10) NOT NULL,
    points DECIMAL(2,1),

    PRIMARY KEY (code)
);

-- Student2course, connecting students taking a course
CREATE TABLE student2course
(
    acronym CHAR(6) NOT NULL,
    code CHAR(6) NOT NULL,
    grade CHAR(1) NOT NULL,

    FOREIGN KEY (acronym) REFERENCES student(acronym),
    FOREIGN KEY (code) REFERENCES course(code),

    PRIMARY KEY (acronym, code)
);
