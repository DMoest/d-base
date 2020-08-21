/**
* Functions Module
* -------------------------
* Kmom02 - Databasteknologier för webben
* Node.js terminalprogram mot MySQL (v2)
* @author Daniel Andersson
* -------------------------
*/
"use strict";

module.exports = {
    "readCommandLine": readCommandLine,
    "makePromise": makePromise,
    "accountsAsTable": accountsAsTable,
    "showBalance": showBalance
};


const config = require("../config/db/bank.json");
const mysql = require("promise-mysql");


/**
 * Read the command line.
 * Returns rl (short for Read Line).
 */
function readCommandLine() {
    const readline = require("readline");

    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    return rl;
}

/**
 * Promisify rl.question to question.
 * Returns question.
 */
function makePromise(rl) {
    // Promisify rl.question to question
    const util = require("util");

    rl.question[util.promisify.custom] = (arg) => {
        return new Promise((resolve) => {
            rl.question(arg, resolve);
        });
    };

    const question = util.promisify(rl.question);

    return question;
}



/**
 * Show allentries in the selected table.
 * @async
 * @param {string}
 *
 * @returns {RowDataPacket}
 */
async function showBalance(table) {
    let db = await  mysql.createConnection(config); // Skapar koppling mot databasen.

    let sql = `select * from ??;`;
    let res;

    res = await db.query(sql, [table]);
    console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

    return res;
}



/* -------------------- TABLE VIEWS -------------------- */
/**
 * Print information about the teachers to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function accountsAsTable(res) {
    console.info("Function: accountsAsTable. STARTS!");

    let str;

    /* eslint-disable */
    str  = "+ ----------- + ------------------- + ----------- +\n";
    str += "| ID          | NAME                | BALANCE     |\n";
    str += "+ ----------- + ------------------- + ----------- +\n";
    /* eslint-enable */
    for (const row of res) {
        str += "| ";
        str += row.id.padEnd(12);
        str += "| ";
        str += row.name.padEnd(20);
        str += "| ";
        str += row.balance.padEnd(12);
        str += "| ";
    }
    /* eslint-disable */
    str += "+ ----------- + ------------------- + ----------- +\n";
    /* eslint-enable */
    return str;
}
