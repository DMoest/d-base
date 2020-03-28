/**
* Teacher - Show information about teacher(acronym,
* name, department, salary, competence & date of birth).
* -------------------------
* Kmom02 - Databasteknologier för webben
* Node.js terminalprogram mot MySQL (v2)
* @author Daniel Andersson
* -------------------------
*/
"use strict";

let myFunctions = require("./functions.js");
const mysql = require("promise-mysql");
const config = require("./config.json");

/**
 * --- MAIN ---
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;

    str = await myFunctions.viewTeachers(db);
    console.info(str);
    db.end();
})();
