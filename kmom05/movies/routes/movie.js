/**
 * Genomgång för Kmom05.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom05 - genomgång med Kenneth
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: routes/movies.js
 */

"use strict";

const express = require("express");
const router = express.Router();
const movies = require("./../src/movies.js");
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({"extended": false});



// ROUTES:
router.get("/index", async (req, res) => {
    console.log("*** INDEX Route successful!");

    let data = {
        res: await movies.getAllMovies("movies")
    }

    res.render("movies/index", data);
});

router.get("/create", (req, res) => {
    console.log("*** GET CREATE Route successful!");
    res.render("movies/create");
});

router.post("/create", urlencodedParser, async (req, res) => {
    console.log("* REQ.BODY: ", req.body);
    console.log("*** POST CREATE Route successful!");

    await movies.insertMovie(req.body);

    res.redirect("index");
});

router.get("/update/:id", async (req, res) => {
    console.log("*** UPDATE Route successful!");
    console.log("req.params.id: ", req.params.id);

    let data = {
        res: await movies.getOneMovie(req.params.id)
    }

    res.render("movies/update", data);
});

router.post("/update", urlencodedParser, async (req, res) => {
    console.log("* REQ.BODY: ", req.body);
    console.log("*** POST UPDATE Route successful!");

    await movies.updateMovie(req.body);

    res.redirect("index");
});

router.get("/delete/:id", async (req, res) => {
    console.log("*** DELETE Route successful!");
    console.log("req.params.id: ", req.params.id);

    let data = {
        res: await movies.getOneMovie(req.params.id)
    }

    res.render("movies/delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    console.log("* REQ.BODY: ", req.body);
    console.log("*** POST DELETE Route successful!");

    await movies.deleteMovie(req.body.id);

    res.redirect("index");
});



module.exports = router;
