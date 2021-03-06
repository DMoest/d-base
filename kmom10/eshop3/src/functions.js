/**
 * Eshop (del2) - Functions.
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
 * @async                   Async function.
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
 * @async                       Async function.
 * @param {string} table        Table name for table to select * from ??.
 * @returns {RowDataPacket}
 */
async function getAllFromTable(table) {
    let result;
    let sql = `call get_all_from_table(?);`;

    result = await db.query(sql, [table]);

    return result;
}

/**
 * Get all products.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function getAllProducts() {
    let result;
    let sql = `call show_all_products();`;

    result = await db.query(sql);

    return result;
}

/**
 * Get all product inventories.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function showProductListFromInventories() {
    let result;
    let sql = `call show_all_products();`;

    result = await db.query(sql);


    return result;
}

/**
 * Get all product inventories.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function getProductFromPosition(position) {
    let result;
    let sql = `call get_product_from_inventory_position(?);`;

    result = await db.query(sql, [position]);

    return result;
}

/**
 * Get all product inventories.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function getProductInventories() {
    let result;
    let sql = `call show_inventory();`;

    result = await db.query(sql);


    return result;
}

/**
 * Search in inventory.
 * @async                   Async function.
 * @param   input           Input search.
 * @returns {RowDataPacket} Result from query.
 */
async function searchInventory(input) {
    let result;
    let sql = `call search_inventory(?);`;

    input = "%"+input+"%";

    result = await db.query(sql, [input]);

    return result;
}

/**
 * Show all the shelves in the inventory table.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function getInventoryShelves() {
    let result;
    let sql = `call show_all_shelves();`;

    result = await db.query(sql);

    return result;
}

/**
 * Position product on shelf in wearhouse inventory.
 * @async                       Async function.
 * @param section               Inventory section.
 * @param position              Inventory position.
 * @param level                 Inventory level
 * @param product               Product id to put on shelf.
 * @param amount                Amount of product to put on shelf.
 * @returns {RowDataPacket}     Result from query.
 */
async function positionProductOnShelf(section, position, level, product, amount) {
    let result;
    let sql = `call position_product_on_shelf(?, ?, ?, ?, ?);`;

    result = await db.query(sql, [section, position, level, product, amount]);

    return result;
}

/**
 * Remove product on shelf in wearhouse inventory.
 * @async                       Async function.
 * @param section               Inventory section.
 * @param position              Inventory position.
 * @param level                 Inventory level
 * @param product               Product id to put on shelf.
 * @param amount                Amount of product to put on shelf.
 * @returns {RowDataPacket}     Result from query.
 */
async function removeProductFromShelf(section, position, level, product, amount) {
    let result;
    let sql = `call remove_product_from_shelf(?, ?, ?, ?, ?);`;

    result = await db.query(sql, [section, position, level, product, amount]);

    return result;
}

/**
 * Show details a product.
 * @async                       Async function.
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showProduct(id) {
    let result;
    let sql = `call show_product(?);`;

    result = await db.query(sql, [id]);

    return result[0];
}

/**
 * Show details about all product categories.
 * @async                       Async function.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getProductCategories() {
    let result;
    let sql = `call show_product_categories();`;

    result = await db.query(sql);

    return result[0];
}

/**
 * Get products in category.
 * @async                       Async function.
 * @param   type                Input category.
 * @returns {RowDataPacket}     Result from query.
 */
async function getProductsOfType(type) {
    console.log("Going to function");
    let result;
    let sql = `call get_products_of_type(?);`;

    type = '%'+type+'%';

    console.log("type: ", type);

    result = await db.query(sql, [type]);

    return result;
}

/**
 * Create a product.
 * @async                               Async function.
 * @param {string} Id                   A id of the product.
 * @param {string} Name                 The name of the product.
 * @param {string} Information          Information about the product.
 * @param {string} Price                The price for the product.
 * @returns {void}
 */
async function createProduct(id, name, info, price) {
    let result;
    let sql = `call create_product(?, ?, ?, ?);`;

    result = await db.query(sql, [id, name, info, price]);

    return result;
}

/**
 * Give category/type to a product.
 * @async                       Async function.
 * @param {string} Product      A id of the product.
 * @param {string} Type         The name of the product type/category.
 * @returns {void}
 */
async function giveTypeToProduct(id, type) {
    let result;
    let sql = `call give_category_to_product(?, ?);`;

    result = await db.query(sql, [id, type]);

    return result;
}

