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
const teachers = require("./../src/teachers.js");

router.get("/", (req, res) => {
    res.send("Hello!");
});

router.get("/about", (req, res) => {
    res.send("About route...");
});

router.get("/today", (req, res) => {
    let data = {
        date: new Date()
    }

    res.render("today", data);
});

router.get("/teachers", async (req, res) => {
    let data = {
        all: await teachers.getAll()
    }

    res.render("teachers", data);
});

module.exports = router;
