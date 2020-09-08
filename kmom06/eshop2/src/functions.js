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
    // console.log("* getAllFromTable() function.");
    let result;
    let sql = `call get_all_from_table(?);`;

    result = await db.query(sql, [table]);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the products in the "produkter" table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function getAllProducts() {
    // console.log("* getAllProducts() function.");
    let result;
    let sql = `call show_all_products();`;

    result = await db.query(sql);
    // console.info("result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the products in the table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function getProductInventories() {
    // console.log("* getProductInventories() function.");
    let result;
    let sql = `call show_all_products();`;

    result = await db.query(sql);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Search in inventory.
 * @param   input           input search.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function searchInventory(input) {
    // console.log("* searchInventory() function.");
    let result;
    let sql = `call search_inventory(?);`;

    result = await db.query(sql, [input]);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the shelves in the wearhouse table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function getInventoryShelves() {
    // console.log("* getInventoryShelves() function.");
    let result;
    let sql = `call show_all_shelves();`;

    result = await db.query(sql);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Position product on shelf in wearhouse inventory.
 * @async
 * @param section               Inventory section.
 * @param position              Inventory position.
 * @param level                 Inventory level
 * @param product               Product id to put on shelf.
 * @param amount                Amount of product to put on shelf.
 * @returns {RowDataPacket}     Result from query.
 */
async function positionProductOnShelf(section, position, level, product, amount) {
    // console.log("* positionProductOnShelf() function.");
    let result;
    let sql = `call position_product_on_shelf(?, ?, ?, ?, ?);`;

    result = await db.query(sql, [section, position, level, product, amount]);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Remove product on shelf in wearhouse inventory.
 * @async
 * @param section               Inventory section.
 * @param position              Inventory position.
 * @param level                 Inventory level
 * @param product               Product id to put on shelf.
 * @param amount                Amount of product to put on shelf.
 * @returns {RowDataPacket}     Result from query.
 */
async function removeProductFromShelf(section, position, level, product, amount) {
    // console.log("* removeProductFromShelf() function.");
    let result;
    let sql = `call remove_product_from_shelf(?, ?, ?, ?, ?);`;

    result = await db.query(sql, [section, position, level, product, amount]);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show details a product.
 * @async
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showProduct(id) {
    // console.log("* showProduct() function.");
    let result;
    let sql = `call show_product(?);`;

    result = await db.query(sql, [id]);

    // console.log("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result[0];
}

/**
 * Show details about all product categories.
 * @async
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getProductCategories() {
    // console.log("* getProductCategories() function.");
    let result;
    let sql = `call show_product_categories();`;

    result = await db.query(sql);

    // console.log("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

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
async function createProduct(id, name, info, price, product, type) {
    // console.log("* createProduct() function.");
    let result;
    let sql = `call create_product(?, ?, ?, ?);`;

    sql += `call give_category_to_product(?, ?);`;

    result = await db.query(sql, [id, name, info, price, product, type]);

    // console.log("RES: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
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
    // console.log("* updateProduct();");
    let sql = `call update_product(?, ?, ?, ?);`;
    let result;

    result = await db.query(sql, [id, name, info, price]);

    // console.log("result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Delete a product.
 * @async
 * @param {string} id       The id of the product to be deleted.
 * @returns {void}
 */
async function deleteProduct(id) {
    // console.log("* deleteProduct();");
    let result;
    let sql = `call delete_product(?);`;

    result = await db.query(sql, [id]);
    // console.log("result: ", result);
    // console.info(`SQL: ${sql} got ${result.length} rows.`);

    return result;
}

/**
 * Search in products.
 * @param   input               Input search.
 * @async                       Async function.
 * @returns {RowDataPacket}     Result from query.
 */
async function searchProduct(input) {
    // console.log("* searchProduct() function.");
    let result;
    let sql = `call search_products(?);`;

    // use wildcard to search for part of strings.
    input = "%" + input + "%";

    result = await db.query(sql, [input]);

    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show details about all product categories.
 * @async
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getFullProductLog() {
    // console.log("* getFullProductLog();");
    let result;
    let sql = `call show_full_product_log();`;

    result = await db.query(sql);
    // console.info("result: ", result);
    // console.info(`SQL: ${sql} got ${result.length} rows.`);

    return result;
}

/**
 * Show details about all product categories.
 * @async
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getRowsFromProductLog(limit) {
    // console.log("* getRowsProductLog();");
    let result;
    let sql = `call show_rows_from_product_log(?);`;

    result = await db.query(sql, [limit]);
    // console.info("result: ", result);
    // console.info(`SQL: ${sql} got ${result.length} rows.`);

    return result;
}

/* ---------- CUSTOMERS ---------- */
/**
 * Show all the products in the "produkter" table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function getAllCustomers() {
    // console.log("* getAllCustomers() function.");
    let result;
    let sql = `call show_all_customers();`;

    result = await db.query(sql);

    // console.info("result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Get customer from order id.
 * @async
 * @param   order           The order to get customer from.
 * @returns {RowDataPacket} Result from query.
 */
async function getCustomerFromOrder(order) {
    // console.log("* getCustomerFromOrder() function.");
    let result;
    let sql = `call get_customer_from_order(?);`;

    result = await db.query(sql, [order]);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}


/* ---------- ORDERS ---------- */
/**
 * Search in orders.
 * @param   input               Input search.
 * @async                       Async function.
 * @returns {RowDataPacket}     Result from query.
 */
async function searchOrders(input) {
    // console.log("* searchOrders() function.");
    let result;
    let sql = `call search_orders(?);`;

    // use wildcard to search for part of strings.
    input = "%" + input + "%";

    result = await db.query(sql, [input]);

    // console.info("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show all the products in the "produkter" table.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function getAllOrders() {
    // console.log("* getAllOrders() function.");
    let result;
    let sql = `call show_all_orders();`;

    result = await db.query(sql);

    // console.info("result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Show details a product.
 * @async
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showOrder(id) {
    // console.log("* showOrder() function.");
    let result;
    let sql = `call show_order(?);`;

    result = await db.query(sql, [id]);

    // console.log("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result[0];
}


/**
 * Get picking list for a placed order.
 * @async
 * @param {string} order        Order id of the picking list.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getPickingList(order) {
    // console.log("* getPickingList() function.");
    let result;
    let sql = `call get_picking_list(?);`;

    result = await db.query(sql, [order]);

    // console.log("Result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result[0];
}


/**
 * Create a order for a customer.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function createOrder(customer) {
    // console.log("* createOrder() function.");
    let result;
    let sql = `call create_order(?);`;

    result = await db.query(sql, [customer]);

    // console.info("result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}

/**
 * Add a product to an order.
 * @async
 * @param   order           The order the product is added to.
 * @param   product         The product to add.
 * @param   amount          Amount of product to add to the order.
 * @returns {RowDataPacket} Result from query.
 */
async function addProductToPickingList(order, product, amount) {
    // console.log("* addProductToPickingList() function.");
    let result;
    let sql = `call add_product_to_picking_list(?, ?, ?);`;

    result = await db.query(sql, [order, product, amount]);

    return result;
}

/**
 * Place the order with the products thats been selected.
 * @async
 * @param   order       The order to place.
 * @returns {RowDataPacket} Result from query.
 */
async function placeTheOrder(order) {
    // console.log("placeTheOrder() function.");
    let result;
    let sql = `call place_the_order(?);`;

    result = await db.query(sql, [order]);

    return result;
}

/**
 * Delete an existing order.
 * @async
 * @returns {RowDataPacket} Result from query.
 */
async function deleteOrder(order) {
    // console.log("* deleteOrder() function.");
    let result;
    let sql = `call delete_order(?);`;

    result = await db.query(sql, [order]);

    // console.info("result: ", result);
    // console.info(`SQL: ${sql} contains ${result.length} rows.`);

    return result;
}


module.exports = {
    "getAllFromTable": getAllFromTable,
    "getAllProducts": getAllProducts,
    "showProduct": showProduct,
    "createProduct": createProduct,
    "updateProduct": updateProduct,
    "deleteProduct": deleteProduct,
    "searchProduct": searchProduct,
    "getProductCategories": getProductCategories,
    "getProductInventories": getProductInventories,
    "getInventoryShelves": getInventoryShelves,
    "positionProductOnShelf": positionProductOnShelf,
    "removeProductFromShelf": removeProductFromShelf,
    "searchInventory": searchInventory,
    "getFullProductLog": getFullProductLog,
    "getRowsFromProductLog": getRowsFromProductLog,
    "getAllCustomers": getAllCustomers,
    "getAllOrders": getAllOrders,
    "searchOrders": searchOrders,
    "showOrder": showOrder,
    "getPickingList": getPickingList,
    "createOrder": createOrder,
    "deleteOrder": deleteOrder,
    "getCustomerFromOrder": getCustomerFromOrder,
    "addProductToPickingList": addProductToPickingList,
    "placeTheOrder": placeTheOrder
};