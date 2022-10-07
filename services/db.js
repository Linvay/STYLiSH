const mysql = require("mysql2/promise");
require("dotenv").config();

async function getConnection() {
    return await mysql.createConnection({
        host: process.env.HOST,
        port: parseInt(process.env.PORT, 10),
        user: process.env.USER,
        password: process.env.PASSWORD,
        database: process.env.DB,
        charset: process.env.CHARSET
    });
}

async function query(sql, params) {
    const connection = await getConnection();
    const [results, ] = await connection.execute(sql, params);

    return results;
}

module.exports = {
    query,
    getConnection
}