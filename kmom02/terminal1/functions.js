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
    "viewTeachers": viewTeachers,
    "searchTeachers": searchTeachers,
    "searchMinMax": searchMinMax
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
            lon,
            kompetens,
            fodd
        FROM larare
        ORDER BY akronym;
    `;

    res = await db.query(sql);
    str = teacherAsTable(res);
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
            lon,
            kompetens,
            fodd
        FROM larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
            OR kompetens LIKE ?
        ORDER BY akronym;
    `;

    res = await db.query(sql, [like, like, like, like, search, like]);
    str = teacherAsTable(res);
    return str;
}



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
            OR (kompetens >= ?
            AND kompetens <= ?)
        ORDER BY lon, kompetens DESC;
    `;

    res = await db.query(sql, [searchMin, searchMax, searchMin, searchMax]);
    str = teacherAsTable(res);
    return str;
}



/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function teacherAsTable(res) {
    let str;

    /* eslint-disable */
    str  = "+ ----------- + ------------------- + ----------- + ----------- + ----------- + --------------- +\n";
    str += "| AKRONYM     | NAMN                | AVDELNING   | LÖN         | KOMPETENS   | FÖDELSEDAG      |\n";
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
        str += row.kompetens.toString().padStart(11);
        str += " | ";
        str += row.fodd.toISOString().slice(0, 10).padStart(15);
        str += " | \n";
    }
    /* eslint-disable */
    str += "+ ----------- + ------------------- + ----------- + ----------- + ----------- + --------------- +\n";
    /* eslint-enable */
    return str;
}
