/**
 * Express-SQL övning från Kmom04.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - terminal command loop
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/bankCli.js
 */

"use strict";

const config = require("../config/db/bank.json");
const mysql = require("promise-mysql");
// const bank = require("./bank.js");
let db;

let bank = {
    connectToDB: async function() {
        const db = await mysql.createConnection(config);

        process.on("exit", () => {
            db.end();
        });
    },

    endConnectionToDB: async function() {
        db.end();
    },

    showBalance: async function(table) {
        db = await mysql.createConnection(config);

        let sql = `select * from ??;`;
        let res;

        res = await db.query(sql, [table]);
        console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

        db.end();

        return res;
    },

    makeTransaction: async function(fromInput, toInput, amount) {
        let table = "account";
        let fromAccount;
        let toAccount;

        (function() {
            if (fromInput === "adam") {
                fromAccount = "1111";
                return fromAccount;
            } else if (fromInput === "eva") {
                fromAccount = "2222";
                return fromAccount;
            }
        })();

        (function() {
            if (toInput === "adam") {
                toAccount = "1111";
                return toAccount;
            } else if (toInput === "eva") {
                toAccount = "2222";
                return toAccount;
            }
        })();

        console.log("From: ", fromAccount, " To: ", toAccount);
        return bank.moveTheMoney(table, fromAccount, toAccount, amount);
    },

    moveTheMoney: async function(table, fromAccount, toAccount, amount) {
        db = await mysql.createConnection(config);

        let sql;
        let sqlStartTrans = "start transaction; ";
        let sqlCommit = " commit;";
        let res;

        // let sqlRollback = " rollback;";

        sql = sqlStartTrans;
        sql += ` update ?? set balance = balance - ${amount} where id = "${fromAccount}"; `;
        sql += ` update ?? set balance = balance + ${amount} where id = "${toAccount}"; `;
        sql += sqlCommit;


        res = await db.query(sql, [table, table]);

        // console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

        db.end();

        return res;
    },

    findAllInTable: async function(table) {
        let sql = `select * from ??;`;
        let res;

        res = await db.query(sql, [table]);
        console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);
    },

    accountsAsTable: function(res) {
        let str;

        /* eslint-disable */
        str  = "+ ----------- + ------------------- + ----------- +\n";
        str += "| ID          | NAME                | BALANCE     |\n";
        str += "+ ----------- + ------------------- + ----------- +\n";
        /* eslint-enable */
        for (const row of res) {
            str += "| ";
            str += row.id.toString().padEnd(12);
            str += "| ";
            str += row.name.padEnd(20);
            str += "| ";
            str += row.balance.toString().padEnd(12);
            str += "|\n";
        }
        /* eslint-disable */
        str += "+ ----------- + ------------------- + ----------- +\n";
        /* eslint-enable */
        return str;
    },
};

module.exports = bank;
