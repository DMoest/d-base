/**
 * Kmom05.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/movies.js
 */

"use strict";

const express = require("express");
const router = express.Router();

// ROUTES:
router.get("/", (req, res) => {
    res.send("Index or \"/\" ROUTE.");
});

router.get("/movie", (req, res) => {
    res.send("MOVIE ROUTE.");
});

module.exports = router;
