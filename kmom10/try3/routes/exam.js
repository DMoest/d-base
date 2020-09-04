/**
 * Exam - Web client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: routes/exam.js
 */

"use strict";

const express = require("express");
const router = express.Router();
const myFunctions = require("./../src/functions.js");
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false});

router.get("/index", async (req, res) => {
    // console.log("* INDEX ROUTE");

    let data = {
        title: "Welcome to Exam!"
    };

    res.render("exam/index", data);
});

router.get("/show", async (req, res) => {
    // console.log("* ALL PRODUCTS ROUTE");

    let data = {
        title: "Show | Exam",
        res: await myFunctions.showLoggInformation()
    };

    res.render("exam/show", data);
});

router.get("/search", async (req, res) => {
    // console.log("* CREATE PRODUCT ROUTE (GET)");

    let data = {
        title: "Search"
    };

    res.render("exam/search", data);
});

router.post("/search", urlencodedParser, async (req, res) => {
    // console.log("* CREATE PRODUCT ROUTE (POST)");
    console.log(JSON.stringify("REQ.BODY: ", req.body, null, 4));

    console.log("req.body.search: ", req.body.search);


    let data = {
        title: "Show | Exam",
        res: await myFunctions.searchLoggInformation(req.body.search)
    };

    res.render("exam/show", data);

    res.render("/exam/show-search", data);
});

module.exports = router;
