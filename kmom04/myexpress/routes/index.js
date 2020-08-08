/**
 * Express.js övning från föreläsning 03/04 med Kenneth.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - Express.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: routes/index.js
 */

"use strict";

const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
    res.send("Hello!");
});

router.get("/about", (req, res) => {
    res.send("About route...");
});

module.exports = router;
