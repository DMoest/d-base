/**
 * Eshop (del1) - Terminal client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

const readline = require('readline');
const myFunctions = require("./src/functions.js");
const myTables = require("./src/tables.js");

/**
 * MAIN FUNCTION - CommandLineLoop to run all functions for database handling.
 */
(function main() {
    // Readline init:
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    showWelcomeText();
    rl.setPrompt("Please choose something: ");
    rl.prompt();

    rl.on("close", process.exit);
    rl.on("line", async function(line) { // Med async specat vid declarationen...
        line = line.toLowerCase();
        line = line.trim();
        let lineArray = line.split(" ");

        // console.info("Line: ", line);
        // console.info("linearray: ", lineArray);

        switch (lineArray[0]) {
            case "about":
            case "-a": {
                await about();
                break;
            }
            case "menu":
            case "help":
            case "-h":
                showMenu();
                break;
            case "products":
            case "-p": {
                let result = await myFunctions.getAllProducts();

                await console.info(myTables.productAsTable(result[0]));
                break;
            }
            case "productcategories":
            case "-pc": {
                let result = await myFunctions.getProductCategories();

                await console.info(myTables.categoriesAsTable(result));
                break;
            }
            case "invadd":
            case "-ia": {
                // console.info("* INVADD");

                let shelf = lineArray[2].split("-");
                let section = shelf[0].toUpperCase();
                let position = shelf[1];
                let level = shelf[2];
                let product = parseInt(lineArray[1]);
                let amount = parseInt(lineArray[3]);

                await myFunctions.positionProductOnShelf(section, position, level, product, amount);
                break;
            }
            case "invdel":
            case "-id": {
                // console.info("* INVDEL");
                let shelf = lineArray[2].split("-");
                let section = shelf[0].toUpperCase();
                let position = shelf[1];
                let level = shelf[2];
                let product = parseInt(lineArray[1]);
                let amount = parseInt(lineArray[3]);

                await myFunctions.removeProductFromShelf(section, position, level, product, amount);
                break;
            }
            case "inventory":
            case "-i": {
                // console.info("* INVENTORY");
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.searchInventory(lineArray[1]);
                    await console.info(myTables.inventoryAsTable(result[0]));
                } else {
                    result = await myFunctions.getProductInventories();
                    await console.info(myTables.inventoryAsTable(result[0]));
                }
                break;
            }
            case "log":
            case "-l": {
                // console.info("* LOG PRODUCTS");
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.getRowsFromProductLog(lineArray[1]);
                    await console.info(myTables.logProductsAsTable(result[0]));
                } else {
                    result = await myFunctions.getFullProductLog();
                    await console.info(myTables.logProductsAsTable(result[0]));
                }
                break;
            }
            case "logsearch":
            case "-ls": {
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.searchInProductLog(lineArray[1]);
                    await console.info(myTables.logProductsAsTable(result[0]));
                } else {
                    console.info("You need to enter a search string to find a matching log entry.");
                }
                break;
            }
            case "order":
            case "-o": {
                // console.info("* LOG PRODUCTS");
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.searchOrders(lineArray[1]);
                    await console.info(myTables.orderAsTable(result[0]));
                } else {
                    result = await myFunctions.getAllOrders();
                    await console.info(myTables.orderAsTable(result[0]));
                }
                break;
            }
            case "picklist":
            case "-pl": {
                // console.info("* PICKLIST");
                let result;
                let order = lineArray[1];

                if (lineArray.length <= 1) {
                    console.info("Please specify which order id to print picklist from.");
                } else {
                    result = await myFunctions.getPickingList(order);
                    await console.info(myTables.picklistAsTable(result));
                }
                break;
            }
            case "payed": {
                // console.info("* PICKLIST");
                let invoice = lineArray[1];
                let date = lineArray[2];

                if (lineArray.length <= 1) {
                    console.info("Please specify which order id to change payment status for.");
                } else {
                    await myFunctions.payInvoice(invoice, date);
                    console.info(`The invoice number ${invoice} have benn payed on ${date}`);
                }
                break;
            }
            case "shelf":
            case "-s": {
                // console.info("* SHELF");
                let result = await myFunctions.getInventoryShelves();

                await console.info(myTables.shelfsAsTable(result[0]));
                break;
            }
            case "ship": {
                // console.info("* SHIP");
                let order = lineArray[1];

                if (lineArray.length < 2) {
                    console.info("Please specify which order id to ship an order.");
                } else {
                    let products = await myFunctions.getPickingList(order);

                    await products.forEach(async function(products) {
                        let product = products.product;
                        let amount = products.amount;
                        let section;
                        let position;
                        let level;
                        let inventoryPositions;
                        let positionArray = [];

                        inventoryPositions = products.position.split(', ');

                        if (products.position.length > 8) {
                            positionArray.push(inventoryPositions[0]);

                            let counter = 0;

                            while (amount > 0) {
                                let shelfAmount;

                                positionArray = inventoryPositions[counter].split('-');
                                section = positionArray[0];
                                position = positionArray[1];
                                level = positionArray[2];
                                /* eslint-disable */
                                shelfAmount = await myFunctions.getProductFromPosition(inventoryPositions[counter]);
                                shelfAmount = shelfAmount[0][0].amount;

                                if (amount > shelfAmount) {
                                    await myFunctions.removeProductFromShelf(section, position, level, product, shelfAmount);
                                } else {
                                    await myFunctions.removeProductFromShelf(section, position, level, product, amount);
                                }
                                /* eslint-enable */

                                positionArray.length = 0;
                                amount -= shelfAmount;
                                counter++;
                            }
                        } else {
                            positionArray = products.position.split('-');
                            section = positionArray[0];
                            position = positionArray[1];
                            level = positionArray[2];
                            /* eslint-disable */
                            await myFunctions.removeProductFromShelf(section, position, level, product, amount);
                            /* eslint-enable */
                        }
                    });

                    await myFunctions.shipOrder(order);
                    await console.info(`Order number ${order} has been shiped to the customer.`);
                    break;
                }
                break;
            }
            case "exit":
            case "quit":
            case "q":
            case "-q":
                process.exit();
                break; // Onödigt men linten vill att det finns innan default.
            default:
                console.info("Empty or unknown input command.");
                console.info("Please choose valid option from this menu.");
                showMenu();
                break;
        }

        rl.prompt();
    });
})();



