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

        console.info("Line: ", line);
        console.info("linearray: ", lineArray);

        switch (lineArray[0]) {
            case "menu":
            case "help":
            case "-h":
                showMenu();
                break;
            case "products":
            case "-p": {
                let result = await myFunctions.getAllProducts("products");

                await console.table(result[0]);
                break;
            }
            case "productcategories":
            case "-pc": {
                let result = await myFunctions.getProductCategories("product_types");

                await console.table(result);
                break;
            }
            case "invadd":
            case "-ia": {
                console.info("* INVADD");

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
                console.info("* INVDEL");
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
                console.info("* INVENTORY");
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.searchInventory(lineArray[1]);
                    await console.table(result[0]);
                } else {
                    result = await myFunctions.getProductInventories();
                    await console.table(result[0]);
                }
                break;
            }
            case "log":
            case "-l": {
                console.info("* LOG PRODUCTS");
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.getRowsFromProductLog(lineArray[1]);
                    await console.table(result[0]);
                } else {
                    result = await myFunctions.getFullProductLog();
                    await console.table(result[0]);
                }
                break;
            }
            case "order":
            case "-o": {
                console.info("* LOG PRODUCTS");
                let result;

                if (lineArray.length > 1) {
                    result = await myFunctions.searchOrders(lineArray[1]);
                    await console.table(result[0]);
                } else {
                    result = await myFunctions.getAllOrders();
                    await console.table(result[0]);
                }
                break;
            }
            case "shelf":
            case "-s": {
                console.info("* SHELF");
                let result = await myFunctions.getInventoryShelves();

                await console.table(result[0]);
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
    * ================================================================ *
    |                                                                  |
    |   Welcome to the terminal commanline loop for E-SHOP!            |
    |   To view available options simply use 'menu' or 'help' command. |
    |                                                                  |
    | ================================================================ |
    |   E-shop terminal comand loop is create by Daniel Andersson 2020 |
    |   for the course DV1606 - Database technologies @ BTH.           |
    * ================================================================ *
    `);
}

/**
 * MENU for the CommandLineLoop
 */
function showMenu() {
    console.info(`
        * ============================================================= *
        |                                                               |
        |   *   *   *            The E-Shop Menu            *   *   *   |
        |                                                               |
        * ============================================================= *

        Menu, Help (-h) ............................. Show this help menu.
        Inventory (-i) <str> ........................ Show product inventory.
        Invadd (-ia) <prod.id> <shelf> <amount> ..... Position amount of product on inventory shelf.
        Invdel (-id) <prod.id> <shelf> <amount> ..... Remove amount of product on inventory shelf.
        Products (-p) ............................... Show all products.
        Productcategories (-pc) ..................... Show all products.
        Shelf (-s) .................................. Show all shelves in the wearhouse.
        Log (-l) <rows> ............................. Show <rows> from product log.
        Exit, Quit (-q) ............................. Quit the program.
    `);
}
