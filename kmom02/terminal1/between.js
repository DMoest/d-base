/**
* Between - Show a search result for values between min & max.
* Should show result for salaries and kompetence.
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
    let searchMin;
    let searchMax;

    searchMin = await question("Search with min-value? ");
    searchMax = await question("Search with max-value? ");

    str = await myFunctions.searchMinMax(db, searchMin, searchMax);
    console.info(str);

    rl.close();
    db.end();
})();
