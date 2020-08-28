/**
 * Exam - Terminal client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: cli.js
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
            case "visa":
            case "-v": {
                let result = await myFunctions.visaArtistInfo("products");

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

        Menu, Help (-h) ........................ Show this help menu.
        Visa (-v) .............................. Show information about artists and their gigs.
        Exit, Quit (-q) ........................ Quit the program.



    `);
}
