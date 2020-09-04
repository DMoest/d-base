/**
 * Eshop (del1) - Web client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: routes/index.js
 */

"use strict";


const express = require("express");
const router  = express.Router();

router.get("/", (req, res) => {
    res.send("Root ROUTE.");
});

router.get("/eshop", (req, res) => {
    res.send("Eshop ROUTE");
});

module.exports = router;
