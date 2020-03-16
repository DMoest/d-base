/**
* Verify that mysql is installed and working.
* Create a connection to the database and execute a query
* without acually using the database.
* -------------------------
* Kmom02 - Databasteknologier för webben
* "Skriv ut som formatterad text"
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
    let sql;
    let res;

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

    // RAW output:
    // console.info("RAW output:")
    // console.info(res);

    // JSON output:
    // console.info("JSON output:")
    // let data;

    // data = JSON.stringify(res, null, 4);
    // console.info(data);

    // Loop through:
    // for (const row of res) {
    //     console.info(row);
    // }

    console.info("String-format output:");
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
    console.info(str);



    db.end();
})();