/**
 * MENU for the CommandLineLoop
 */

function showWelcomeText() {
    console.info(`
    * ================================================================== *
    |                                                                    |
    |   Welcome to the terminal commanline loop for E-SHOP!              |
    |   To view available options simply use 'menu' or 'help' command.   |
    |                                                                    |
    | ================================================================== |
    |   E-shop terminal comand loop is create by Daniel Andersson 2020   |
    |   for the course DV1606 - Database technologies @ BTH.             |
    * ================================================================== *
    `);
}

/**
 * MENU for the CommandLineLoop
 */
function showMenu() {
    console.info(`
        * ============================================================================= *
        |                                                                               |
        |   *   *   *                    The E-Shop Menu                    *   *   *   |
        |                                                                               |
        * ============================================================================= *

        Menu, Help (-h) ............................. Show this help menu.
        Inventory (-i) <str> ........................ Show product inventory.
        Invadd (-ia) <prod.id> <shelf> <amount> ..... Position amount of product on inventory shelf.
        Invdel (-id) <prod.id> <shelf> <amount> ..... Remove amount of product on inventory shelf.
        Order (-o) <str> ............................ Search in orders.
        Products (-p) ............................... Show all products.
        Productcategories (-pc) ..................... Show all product categories.
        Picklist (-pl) <order id> ................... Get the picking list for the order.
        Payed <invocie id> <date> ................... Change the orders payment status.
        Shelf (-s) .................................. Show all shelves in the wearhouse.
        Ship <order id> ............................. Ship an existing order to customer.
        Log (-l) <rows> ............................. Show <rows> from product log.
        LogSearch (-ls) <str> ....................... Search <str> in product log.
        About (-a) .................................. Show the about information.
        Exit, Quit (-q) ............................. Quit the application.
    `);
}

function about() {
    console.info(`
        * ================================================================= *
        |                                                                   |
        |   The Eshop application is created by Daniel Andersson, daap19.   |
        |   This application is the final and examinating project for the   |
        |   course database technology DV1606 at Blekinge Institute         |
        |   of Technology.                                                  |
        |                                                                   |
        |   E-shop terminal comand loop is one part of the project and      |
        |   the other part is a webbapplication that works with the same    |
        |   database and data.                                              |
        |                                                                   |
        * ================================================================= *
    `);
}
