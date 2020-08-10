/**
 * Express.js övning från föreläsning med Kenneth.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - Express.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: teachers.js
 */

"use strict";

const config = require("./config.json");
const mysql = require("promise-mysql");
let db;

(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

async function getAll() {
    let sql = `
        select
            *
        from larare
        order by akronym asc;
    `;

    let res = await db.query(sql);
    // console.log(res); // Skriver ut objektet (rowDataPacket)
    return res;
}

module.exports = { // Exporterar objektet teachers
    "getAll": getAll
    // teachers; 
};
