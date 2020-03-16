/**
* Verify that mysql is installed and working.
* Create a connection to the database and execute a query
* without acually using the database.
* -------------------------
* Kmom02 - Databasteknologier för webben
* "Koppla mot MySQL"
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
    let sql;
    let res;
    const db = await mysql.createConnection(config);

    sql = "SELECT 1+1 AS Sum";
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
