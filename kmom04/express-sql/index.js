/**
 * Express-SQL övning från Kmom04.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - index.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

const port    = process.env.DBWEBB_PORT || 1337;
const path    = require("path");
const express = require("express");
const app     = express();
const routeIndex = require("./routes/index.js");
const routeToday = require("./routes/today.js");
const routeBank = require("./routes/bank.js");
const middleware = require("./middleware/index.js");

app.set("view engine", "ejs");

app.use(middleware.logIncoming);
app.use(express.static(path.join(__dirname, "public")));
app.use("/", routeIndex);
app.use("/today", routeToday);
app.use("/bank", routeBank);
app.listen(port, logStartUpDetails);



/**
 * Log app details to console when starting up.
 *
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

    console.info(`Server is listening on port ${port}.`);
    console.info("Available routes are:");
    console.info(routes);
}
