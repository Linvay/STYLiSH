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
        WHERE category = ?
        LIMIT ${offset}, ?
    `, [category, (config.listPerPage + 1).toString()]);
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
            WHERE name LIKE CONCAT('%', ?, '%')
        ) AS p
        NATURAL JOIN variant
        LIMIT ${offset}, ?`
    , [keyword, (config.listPerPage + 1).toString()]);
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

async function getDetailByID(prod_id) {
    /* PRODUCT */    
    let rows = await db.query(`
        SELECT *
        FROM product
        WHERE prod_id = ?
    `, [prod_id]);
    const product = helper.emptyOrRows(rows)[0];

    /* VARIANT */
    rows = await db.query(`
        SELECT var_id, color, size, stock
        FROM variant
        WHERE prod_id = ?
    `, [prod_id]);
    const variant = helper.emptyOrRows(rows);

    /* DESCRIPTION */
    rows = await db.query(`
        SELECT des_id, main, extra
        FROM description
        WHERE prod_id = ?
    `, [prod_id]);
    const description = helper.emptyOrRows(rows)[0];

    /* DESCRIPTION IMAGE */
    rows = await db.query(`
        SELECT img_src
        FROM des_img
        WHERE des_id = ?
    `, [parseInt(description.des_id)]);
    const des_img = helper.emptyOrRows(rows);
    description["des_img"] = des_img.map(item => item.img_src);

    return {
        product, 
        variant: variant,
        description: description,
    }
}

module.exports = {
    getMultiple,
    getMultipleWhere,
    getMultipleByKeyword,
    getDetailByID
}