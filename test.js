const mysql = require("mysql2");
const config = require("./config");

if (mysql.createConnection(config)) {
    console.log("Success");
}