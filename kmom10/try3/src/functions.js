/**
 * Exam - Functions.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/functions.js
 */

"use strict";

const config = require("../config/db/exam.json");
const mysql = require("promise-mysql");
let db;

/**
 * Connect to database with config.json file.
 * @async
 * @returns void
 */
(async function connectToDB() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**
 * Show all the information in the logg.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function showLoggInformation() {
    console.log("* showLoggInformation() function.");
    let result;
    let sql = `call show_full_information();`;

    result = await db.query(sql);

    console.log("Result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show details from search in logg.
 * @async
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showSearchInformation(id) {
    console.log("* showSearchInformation() function.");
    let result;
    let sql = `call search_information(?);`;

    result = await db.query(sql, [id]);

    console.log("Result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}


/**
 * Search in logg information.
 * @param   input           input search of parts in information columns.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function searchLoggInformation(input) {
    console.log("* getProductInventories() function.");
    let result;
    let sql = `call search_information(?);`;

    let wildcard = "%";

    input = wildcard + input + wildcard;

    console.log("input: ", input);

    result = await db.query(sql, [input]);

    console.info("Result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

module.exports = {
    "showLoggInformation": showLoggInformation,
    "showSearchInformation": showSearchInformation,
    "searchLoggInformation": searchLoggInformation
};
