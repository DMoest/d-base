/**
* Verify that mysql is installed and working.
* Create a connection to the database and execute a query
* without acually using the database.
* -------------------------
* Kmom02 - Databasteknologier för webben
* "Söka i databasen"
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

/**
 * Main function
 * @async
 * @returns void
 */

(async function() {
    const db = await mysql.createConnection(config);
    let searchStr;

    // Ask question then handle answer in async arrow function callback.
    rl.question("What to search for? ", async (search) => {
        searchStr = await searchTeachers(db, search);
        console.info(searchStr);

        rl.close();
        db.end();
    });
})();

/**
 * Get report, details about teachers.
 * Text-formatted table.
 */

// async function viewTeachers(db) {
//     let sql;
//     let res;
//     let str;

//     sql = `
//         SELECT
//             akronym,
//             fornamn,
//             efternamn,
//             avdelning,
//             lon
//         FROM larare
//         ORDER BY akronym;
//     `;

//     res = await db.query(sql);
//     str = teacherAsTable(res);
//     return str;
// }

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

/**
 * Output result as formatted table from search.
 * @async
 * @param {connection}  db - The database connection.
 * @param {string}      search String.
 * @returns {string}    Table to print, formatted.
 */

async function searchTeachers(db, search) {
    let sql;
    let res;
    let str;
    let like = `%${search}%`;

    console.info(`Searching for: ${search}`);

    // ? is placeholders.
    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
        ORDER BY akronym;
    `;

    res = await db.query(sql, [like, like, like, like, search]);
    str = teacherAsTable(res);
    return str;
}

