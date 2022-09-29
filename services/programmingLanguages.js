const db = require("./db");
const helper = require("../helper");
const config = require("../config");

async function getMultiple(page = 0) {
    /* Query data of current page */
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(`
        SELECT * 
        FROM product 
        NATURAL JOIN variant
        LIMIT ${offset}, ${config.listPerPage + 1}`
    );
    const data = helper.emptyOrRows(rows);

    /* Check if next page is empty */
    if (data.length == config.listPerPage + 1) {
        data.pop();
        return {data, next_paging: parseInt(page) + 1};
    }
    else {
        return {data};
    }
}

async function getMultipleWhere(page = 0, category) {
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(`
        SELECT *
        FROM product
        NATURAL JOIN variant
        WHERE category = '${category}'
        LIMIT ${offset}, ${config.listPerPage + 1}
    `);
    const data = helper.emptyOrRows(rows);

    /* Check if next page is empty */
    if (data.length == config.listPerPage + 1) {
        data.pop();
        return {data, next_paging: parseInt(page) + 1};
    }
    else {
        return {data};
    }
}

async function getMultipleByKeyword(page = 0, keyword) {
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(`
        SELECT *
        FROM (
            SELECT *
            FROM product
            WHERE name LIKE '%${keyword}%'
        ) AS p
        NATURAL JOIN variant
        LIMIT ${offset}, ${config.listPerPage + 1}
    `);
    const data = helper.emptyOrRows(rows);
    
    /* Check if next page is empty */
    if (data.length == config.listPerPage + 1) {
        data.pop();
        return {data, next_paging: parseInt(page) + 1};
    }
    else {
        return {data};
    }
}

module.exports = {
    getMultiple,
    getMultipleWhere,
    getMultipleByKeyword
}