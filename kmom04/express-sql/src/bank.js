/**
 * Express-SQL övning från Kmom04.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - index.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/bank.js
 */

"use strict";

module.exports = {
    showBalance: showBalance,
    findAllInTable: findAllInTable
};

const mysql = require("promise-mysql");
const config = require("../config/db/bank.json");
let db;

/**
 * Main function
 * @async
 * @returns void
 */
(async function connectToDatabase() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**
 * Show all entries in the account table.
 */
async function showBalance() {
    return findAllInTable("account");
}

/**
 * Show allentries in the selected table.
 * @async
 * @param {string}
 * 
 * @returns {RowDataPacket}
 */
async function findAllInTable(table) {
    let sql = `select * from ??;`;
    let res;

    res = await db.query(sql, [table]);
    console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

    return res;
}
