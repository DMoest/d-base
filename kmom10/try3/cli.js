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
            case "show": {
                let result = await myFunctions.showLoggInformation();

                await console.table(result[0]);
                break;
            }
            case "search":
            case "-s": {
                let result = await myFunctions.searchLoggInformation(lineArray[1]);

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
    |   Welcome to the terminal commanline loop for Exam!              |
    |   To view available options simply use 'menu' or 'help' command. |
    |                                                                  |
    | ================================================================ |
    |   Exam terminal comand loop is create by Daniel Andersson        |
    |   for the exam of DV1606 - Database technologies @ BTH 2020.     |
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
        Show ................................... Show information about crimes logged.
        Search (-s) <str> ...................... Show information about crimes logged.
        Exit, Quit (-q) ........................ Quit the program.
    `);
}
