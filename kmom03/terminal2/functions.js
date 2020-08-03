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
    "searchMinMax": searchMinMax,
    "teachersAsTable": teachersAsTable,
    "teachersCompetenceAsTable": teachersCompetenceAsTable,
    "teachersSalariesAsTable": teachersSalariesAsTable
};



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



/* -------------------- QUERIES -------------------- */
/**
 * Output result as formatted table from search.
 * Searching for a min/max spectrum in the salary column.
 * @async
 * @param {connection}  db - The database connection.
 * @param {string}      search String.
 * @returns {string}    Table to print, formatted.
 */
async function searchMinMax(db, searchMin, searchMax) {
    let sql;
    let res;
    let str;
    /* eslint-disable */
    let likeMin = `%${searchMin}%`;
    let likeMax = `%${searchMax}%`;
    /* eslint-enable */

    console.info(`Searching with min-value: ${searchMin}`);
    console.info(`Searching with max-value: ${searchMax}`);

    // ? is placeholders.
    sql = `
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
        ORDER BY lon DESC;
    `;

    res = await db.query(sql, [searchMin, searchMax]);
    str = teachersAsTable(res);
    return str;
}



/* -------------------- TABLE VIEWS -------------------- */
/**
 * Print information about the teachers to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function teachersAsTable(res) {
    let str;

    /* eslint-disable */
    str  = "+ ----------- + ------------------- + ----------- + ----------- + ----------- + --------------- +\n";
    str += "| AKRONYM     | NAMN                | AVDELNING   | LÖN         | ÅLDER       | FÖDELSEDAG      |\n";
    str += "+ ----------- + ------------------- + ----------- + ----------- + ----------- + --------------- +\n";
    /* eslint-enable */
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(12);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(12);
        str += "| ";
        str += row.lon.toString().padStart(11);
        str += " | ";
        str += row.alder.toString().padStart(11);
        str += " | ";
        str += row.fodd.toISOString().slice(0, 10).padStart(15);
        str += " | \n";
    }
    /* eslint-disable */
    str += "+ ----------- + ------------------- + ----------- + ----------- + ----------- + --------------- +\n";
    /* eslint-enable */
    return str;
}



/**
 * Print information about the teachers salaries pre & post last revision to a table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function teachersCompetenceAsTable(res) {
    let str;

    /* eslint-disable */
    str  = "+ ------------------------ + -------------- + ------------------ + --------------- +\n";
    str += "| NAMN (AKRONYM)           | NY KOMPETENS   | TIDIGARE KOMPETENS | PROCENT (%)     |\n";
    str += "+ ------------------------ + -------------- + ------------------ + --------------- +\n";
    /* eslint-enable */
    for (const row of res) {
        str += "| ";
        str += row.namn.padEnd(25);
        str += "| ";
        str += row.kompetens_nu.toString().padStart(14);
        str += " | ";
        str += row.kompetens_pre.toString().padStart(18);
        str += " | ";
        str += row.procent.toString().padStart(15);
        str += " | \n";
    }
    /* eslint-disable */
    str += "+ ------------------------ + -------------- + ------------------ + --------------- +\n";
    /* eslint-enable */
    return str;
}



/**
 * Print information about the teachers salaries pre & post last revision to a table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function teachersSalariesAsTable(res) {
    let str;

    /* eslint-disable */
    str  = "+ ------------------------ + -------------- + -------------- + --------------- +\n";
    str += "| NAMN (AKRONYM)           | NY LÖN         | TIDIGARE LÖN   | PROCENT (%)     |\n";
    str += "+ ------------------------ + -------------- + -------------- + --------------- +\n";
    /* eslint-enable */
    for (const row of res) {
        str += "| ";
        str += row.namn.padEnd(25);
        str += "| ";
        str += row.lon_nu.toString().padStart(14);
        str += " | ";
        str += row.lon_pre.toString().padStart(14);
        str += " | ";
        str += row.procent.toString().padStart(15);
        str += " | \n";
    }
    /* eslint-disable */
    str += "+ ------------------------ + -------------- + -------------- + --------------- +\n";
    /* eslint-enable */
    return str;
}
