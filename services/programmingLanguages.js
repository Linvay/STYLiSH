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
        LIMIT ${offset}, ${config.listPerPage}`
    );
    const data = helper.emptyOrRows(rows);

    /* Check if next page is empty */
    const last_id = data[data.length - 1].id
    const next_data = await db.query(`
        select count(*) as cnt
        from product
        natural join variant
        where id > ${last_id}
    `);

    if (next_data[0].cnt > 0) {
        const meta = {next_paging: parseInt(page) + 1};
        return {data, meta};
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
        LIMIT ${offset}, ${config.listPerPage}
    `);
    const data = helper.emptyOrRows(rows);

    /* Check if next page is empty */
    const last_id = data[data.length - 1].id
    const next_data = await db.query(`
        select count(*) as cnt
        from product
        natural join variant
        where category = '${category}' and id > ${last_id}
    `);

    if (next_data[0].cnt > 0) {
        const meta = {next_paging: parseInt(page) + 1};
        return {data, meta};
    }
    else {
        return {data};
    }
}

module.exports = {
    getMultiple,
    getMultipleWhere
}