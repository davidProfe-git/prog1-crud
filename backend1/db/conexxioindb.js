const mysql = require('mysql2')

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '1234',      // cámbialo por tu contraseña
    port: 3308,            // cámbialo si usas otro puerto
    database: 'biblioteca_libros'   // nombre de la nueva base de datos
})

module.exports = pool.promise()