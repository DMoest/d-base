/**
* Teacher - Show information about teacher(acronym,
* name, department, salary, competence & date of birth).
* -------------------------
* DV1606 - Databasteknologier för webben.
* Kmom03 - Node.js terminalprogram mot MySQL med komandoloop
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const config = require("./config.json");
const mysql = require("promise-mysql");
const myFunctions = require("./functions.js");

let teachers = {
    allTeachers: async function() {
        const db = await mysql.createConnection(config); // Skapar koppling mot databasen.

        let sql = `
        select
            *
        from v_larare
        order by akronym asc;
        `;

        let res = await db.query(sql);

        console.info(myFunctions.teachersAsTable(res)); // Skriver ut res.
        console.table(res);
        db.end(); // Avslutar uppkopplingen mot databasen.
    },

    competenceTeachers: async function() {
        const db = await mysql.createConnection(config);

        let sql = `
        select
            concat(l.fornamn, " ", l.efternamn, " (", l.akronym, ")") as 'namn',
            l.kompetens as 'kompetens_nu',
            lp.kompetens as 'kompetens_pre',
            round(((l.kompetens - lp.kompetens) / l.kompetens) * 100, 2) as 'procent'
        from larare as l
            join larare_pre as lp
                on l.akronym = lp.akronym
        order by 'procent' desc;
        `;

        let res = await db.query(sql);

        console.info(myFunctions.teachersCompetenceAsTable(res)); // Skriver ut objektet res.
        console.table(res); // Skriver ut res i tabell.
        db.end(); // Avslutar uppkopplingen mot databasen.
    },

    salariesTeachers: async function() {
        const db = await mysql.createConnection(config);

        let sql = `
        select
            concat(l.fornamn, " ", l.efternamn, " (", l.akronym, ")") as 'namn',
            l.lon as 'lon_nu',
            lp.lon as 'lon_pre',
            round(((l.lon - lp.lon) / l.lon) * 100, 2) as 'procent'
        from larare as l
            join larare_pre as lp
                on l.akronym = lp.akronym
        order by procent desc;
        `;

        let res = await db.query(sql);

        console.info(myFunctions.teachersSalariesAsTable(res));
        console.table(res);
        db.end();
    },

    newSalary: async function(akronym, salary) {
        const db = await mysql.createConnection(config);

        console.info("Akronym input: ", akronym);
        console.info("New salary input: ", salary);

        let sql = `
        update larare
            set lon = ${salary}
        where
            akronym like '${akronym}';
        `;

        let sql2 = `
        select
            *
        from v_larare
            where akronym like '${akronym}';`;

        let res = await db.query(sql);
        let res2 = await db.query(sql2);

        console.info("res1: ", res);
        console.info("res2: ", res2);
        console.info(myFunctions.teachersAsTable(res2));
        console.table(res2);
        db.end();
    },

    makeSearch: async function(search) {
        console.info("searching for: ", search);
        const db = await mysql.createConnection(config);

        let sql = `
        select
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon,
            alder,
            fodd
        from v_larare
        where
            akronym like ?
            or fornamn like ?
            or efternamn like ?
            or avdelning like ?
            or lon = ?
            or alder like ?
        order by akronym asc;
        `;

        let res = await db.query(sql, [search, search, search, search, search, search]);

        console.info(myFunctions.teachersAsTable(res));
        console.table(res);
        db.end();
    },

    minMaxSearch: async function(searchMin, searchMax) {
        const db = await mysql.createConnection(config);
    
        console.info(`Searching with min-value: ${searchMin}`);
        console.info(`Searching with max-value: ${searchMax}`);
    
        // ? is placeholders.
        let sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                avdelning,
                lon,
                kompetens,
                fodd
            FROM larare
            GROUP BY akronym
            HAVING
                (lon >= ?
                AND lon <= ?) 
                OR (kompetens >= ? AND kompetens <= ?)
            ORDER BY lon DESC;
        `;
    
        let res = await db.query(sql, [searchMin, searchMax, searchMin, searchMax]);

        // console.info(myFunctions.teachersAsTable(res));
        console.table(res);
        db.end();
    },
};

module.exports = teachers; // Exporterar objektet teachers
