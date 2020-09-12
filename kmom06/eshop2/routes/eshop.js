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
const router = express.Router();
const myFunctions = require("./../src/functions.js");
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false});



// * ----- INDEX ----- *
router.get("/index", async (req, res) => {
    // console.log("* INDEX ROUTE");

    let data = {
        title: "Welcome to E-shop!"
    };

    res.render("eshop/index", data);
});



// * ----- PRODUCTS ----- *

// All products
router.get("/product", async (req, res) => {
    // console.log("* ALL PRODUCTS ROUTE");

    let data = {
        title: "All Products | E-shop",
        res: await myFunctions.getProductInventories()
    };

    res.render("eshop/products/product-catalog", data);
});

// Single product view
router.get("/product/:id", async (req, res) => {
    // console.log("* A PRODUCT:ID ROUTE, show a specific product.");

    let id = req.params.id;

    let data = {
        title: `Product ${id}`,
        product: id,
        res: await myFunctions.showProduct(id)
    };

    res.render("eshop/products/product-view", data);
});

// Product categories
router.get("/productCategories", async (req, res) => {
    console.log("* PRODUCT CATEGORIES ROUTE (GET)");

    let data = {
        title: "Product categories | E-shop",
        res: await myFunctions.getProductCategories()
    };

    res.render("eshop/products/product-categories", data);
});

// Single product view
router.get("/productCategory/:type", async (req, res) => {
    let type = req.params.type;

    let data = {
        title: `Product category ${type} | E-Shop`,
        type: type,
        res: await myFunctions.getProductsOfType(type)
    };

    res.render("eshop/products/product-type", data);
});








// Search products
router.get("/searchProducts", async (req, res) => {
    // console.log("* SEARCH PRODUCTS ROUTE (POST)");

    let data = {
        title: "Search products | E-shop"
    };

    res.render("eshop/products/product-catalog", data);
});

router.post("/searchProducts", urlencodedParser, async (req, res) => {
    // console.log("* SEARCH PRODUCTS ROUTE (POST)");

    console.log("req.body.search: ", req.body.search);

    let data = {
        title: "Show search products | E-shop",
        res: await myFunctions.searchProduct(req.body.search)
    };

    res.render("eshop/products/product-catalog", data);
});

/* ----- PRODUCTS CRUD ----- */
router.get("/createProduct", async (req, res) => {
    // console.log("* CREATE PRODUCT ROUTE (GET)");

    let data = {
        title: "Create Product",
    };

    res.render("eshop/products/product-create", data);
});

router.post("/createProduct", urlencodedParser, async (req, res) => {
    // console.log("* CREATE PRODUCT ROUTE (POST)");
    let id = req.body.id;
    let name = req.body.name;
    let info = req.body.info;
    let price = req.body.price;
    let type = req.body.type;

    await myFunctions.createProduct(id, name, info, price, id, type);

    res.redirect("./product");
});

// Update product
router.get("/updateProduct/:id", async (req, res) => {
    // console.log("* UPDATE PRODUCT ROUTE (GET)");

    let id = req.params.id;

    let data = {
        title: `Update Product ${id}`,
        product: id,
        res: await myFunctions.showProduct(id)
    };

    res.render("eshop/products/product-update", data);
});

router.post("/updateProduct", urlencodedParser, async (req, res) => {
    // console.log("* UPDATE PRODUCT ROUTE (POST)");

    await myFunctions.updateProduct(req.body.id, req.body.name, req.body.info, req.body.price);

    res.redirect(`./product/${req.body.id}`);
});

// Delete products
router.get("/deleteProduct/:id", async (req, res) => {
    // console.log("* DELETE ROUTE (GET)");

    let id = req.params.id;

    let data = {
        title: `delete Product ${id}`,
        product: id,
        res: await myFunctions.showProduct(id)
    };

    res.render("eshop/products/product-delete", data);
});

router.post("/deleteProduct", urlencodedParser, async (req, res) => {
    // console.log("* DELETE ROUTE (POST)");

    await myFunctions.deleteProduct(req.body.id);

    res.redirect("./product");
});



// * ----- CUSTOMERS ----- *
router.get("/customer", async (req, res) => {
    // console.log("* CUSTOMERS ROUTE");

    let data = {
        title: "All Customers | E-shop",
        res: await myFunctions.getAllCustomers()
    };

    res.render("eshop/customers/customers", data);
});



// * ----- ORDERS ----- *
router.get("/order", async (req, res) => {
    // console.log("* ALL ORDERS ROUTE");

    let data = {
        title: "All Orders | E-shop",
        res: await myFunctions.getAllOrders()
    };

    res.render("eshop/orders/orders", data);
});

