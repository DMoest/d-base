/**
 * Eshop (del1) - Web client.
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
 * Show all from the selected table.
 * @async
 * @param {string} table        Table name for table to select * from ??.
 * @returns {RowDataPacket}
 */
async function terminalArtistInfo() {
    console.log("* getAllFromTable() function.");
    let result;
    let sql = `call show_artist_info_alt(?);`;

    result = await db.query(sql);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the products in the "produkter" table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function visaArtistInfo() {
    console.log("* visaArtistInfo() function.");
    let result;
    let sql = `call show_all_artist();`;

    result = await db.query(sql);

    console.info("result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

async function informationTable(res) {
    let str;

    console.log(res);

    /* eslint-disable */
    str  = "+---------------------+-----------------------+------------------+----------+-------+\n";
    str += "| Artist              | Ort                   | Dag              | Spelning | Tid   |\n";
    str += "+---------------------+-----------------------+------------------+----------+-------+\n";
    /* eslint-enable */
    for (const row of res) {
        str += "| ";
        str += row.name.padEnd(12);
        str += "| ";
        str += row.name.padEnd(20);
        str += "| ";
        str += row.balance.toString().padEnd(12);
        str += "|\n";
    }
    /* eslint-disable */
    str += "+---------------------+-----------------------+------------------+----------+-------+\n";
    /* eslint-enable */
    return str;
}

// /**
//  * Show all the products in the "produkter" table.
//  * @async
//  * @returns {RowDataPacket} Result from query.
//  */
// async function getProductInventories() {
//     console.log("* getProductInventories() function.");
//     let result;
//     let sql = `call show_all_products();`;

//     result = await db.query(sql);

//     console.info("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result;
// }

// /**
//  * Search in inventory.
//  * @param   input           input search.
//  * @async
//  * @returns {RowDataPacket} Result from query.
//  */
// async function searchInventory(input) {
//     console.log("* getProductInventories() function.");
//     let result;
//     let sql = `call search_inventory(?);`;

//     result = await db.query(sql, [input]);

//     console.info("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result;
// }

// /**
//  * Show all the shelves in the wearhouse table.
//  * @async
//  * @returns {RowDataPacket} Result from query.
//  */
// async function getInventoryShelves() {
//     console.log("* getInventoryShelves() function.");
//     let result;
//     let sql = `call show_all_shelves();`;

//     result = await db.query(sql);

//     console.info("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result;
// }

// /**
//  * Position product on shelf in wearhouse inventory.
//  * @async
//  * @param section               Inventory section.
//  * @param position              Inventory position.
//  * @param level                 Inventory level
//  * @param product               Product id to put on shelf.
//  * @param amount                Amount of product to put on shelf.
//  * @returns {RowDataPacket}     Result from query.
//  */
// async function positionProductOnShelf(section, position, level, product, amount) {
//     console.log("* getInventoryShelves() function.");
//     let result;
//     let sql = `call position_product_on_shelf(?, ?, ?, ?, ?);`;

//     result = await db.query(sql, [section, position, level, product, amount]);

//     console.info("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result;
// }

// /**
//  * Remove product on shelf in wearhouse inventory.
//  * @async
//  * @param section               Inventory section.
//  * @param position              Inventory position.
//  * @param level                 Inventory level
//  * @param product               Product id to put on shelf.
//  * @param amount                Amount of product to put on shelf.
//  * @returns {RowDataPacket}     Result from query.
//  */
// async function removeProductFromShelf(section, position, level, product, amount) {
//     console.log("* getInventoryShelves() function.");
//     let result;
//     let sql = `call remove_product_from_shelf(?, ?, ?, ?, ?);`;

//     result = await db.query(sql, [section, position, level, product, amount]);

//     console.info("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result;
// }

// /**
//  * Show details a product.
//  * @async
//  * @param {string} id           A id (productnumber) of the product.
//  * @returns {RowDataPacket}     Resultset from the query.
//  */
// async function showProduct(id) {
//     console.log("* showProduct() function.");
//     let result;
//     let sql = `call show_product(?);`;

//     result = await db.query(sql, [id]);

//     console.log("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result[0];
// }

// /**
//  * Show details about all product categories.
//  * @async
//  * @returns {RowDataPacket}     Resultset from the query.
//  */
// async function getProductCategories() {
//     console.log("* getProductCategories() function.");
//     let result;
//     let sql = `call show_product_categories();`;

//     result = await db.query(sql);

//     console.log("Result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);

//     return result[0];
// }

// /**
//  * Create a product.
//  * @async
//  * @param {string} Id                   A id of the product.
//  * @param {string} Name                 The name of the product.
//  * @param {string} Information          Information about the product.
//  * @param {string} Price                The price for the product.
//  * @returns {void}
//  */
// async function createProduct(id, name, info, price) {
//     console.log("* createProduct() function.");
//     let result;
//     let sql = `call create_product(?, ?, ?, ?);`;

//     result = await db.query(sql, [id, name, info, price]);

//     console.log("RES: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);
// }

// /**
//  * Edit details on a product.
//  * @async
//  * @param {string} id       The id of the product to be updated.
//  * @param {string} name     The updated name of the product.
//  * @param {string} info     The updated name of the product.
//  * @param {string} price    The updated amount of the product.
//  * @returns {void}
//  */
// async function updateProduct(id, name, info, price) {
//     console.log("* updateProduct();");
//     console.log("* vart ligger ACCOUNT I DENNA???");
//     let sql = `call update_product(?, ?, ?, ?);`;
//     let result;

//     result = await db.query(sql, [id, name, info, price]);

//     console.log("result: ", result);
//     console.info(`SQL: ${sql} contains ${result.length} rows.`);
// }

// /**
//  * Delete a product.
//  * @async
//  * @param {string} id       The id of the product to be deleted.
//  * @returns {void}
//  */
// async function deleteProduct(id) {
//     console.log("* deleteProduct();");
//     let result;
//     let sql = `call delete_product(?);`;

//     result = await db.query(sql, [id]);
//     console.log("result: ", result);
//     console.info(`SQL: ${sql} got ${result.length} rows.`);
// }

// /**
//  * Show details about all product categories.
//  * @async
//  * @returns {RowDataPacket}     Resultset from the query.
//  */
// async function getFullProductLog() {
//     console.log("* getFullProductLog();");
//     let result;
//     let sql = `call show_full_product_log();`;

//     result = await db.query(sql);
//     console.info(`SQL: ${sql} got ${result.length} rows.`);

//     return result;
// }

// /**
//  * Show details about all product categories.
//  * @async
//  * @returns {RowDataPacket}     Resultset from the query.
//  */
// async function getRowsFromProductLog(limit) {
//     console.log("* getRowsProductLog();");
//     let result;
//     let sql = `call show_rows_from_product_log(?);`;

//     result = await db.query(sql, [limit]);
//     console.info(`SQL: ${sql} got ${result.length} rows.`);

//     return result;
// }



module.exports = {
    "visaArtistInfo": visaArtistInfo,
    "informationTable": informationTable
};