/**
 * Clear all categories/types of a product.
 * @async                   Async function.
 * @param {string} Id       An id of the product.
 * @returns {void}
 */
async function clearProductCategories(id) {
    let result;
    let sql = `call clear_product_categories(?);`;

    result = await db.query(sql, [id]);

    return result;
}

/**
 * Edit details on a product.
 * @async                   Async function.
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

    return result;
}

/**
 * Delete a product.
 * @async                   Async function.
 * @param {string} id       The id of the product to be deleted.
 * @returns {void}
 */
async function deleteProduct(id) {
    let result;
    let sql = `call delete_product(?);`;

    result = await db.query(sql, [id]);

    return result;
}

/**
 * Search in products.
 * @async                       Async function.
 * @param   input               Input search.
 * @returns {RowDataPacket}     Result from query.
 */
async function searchProduct(input) {
    let result;
    let sql = `call search_products(?);`;

    // use wildcard to search for part of strings.
    input = "%" + input + "%";

    result = await db.query(sql, [input]);

    return result;
}


/* ----- LOG ----- */
/**
 * Show details about all product categories.
 * @async                       Async function.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getFullProductLog() {
    let result;
    let sql = `call show_full_product_log();`;

    result = await db.query(sql);

    return result;
}

/**
 * Show details from product log with limited amount of rows.
 * @async                       Async function.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getRowsFromProductLog(limit) {
    let result;
    let sql = `call show_rows_from_product_log(?);`;

    result = await db.query(sql, [limit]);

    return result;
}

/**
 * Show details from product log with limited amount of rows.
 * @async                       Async function.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getRowsFromOrderLog(limit) {
    let result;
    let sql = `call show_rows_from_order_log(?);`;

    result = await db.query(sql, [limit]);

    return result;
}

/**
 * Search details in product activity log.
 * @async                       Async function.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function searchInProductLog(search) {
    let result;
    let sql = `call search_product_log(?);`;

    search = "%" + search + "%";

    result = await db.query(sql, [search]);

    return result;
}

/**
 * Search details in product activity log.
 * @async                       Async function.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function searchInOrdersLog(search) {
    let result;
    let sql = `call search_order_log(?);`;

    search = "%" + search + "%";

    result = await db.query(sql, [search]);

    return result;
}



/* ---------- CUSTOMERS ---------- */
/**
 * Show all the products in the "produkter" table.
 * @async                       Async function.
 * @returns {RowDataPacket}     Result from query.
 */
async function getAllCustomers() {
    let result;
    let sql = `call show_all_customers();`;

    result = await db.query(sql);

    return result;
}

/**
 * Get customer from order id.
 * @async                   Async function.
 * @param   order           The order to get customer from.
 * @returns {RowDataPacket} Result from query.
 */
async function getCustomerFromOrder(order) {
    let result;
    let sql = `call get_customer_from_order(?);`;

    result = await db.query(sql, [order]);

    return result;
}



/* ---------- ORDERS ---------- */
/**
 * Search in orders.
 * @async                       Async function.
 * @param   input               Input search.
 * @returns {RowDataPacket}     Result from query.
 */
async function searchOrders(input) {
    let result;
    let sql = `call search_orders(?);`;

    // use wildcard to search for part of strings.
    input = "%" + input + "%";

    result = await db.query(sql, [input]);

    return result;
}

/**
 * Show all the products in the "produkter" table.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function getAllOrders() {
    let result;
    let sql = `call show_all_orders();`;

    result = await db.query(sql);

    return result;
}

/**
 * Show details a product.
 * @async                       Async function.
 * @param {string} id           A id (productnumber) of the product.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function showOrder(id) {
    let result;
    let sql = `call show_order(?);`;

    result = await db.query(sql, [id]);

    return result[0];
}

/**
 * Get picking list for a placed order.
 * @async                       Async function.
 * @param {string} order        Order id of the picking list.
 * @returns {RowDataPacket}     Resultset from the query.
 */
async function getPickingList(order) {
    let result;
    let sql = `call get_picking_list(?);`;

    result = await db.query(sql, [order]);

    return result[0];
}

/**
 * Create a order for a customer.
 * @async                   Async function.
 * @returns {RowDataPacket} Result from query.
 */
async function createOrder(customer) {
    let result;
    let sql = `call create_order(?);`;

    result = await db.query(sql, [customer]);

    return result;
}

/**
 * Add a product to an order.
 * @async                   Async function.
 * @param   order           The order the product is added to.
 * @param   product         The product to add.
 * @param   amount          Amount of product to add to the order.
 * @returns {RowDataPacket} Result from query.
 */
