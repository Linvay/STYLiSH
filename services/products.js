const db = require("./db");
const mysql = require("mysql2/promise")
const helper = require("../helper");

require("dotenv").config();

async function getAll(page = 0) {
    /* Query data of current page */
    const offset = helper.getOffset(page, process.env.LIST_PER_PAGE);
    let rows = await db.query(`
        SELECT * 
        FROM product
        LIMIT ${offset}, ?
    `, [(process.env.LIST_PER_PAGE + 1).toString()]);
    const data = helper.emptyOrRows(rows);

    for (item of data) {
        rows = await db.query(`
            SELECT var_id, color, size, stock, img_src
            FROM variant
            WHERE prod_id = ?
        `, [item.prod_id]);
        let var_data = helper.emptyOrRows(rows);
        item["variants"] = var_data;
    }

    /* Check if next page is empty */
    if (data.length == process.env.LIST_PER_PAGE + 1) {
        data.pop();
        return {data, next_paging: parseInt(page) + 1};
    }
    else {
        return {data};
    }
}

async function getAllByCategory(page = 0, category) {
    const offset = helper.getOffset(page, process.env.LIST_PER_PAGE);
    let rows = await db.query(`
        SELECT *
        FROM product
        WHERE category = ?
        LIMIT ${offset}, ?
    `, [category, (process.env.LIST_PER_PAGE + 1).toString()]);
    const data = helper.emptyOrRows(rows);

    for (item of data) {
        rows = await db.query(`
            SELECT var_id, color, size, stock, img_src
            FROM variant
            WHERE prod_id = ?
        `, [item.prod_id]);
        let var_data = helper.emptyOrRows(rows);
        item["variants"] = var_data;
    }

    /* Check if next page is empty */
    if (data.length == process.env.LIST_PER_PAGE + 1) {
        data.pop();
        return {data, next_paging: parseInt(page) + 1};
    }
    else {
        return {data};
    }
}

async function getAllByKeyword(page = 0, keyword) {
    const offset = helper.getOffset(page, process.env.LIST_PER_PAGE);
    let rows = await db.query(`
        SELECT *
        FROM product
        WHERE name LIKE CONCAT('%', ?, '%')
        LIMIT ${offset}, ?`
    , [keyword, (process.env.LIST_PER_PAGE + 1).toString()]);
    const data = helper.emptyOrRows(rows);

    for (item of data) {
        rows = await db.query(`
            SELECT var_id, color, size, stock, img_src
            FROM variant
            WHERE prod_id = ?
        `, [item.prod_id]);
        let var_data = helper.emptyOrRows(rows);
        item["variants"] = var_data;
    }
    
    /* Check if next page is empty */
    if (data.length == process.env.LIST_PER_PAGE + 1) {
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
        SELECT var_id, color, size, stock, img_src
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
    `, [description.des_id]);
    const des_img = helper.emptyOrRows(rows);
    description["des_img"] = des_img.map(item => item.img_src);

    return {
        product, 
        variant: variant,
        description: description,
    }
}

async function insert(body, files) {
    const connection = await db.getConnection();
    await connection.beginTransaction();
    try {
        let result = await connection.query(`
                INSERT INTO product
                (name, price, category)
                VALUE
                (?, ?, ?)
            `, [body.prod_name, body.prod_price, body.prod_category]);
        const prod_id = result[0].insertId;
        
        for (let i = 0; i < parseInt(body.var_cnt, 10); ++i) {
            result = await connection.query(`
                INSERT INTO variant
                (prod_id, color, size, stock, img_src)
                VALUE
                (?, ?, ?, ?, ?)
            `, [prod_id, body.var_color[i], body.var_size[i], body.var_stock[i], files.var_img[i].path]);
        }
        
        result = await connection.query(`
            INSERT INTO description
            (prod_id, main, extra)
            VALUE
            (?, ?, ?)
        `, [prod_id, body.des_main, body.des_extra]);
        const des_id = result[0].insertId;
        
        if (files.des_img && files.des_img.length > 0) {
            for (let i = 0; i < files.des_img.length; ++i) {
                result = await connection.query(`
                    INSERT INTO des_img
                    (des_id, img_src)
                    VALUE
                    (?, ?)
                `, [des_id, files.des_img[i].path]);
            }
        }

        await connection.commit();
        const message = "Product inserted successfully";
        return {message: message, prod_id: prod_id};
    } 
    catch (err) {
        await connection.rollback();
        return err;
    }
}

module.exports = {
    getAll,
    getAllByCategory,
    getAllByKeyword,
    getDetailByID,
    insert
}