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
        SELECT
            *
        FROM v_larare
        ORDER BY akronym asc;
        `;

        let res = await db.query(sql);
        console.info(myFunctions.teachersAsTable(res)); // Skriver ut res.
        db.end(); // Avslutar uppkopplingen mot databasen.
    },

    competenceTeachers: async function() {
        const db = await mysql.createConnection(config);

        let sql = `
        SELECT
            concat(l.förnamn, " ", l.efternamn, " (", l.akronym, ")") as namn,
            l.kompetens as kompetens-nu,
            lp.kompetens as kompetens-pre
        from larare as l
            join larare_pre as pl
        order by kompetens-nu desc;
        `;

        let res = await db.query(sql);
        console.table(res); // Skriver ut res.
        db.end(); // Avslutar uppkopplingen mot databasen.
    },

    makeSearch: async function(search) {
        const db = await mysql.createConnection(config);
        let str;

        search = await question("What to search for? ");
        str = await myFunctions.searchTeachers(db, search);
        console.info(str);

        rl.close();
        db.end();
    },
};

module.exports = teachers; // Exporterar objektet teachers
