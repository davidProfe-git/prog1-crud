const mysql = require('mysql2')

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    port: 3306,
    database: 'bandas_rock_db',
})


module.exports = pool.promise()