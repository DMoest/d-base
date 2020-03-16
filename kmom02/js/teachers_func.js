/**
* Verify that mysql is installed and working.
* Create a connection to the database and execute a query
* without acually using the database.
* -------------------------
* Kmom02 - Databasteknologier för webben
* "Strukturera i funktioner"
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");



/**
 * Main function
 * @async
 * @returns void
 */

(async function() {
    const db = await mysql.createConnection(config);
    let str;

    str = await viewTeachers(db);
    console.info(str);

    db.end();
})();

/**
 * Get report, details about teachers.
 * Text-formatted table.
 */

async function viewTeachers(db) {
    let sql;
    let res;
    let str;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        ORDER BY akronym;
    `;

    res = await db.query(sql);
    str = teacherAsTable(res);
    return str;
}

function teacherAsTable(res) {
    let str;

    str  = "+ --- --- --- + --- --- --- --- --- + --- --- --- + --- --- --- +\n";
    str += "| AKRONYM     | NAMN                | AVDELNING   |   LÖN       |\n";
    str += "| --- --- --- + --- --- --- --- --- + --- --- --- + --- --- --- |\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(12);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(12);
        str += "| ";
        str += row.lon.toString().padStart(11);
        str += " | \n";
    }
    str += "+ --- --- --- + --- --- --- --- --- + --- --- --- + --- --- --- +\n";
    return str;
}
