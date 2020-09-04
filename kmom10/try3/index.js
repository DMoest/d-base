/**
 * Exam- Web client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

// Basic constants:
const port = process.env.DBWEBB_PORT || 1337;
const express = require("express");
const app = express();

// Route constants:
const routeIndex = require("./routes/index.js");
const routeExam = require("./routes/exam.js");
const middleware = require("./middleware/index.js");
const path = require("path");

// Setup for Embeded JavaScript (EJS):
app.set("view engine", "ejs");

// Middlewear:
app.use(middleware.logIncoming);
app.use(express.static(path.join(__dirname, "public")));

// Routes:
app.use("/", routeIndex);
app.use("/exam", routeExam);

// Listen to ports:
app.listen(port, logStartUpDetails);


/**
 * Log app details to console when starting up.
 * @return {void}
 */
function logStartUpDetails() {
    let routes = [];

    // Find supported routes:
    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            // Routes registered directly on the app
            routes.push(middleware.route);
        } else if (middleware.name === "router") {
            // Routes added as router middleware
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    // Startup messages:
    console.info(`Server START.`);
    console.info(`Server is listening on port ${port}.`);
    console.info("Available routes are:");
    console.info(routes);
}
