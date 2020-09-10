
/**
 * Print to table.
 * @param {RowDataPacket}
 * @returns {string}
 */
function orderAsTable(order) {
    let str;

    /* eslint-disable */
    str =  " ID     Namn                   Kategori         Info                            \n";
    str += " .....  .......                .............    ..............................            +\n";
    /* eslint-enable */
    for (const row of order) {
        str += "| ";
        str += row.akronym.padEnd(12);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(12);
        str += "| ";
        str += row.lon.toString().padStart(11);
        str += " | ";
        str += row.kompetens.toString().padStart(11);
        str += " | ";
        str += row.fodd.toISOString().slice(0, 10).padStart(15);
        str += " | \n";
    }
    /* eslint-disable */
    str += "+ ----------- + ------------------- + ----------- + ----------- + ----------- + --------------- +\n";
    /* eslint-enable */
    return str;
}

module.exports = {
    "orderAsTable": orderAsTable
};
