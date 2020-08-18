/**
 * Express-SQL övning från Kmom04.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - index.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: route/index.js
 */

"use strict";

const express = require("express");
const router  = express.Router();

router.get("/", (req, res) => {
    res.send("Hello World");
});

router.get("/about", (req, res) => {
    res.send("About something");
});

router.get("/bank", (req, res) => {
    res.send("The Bank");
});

module.exports = router;
