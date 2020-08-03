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
const teachers = require("./teachers.js");

(function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    rl.setPrompt("Choose something: ");
    rl.prompt();

    rl.on("close", process.exit);
    rl.on("line", async function(line) { // Med async specat vid declarationen...
        console.info(line);

        line = line.trim();
        let lineArray = line.split(" ");

        switch(lineArray[0]) {
            case "menu":
            case "help":
                showMenu();
                break;
            case "teachers":
            case "larare":
                await teachers.allTeachers(); // ...får vi bla. rätt exekveringsordning på saker.
                break;
            case "kompetens":
            case "competence":
                await teachers.competenceTeachers();
                break;
            case "search":
                await teachers.makeSearch(lineArray[1]);
                break;
            case "exit":
            case "quit":
            case "q":
                process.exit();
                break; // Helt meningslöst med BREAK men vi lägger endå till det!
            default:
                showMenu();
                break;
        }

        rl.prompt();
    });

})();

function showMenu() {
    console.info(`
        Choose something from the menu: 
        ------------------------------
        menu, help:         Show this menu.
        exit, quit:         Quit the program.
        teachers:           Show information about teachers.
        search <string>:    Search for teachers.
    `);
}
