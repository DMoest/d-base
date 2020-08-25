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

const config = require("../config/db/bank.json");
const mysql = require("promise-mysql");
let db;


/**
 * Connect to database function
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
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function showBalance(table) {
    console.log("* show_balance();");

    let res;
    let sql = `
    call show_balance();`;

    res = await db.query(sql, [table]);

    console.log("* RES: ", res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res;
}

// /**
//  * Show all entries in the account table.
//  * @async
//  * @returns {RowDataPacket} Result from query.
//  */
// async function showAccount(id) {
//     console.log("* show_balance();");

//     let res;
//     let sql = `
//     call show_account(?);`;

//     res = await db.query(sql, [id]);

//     console.log("* RES: ", res);
//     console.info(`SQL: ${sql} got ${res.length} rows.`);

//     return res[0];
// }

/**
 * Create a new bank account.
 * @async
 * @param {string} id      A id of the account.
 * @param {string} name    The name of the account holder.
 * @param {string} balance Initial amount in the account.
 * @returns {void}
 */
async function createAccount(id, name, balance) {
    console.log("* createAccount();");
    let res;
    let sql = `call create_account(?, ?, ?);`;

    res = await db.query(sql, [id, name, balance]);

    console.log("RES: ", res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}

/**
 * Show details for an account.
 *
 * @async
 * @param {string} id A id of the account.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showAccount(id) {
    console.log("* showAccount();");
    let res;
    let sql = `call show_account(?);`;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * Edit details on an account.
 * @async
 * @param {string} id      The id of the account to be updated.
 * @param {string} name    The updated name of the account holder.
 * @param {string} balance The updated amount in the account.
 * @returns {void}
 */
async function updateAccount(id, name, balance) {
    console.log("* updateAccount();");
    let res;
    let sql = `call edit_account(?, ?, ?);`;

    res = await db.query(sql, [id, name, balance]);
    console.log("res: ", res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}

/**
 * Edit details on an account.
 * @async
 * @param {string} id      The id of the account to be updated.
 * @param {string} name    The updated name of the account holder.
 * @param {string} balance The updated amount in the account.
 * @returns {void}
 */
async function deleteAccount(id) {
    console.log("* deleteAccount();");
    let res;
    let sql = `call delete_account(?);`;

    res = await db.query(sql, [id]);
    console.log("res: ", res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}

/**
 * Show allentries in the selected table.
 * @async
 * @param {string}
 *
 * @returns {RowDataPacket}
 */
async function findAllInTable(table) {
    console.log("* findAllInTable();");
    console.log("* findAllInTable() function.");
    let sql = `select * from ??;`;
    let res;

    res = await db.query(sql, [table]);
    console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

    return res;
}

module.exports = {
    "showBalance": showBalance,
    "findAllInTable": findAllInTable,
    "createAccount": createAccount,
    "showAccount": showAccount,
    "updateAccount": updateAccount,
    "deleteAccount": deleteAccount,
};
