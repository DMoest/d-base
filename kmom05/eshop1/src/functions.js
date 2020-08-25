/**
 * Eshop (del1) - Web client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/functions.js
 */

"use strict";

const config = require("../config/db/eshop.json");
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
async function getAllFromTable(table) {
    console.log("* getAllFromTable() function.");
    let result;
    let sql = `call get_all_from_table(?);`;

    result = await db.query(sql, [table]);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the products in the "produkter" table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function showAllProducts(table) {
    console.log("* showAllProducts() function.");
    let result;
    let sql = `
    call show_all_products();`;

    result = await db.query(sql, [table]);

    console.info("result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the products in the "produkter" table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function showProductsStockView(table) {
    console.log("* showProductsStockView() function.");
    let result;
    let sql = `
    call show_products_view();`;

    result = await db.query(sql, [table]);

    console.info("result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show details a product.
 * @async
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showProduct(id) {
    console.log("* showProduct() function.");
    let result;
    let sql = `call show_product(?);`;

    result = await db.query(sql, [id]);

    console.log("Result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result[0];
}

/**
 * Show details a product.
 * @async
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showProductCategories() {
    console.log("* showProductCategories() function.");
    let result;
    let sql = `call show_product_categories();`;

    result = await db.query(sql);

    console.log("Result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result[0];
}

/**
 * Create a product.
 * @async
 * @param {string} Id                   A id of the product.
 * @param {string} Name                 The name of the product.
 * @param {string} Information          Information about the product.
 * @param {string} Price                The price for the product.
 * @returns {void}
 */
async function createProduct(id, name, info, price) {
    console.log("* createProduct() function.");
    let result;
    let sql = `call create_product(?, ?, ?, ?);`;

    result = await db.query(sql, [id, name, info, price]);

    console.log("RES: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);
}

/**
 * Edit details on a product.
 * @async
 * @param {string} id       The id of the product to be updated.
 * @param {string} name     The updated name of the product.
 * @param {string} info     The updated name of the product.
 * @param {string} price    The updated amount of the product.
 * @returns {void}
 */
async function updateProduct(id, name, info, price) {
    console.log("* updateProduct();");
    console.log("* vart ligger ACCOUNT I DENNA???");
    let sql = `call update_product(?, ?, ?, ?);`;
    let result;

    result = await db.query(sql, [id, name, info, price]);

    console.log("result: ", result);
    console.info(`SQL: ${sql} contains ${result.length} rows.`);
}

/**
 * Delete a product.
 * @async
 * @param {string} id       The id of the product to be deleted.
 * @returns {void}
 */
async function deleteProduct(id) {
    console.log("* deleteProduct();");
    let result;
    let sql = `call delete_product(?);`;

    result = await db.query(sql, [id]);
    console.log("result: ", result);
    console.info(`SQL: ${sql} got ${result.length} rows.`);
}

// /**
//  * Console info a table to terminal.
//  * @param {string} res       Each tuple in DB table to be printed.
//  * @returns {void}
//  */
// function productsAsTable(res) {
//     let str;

//     /* eslint-disable */
//     str  = "+ ----- + -------------------- + -------- +\n";
//     str += "| ID    | Namn                 | Pris     |\n";
//     str += "+ ----- + -------------------- + -------- +\n";
//     /* eslint-enable */
//     for (const row of res[0]) {
//         str += "| ";
//         str += row.id.toString().padEnd(5);
//         str += " | ";
//         str += row.name.padEnd(20);
//         str += " | ";
//         str += row.price.toString().padEnd(5);
//         str += " |\n";
//     }
//     /* eslint-disable */
//     str += "+ ----- + -------------------- + -------- +\n";
//     /* eslint-enable */
//     return str;
// }



module.exports = {
    "getAllFromTable": getAllFromTable,
    "showAllProducts": showAllProducts,
    "showProduct": showProduct,
    "createProduct": createProduct,
    "updateProduct": updateProduct,
    "deleteProduct": deleteProduct,
    "showProductCategories": showProductCategories,
    "showProductsStockView": showProductsStockView,
};