// Order view (single order)
router.get("/order/:id", async (req, res) => {
    console.log("* A ORDER ROUTE");
    let id = req.params.id;

    let data = {
        title: `All information on order ${id} | E-shop`,
        customer: await myFunctions.getCustomerFromOrder(id),
        res: await myFunctions.showOrder(id),
        picklist: await myFunctions.getPickingList(id)
    };

    res.render("eshop/orders/order-view", data);
});

// Create order
router.get("/createOrder/:id", async (req, res) => {
    // console.log("* CREATE ORDER ROUTE (GET)");

    let id = req.params.id;

    let data = {
        title: `Create order ${id}`,
        order: id,
        res: await myFunctions.getProductInventories(id)
    };

    res.render(`eshop/orders/orders-selectProducts/${id}`, data);
});

router.post("/createOrder/:id", urlencodedParser, async (req, res) => {
    // console.log("* CREATE ORDER ROUTE (POST)");

    let id = req.body.id;

    await myFunctions.createOrder(id);

    res.redirect(`/eshop/order`);
});

// Select products to order
router.get("/orders-selectProducts/:id", async (req, res) => {
    // console.log("* ORDER - SELECT PRODUCTS ROUTE");

    let id = req.params.id;

    let data = {
        title: `Select products for order ${id} | E-shop`,
        order: id,
        customer: await myFunctions.getCustomerFromOrder(id),
        res: await myFunctions.getProductInventories()
    };

    res.render("eshop/orders/orders-selectProducts", data);
});

// Add product to order
router.post("/:order/addProduct/:product", urlencodedParser, async (req, res) => {
    // console.log("* ORDER - ADD PRODUCT TO ORDER ROUTE (POST)");

    let order = req.params.order;
    let product = req.params.product;
    let amount = req.body.amount;

    await myFunctions.addProductToPickingList(order, product, amount);

    res.redirect(`/eshop/orders-selectProducts/${order}`);
});



// Place the order with the selected products
router.post("/:order/placeOrder/", urlencodedParser, async (req, res) => {
    console.log("* ORDER - PLACE THE ORDER (POST)");

    let order = req.body.order;

    await myFunctions.placeTheOrder(order);

    res.redirect(`/eshop/order/${order}`);
});

// Delete order
router.get("/deleteOrder/:id", async (req, res) => {
    // console.log("* DELETE ORDER ROUTE (GET)");

    let id = req.params.id;
    let customer = req.params.customer;

    let data = {
        title: `Delete order ${id}`,
        product: id,
        customer: customer,
        res: await myFunctions.showOrder(id)
    };

    res.render("eshop/orders/order-delete", data);
});

router.post("/deleteOrder", urlencodedParser, async (req, res) => {
    await myFunctions.deleteOrder(req.body.id);

    res.redirect("./order");
});



// * ----- ABOUT ----- *
router.get("/about", async (req, res) => {
    let data = {
        title: "About E-shop!"
    };

    res.render("eshop/about/about", data);
});



// * ----- LOG ----- *
router.get("/logProducts", async (req, res) => {
    let limit = 20;

    let data = {
        title: "Log product events | Eshop",
        res: await myFunctions.getRowsFromProductLog(limit)
    };

    res.render("eshop/log/log-products", data);
});




router.get("/logOrders", async (req, res) => {
    let limit = 20;

    let data = {
        title: "Log product events | Eshop",
        res: await myFunctions.getRowsFromOrderLog(limit)
    };

    res.render("eshop/log/log-orders", data);
});






// Search in product log.
router.post("/logSearchProducts", urlencodedParser, async (req, res) => {
    console.log("LOG SEARCH");

    let limit = req.body.search;

    let data = {
        title: "Search logged product events | Eshop",
        res: await myFunctions.searchInProductLog(req.body.search)
    };

    res.render("eshop/log/log-products", data);
});

// Search in product log.
router.post("/logSearchOrders", urlencodedParser, async (req, res) => {
    console.log("LOG SEARCH");

    let limit = req.body.search;

    let data = {
        title: "Search logged order events | Eshop",
        res: await myFunctions.searchInOrdersLog(req.body.search)
    };

    res.render("eshop/log/log-orders", data);
});









// Search products
router.get("/searchProducts", async (req, res) => {
    // console.log("* SEARCH PRODUCTS ROUTE (POST)");

    let data = {
        title: "Search products | E-shop"
    };

    res.render("eshop/products/product-catalog", data);
});

router.post("/searchProducts", urlencodedParser, async (req, res) => {
    // console.log("* SEARCH PRODUCTS ROUTE (POST)");

    console.log("req.body.search: ", req.body.search);

    let data = {
        title: "Show search products | E-shop",
        res: await myFunctions.searchProduct(req.body.search)
    };

    res.render("eshop/products/product-catalog", data);
});



module.exports = router;
