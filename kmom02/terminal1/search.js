/**
* Search - Show the same information as teacher-module/function.
* As the name implies the user should be able to search for all attributes(except date of birth).
* -------------------------
* Kmom02 - Databasteknologier för webben
* Node.js terminalprogram mot MySQL (v2)
* @author Daniel Andersson
* -------------------------
*/
"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");
let myFunctions = require("./functions.js");
let rl = myFunctions.readCommandLine();
const question = myFunctions.makePromise(rl);

/**
 * Main function
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;
    let search;

    search = await question("What to search for? ");
    str = await myFunctions.searchTeachers(db, search);
    console.info(str);

    rl.close();
    db.end();
})();
