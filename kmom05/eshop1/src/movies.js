/**
 * Kmom05.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/movies.js
 */

"use strict";

const config = require("./../config/db/config.json");
const mysql = require("promise-mysql");
let db;

(async function connectToDB() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

async function getAllMovies(table) {
    console.log("* getAll() function");
    
    let res;
    let sql = `select * from ??;`;

    res = await db.query(sql, [table]);

    return res;
}

async function getOneMovie(id) {
    console.log("* insertMovie() function.");
    
    let res;
    let sql = `
    select
        *
    from movies
    where id = ?;`;

    res = await db.query(sql, [id]);

    return res;
}

async function insertMovie(data) {
    console.log("* insertMovie() function.");
    
    let res;
    let sql = `
    insert
    into movies (name, year)
    values (?, ?);`;

    res = await db.query(sql, [data.name, data.year]);

    return res;
}

async function updateMovie(data) {
    // let res;
    let sql = `
    update movies
    set
        name = ?,
        year = ?
    where id = ?
    ;`;

    await db.query(sql, [data.name, data.year, data.id]);
}



module.exports = {
    "getAllMovies": getAllMovies,
    "getOneMovie": getOneMovie,
    "insertMovie": insertMovie,
    "updateMovie": updateMovie
};
