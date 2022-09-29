const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function getMultiple(page = 0) {
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(`
        SELECT * 
        FROM product 
        NATURAL JOIN variant
        LIMIT ${offset}, ${config.listPerPage}`
    );
    
    const data = helper.emptyOrRows(rows);
    const meta = {next_paging: parseInt(page) + 1};

    return {
        data,
        meta
    }
}

async function getMultipleWhere(page = 0, category) {
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(`
        SELECT *
        FROM product
        NATURAL JOIN variant
        WHERE category = '${category}'
        LIMIT ${offset}, ${config.listPerPage}
    `);
    const data = helper.emptyOrRows(rows);
    const meta = {next_paging: parseInt(page) + 1};

    return {
        data,
        meta
    }
}

module.exports = {
    getMultiple,
    getMultipleWhere
}