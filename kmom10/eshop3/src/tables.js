/**
 * Eshop (del2) - Functions.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: src/tables.js
 */



/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function productAsTable(product) {
    let str;
    let zero = 0;

    /* eslint-disable */
    str =  " ID      Namn                             Kategori                              Information                                                                Pris    Antal\n";
    str += " ...     .......                          ...........                           ..............                                                             ....    .....\n";
    /* eslint-enable */

    for (const row of product) {
        str += " ";
        str += row.id.toString().padEnd(5);
        str += "   ";
        str += row.name.padEnd(30);
        str += "   ";
        str += row.types.toString().padEnd(35);
        str += "   ";
        str += row.info.substr(0, 69).padEnd(70);
        str += "   ";
        str += row.price.toString().padStart(5);
        str += "     ";
        if (row.amount === null) {
            str += zero.toString().padStart(5);
        } else {
            str += row.amount.toString().padStart(5);
        }
        str += " \n";
    }
    str += "   \n";

    return str;
}


/**
 * Print orders to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function orderAsTable(order) {
    let str;
    let notShipped = " ";

    /* eslint-disable */
    str =  " ID      Kundnummer   Namn              Orderrader   Skapad                                          Skickad                                         Status       Betald   \n";
    str += " ...     ..........   ....              ...........  .......                                         .......                                         ......       ......   \n";
    /* eslint-enable */

    for (const row of order) {
        str += " ";
        str += row.id.toString().padEnd(5);
        str += "   ";
        str += row.customer.toString().padEnd(10);
        str += "   ";
        str += row.name.toString().padEnd(15);
        str += "   ";
        str += row.rows.toString().padEnd(10);
        str += "   ";
        str += row.created.toString().padStart(5);
        str += "   ";
        if (row.shipped === null) {
            str += notShipped.toString().padStart(45);
        } else {
            str += row.shipped.toString().padStart(5);
        }
        str += "   ";
        str += row.status.padEnd(10);
        str += "   ";
        str += row.payment.padEnd(10);
        str += " \n";
    }
    str += "   \n";

    return str;
}


/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function inventoryAsTable(product) {
    let str;

    /* eslint-disable */
    str =  " ID      Produkt   Namn                               Antal   Lagerplats    \n";
    str += " ...     .......   .......                            .....   .......... \n";
    /* eslint-enable */

    for (const row of product) {
        str += " ";
        str += row.id.toString().padEnd(5);
        str += "   ";
        str += row.product.toString().padEnd(7);
        str += "   ";
        str += row.name.padEnd(30);
        str += "     ";
        str += row.amount.toString().padStart(5);
        str += "   ";
        str += row.position.padStart(10);
        str += " \n";
    }
    str += "   \n";

    return str;
}


/**
 * Print inventory to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function categoriesAsTable(input) {
    let str;

    /* eslint-disable */
    str =  " Kategori     Antal produkter     \n";
    str += " ........     ...............     \n";
    /* eslint-enable */

    for (const row of input) {
        str += " ";
        str += row.type.toString().padEnd(15);
        str += "   ";
        str += row.products.toString().padStart(10);
        str += " \n";
    }
    str += "   \n";

    return str;
}


/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function shelfsAsTable(input) {
    let str;

    /* eslint-disable */
    str =  " ID      Lagerplats    Product   Antal    \n";
    str += " ...     ..........    ........  ......   \n";
    /* eslint-enable */

    for (const row of input) {
        str += " ";
        str += row.id.toString().padEnd(5);
        str += "   ";
        str += row.position.padEnd(12);
        str += "     ";
        str += row.product.toString().padStart(5);
        str += "   ";
        str += row.amount.toString().padStart(5);
        str += " \n";
    }
    str += "   \n";

    return str;
}


/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function picklistAsTable(order) {
    let str;

    /* eslint-disable */
    str =  " ID      Order   Index   Produkt    Namn                        Information                 Antal      Lagerplats                         Antal i lager       Lager diff        \n";
    str += " ...     ......  ......  ........   ............                ............                ........   .............                      ..............      ...............   \n";
    /* eslint-enable */

    for (const row of order) {
        str += " ";
        str += row.id.toString().padEnd(5);
        str += "   ";
        str += row.order.toString().padEnd(5);
        str += "   ";
        str += row.index.toString().padEnd(5);
        str += "   ";
        str += row.product.toString().padEnd(8);
        str += "   ";
        str += row.name.padEnd(25);
        str += "   ";
        str += row.info.toString().substr(0, 24).padEnd(25);
        str += "   ";
        str += row.amount.toString().padEnd(8);
        str += "   ";
        str += row.position.padEnd(30);
        str += "     ";
        str += row.stored.toString().padEnd(15);
        str += "     ";
        str += (row.stored - row.amount).toString().padEnd(10);
        str += "     ";
        str += " \n";
    }
    str += "   \n";

    return str;
}


/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function logProductsAsTable(product) {
    let str;

    /* eslint-disable */
    str =  " ID      Produkt    Datum & Tid                 Aktivitet                                  Före                                                   Efter       \n";
    str += " ...     .......    ..............              ............                               .......                                                ........    \n";
    /* eslint-enable */

    for (const row of product) {
        str += " ";
        str += row.id.toString().padEnd(5);
        str += "   ";
        str += row.product.toString().padEnd(8);
        str += "   ";
        str += row.time.toString().substr(0, 24).padEnd(25);
        str += "   ";
        str += row.activity.substr(0, 39).padEnd(40);
        str += "   ";
        str += row.before.substr(0, 49).padEnd(50);
        str += "     ";
        str += row.after.substr(0, 49).padEnd(50);
        str += " \n";
    }
    str += "   \n";

    return str;
}


module.exports = {
    "productAsTable": productAsTable,
    "orderAsTable": orderAsTable,
    "inventoryAsTable": inventoryAsTable,
    "categoriesAsTable": categoriesAsTable,
    "shelfsAsTable": shelfsAsTable,
    "picklistAsTable": picklistAsTable,
    "logProductsAsTable": logProductsAsTable,
};
