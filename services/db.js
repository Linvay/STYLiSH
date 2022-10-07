const mysql = require("mysql2/promise");
require("dotenv").config();

async function getConnection() {
    return await mysql.createConnection({
        host: process.env.DB_HOST,
        port: parseInt(process.env.DB_PORT, 10),
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_DB,
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