async function addProductToPickingList(order, product, amount) {
    let result;
    let sql = `call add_product_to_picking_list(?, ?, ?);`;

    result = await db.query(sql, [order, product, amount]);

    return result;
}

/**
 * Place the order with the products thats been selected.
 * @async                   Async function.
 * @param   order           The order to place.
 * @returns {RowDataPacket} Result from query.
 */
async function placeTheOrder(order) {
    let result;
    let sql = `call place_the_order(?);`;

    result = await db.query(sql, [order]);

    return result;
}

/**
 * Ship an existing order.
 * @async                   Async function.
 * @param   order           The order id to ship to customer.
 * @returns {RowDataPacket} Result from query.
 */
async function shipOrder(order) {
    let result;
    let sql = `call ship_order(?);`;

    result = await db.query(sql, [order]);

    return result;
}

/**
 * Pick an order.
 * @async                   Async function.
 * @param   order           The order id to ship to customer.
 * @returns {RowDataPacket} Result from query.
 */
async function pickedOrder(order) {
    let result;
    let sql = `call pick_order(?);`;

    result = await db.query(sql, [order]);

    return result;
}

/**
 * Delete an existing order.
 * @async                   Async function.
 * @param   order           The order id to delete.
 * @returns {RowDataPacket} Result from query.
 */
async function deleteOrder(order) {
    let result;
    let sql = `call delete_order(?);`;

    result = await db.query(sql, [order]);

    return result;
}

/* ----- INVOICES ----- */
/**
 * Create a invoice for order.
 * @async                   Async function.
 * @param   order           The order id to delete.
 * @returns {RowDataPacket} Result from query.
 */
async function createInvoice(order, customer) {
    let result;
    let sql = `call create_invoice(?, ?);`;

    result = await db.query(sql, [order, customer]);

    return result;
}

/**
 * Get invoice for an order.
 * @async                   Async function.
 * @param   order           The order id to get invoice for.
 * @returns {RowDataPacket} Result from query.
 */
async function getInvoice(order) {
    let result;
    let sql = `call get_invoice(?);`;

    result = await db.query(sql, [order]);

    return result;
}


/**
 * Get invoice for an order.
 * @async                   Async function.
 * @param   invoice         The invoice id to pay.
 * @param   date            The date the invoice was payed.
 * @returns {RowDataPacket} Result from query.
 */
async function payInvoice(invoice, date) {
    let result;
    let sql = `call pay_invoice(?, ?);`;

    result = await db.query(sql, [invoice, date]);

    return result;
}



module.exports = {
    "getAllFromTable": getAllFromTable,

    // Products
    "getAllProducts": getAllProducts,
    "showProduct": showProduct,
    "createProduct": createProduct,
    "updateProduct": updateProduct,
    "deleteProduct": deleteProduct,
    "searchProduct": searchProduct,

    // Product Types
    "getProductsOfType": getProductsOfType,
    "getProductFromPosition": getProductFromPosition,
    "getProductCategories": getProductCategories,
    "giveTypeToProduct": giveTypeToProduct,
    "clearProductCategories": clearProductCategories,

    // Inventory
    "getProductInventories": getProductInventories,
    "showProductListFromInventories": showProductListFromInventories,
    "getInventoryShelves": getInventoryShelves,
    "positionProductOnShelf": positionProductOnShelf,
    "removeProductFromShelf": removeProductFromShelf,
    "searchInventory": searchInventory,

    // Activity log
    "getFullProductLog": getFullProductLog,
    "getRowsFromProductLog": getRowsFromProductLog,
    "searchInProductLog": searchInProductLog,
    "getRowsFromOrderLog": getRowsFromOrderLog,
    "searchInOrdersLog": searchInOrdersLog,

    // Customers
    "getAllCustomers": getAllCustomers,
    "getCustomerFromOrder": getCustomerFromOrder,

    // Orders
    "getAllOrders": getAllOrders,
    "createOrder": createOrder,
    "deleteOrder": deleteOrder,
    "searchOrders": searchOrders,
    "showOrder": showOrder,
    "placeTheOrder": placeTheOrder,
    "pickedOrder": pickedOrder,
    "shipOrder": shipOrder,

    // Picking lists
    "getPickingList": getPickingList,
    "addProductToPickingList": addProductToPickingList,

    // Invoice
    "createInvoice": createInvoice,
    "getInvoice": getInvoice,
    "payInvoice": payInvoice,
};
