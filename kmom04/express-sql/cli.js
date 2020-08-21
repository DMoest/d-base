/**
 * Bygg ett menydrivet terminalprogram med JavaScript i Node.js som jobbar mot en MySQL databas.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom03 - Node.js terminalprogram mot MySQL med komandoloop
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

const readline = require('readline');
const bankCli = require("./src/bankCli.js");

/**
 * MAIN FUNCTION - CommandLineLoop to run all functions for database handling.
 */
(function main() {
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
            case "menu":
            case "help":
            case "h":
                showMenu();
                break;
            case "balance":
            case "b": {
                let res = await bankCli.showBalance("account");

                console.info(bankCli.accountsAsTable(res));
                break;
            }
            case "move":
            case "m":
                await bankCli.makeTransaction(lineArray[1], lineArray[2], lineArray[3]);
                break;
            case "exit":
            case "quit":
            case "q":
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
    * ============================================================ *
    |  Welcome to the terminal commanline loop!                    |
    |  For options available simply use 'menu' or 'help' (m / h).  |
    * ============================================================ *
    `);
}



/**
 * MENU for the CommandLineLoop
 */
function showMenu() {
    console.info(`
        *** MENU ***

        Menu, Help (h): ............................ Show this menu.
        Exit, Quit (q): ............................ Quit the program.
        Balance (b): ............................... Show account balance for all accounts.
        Move (m) <from> <to> <amount>: ............. Make transaction from Adam to Eva.
    `);
}
