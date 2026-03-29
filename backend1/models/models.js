// Model -> comunicarse con la base de datos
// View -> interfaz grafica con la que interactura el usario
// Controller -> comunicar vista con modelo, logica de negocio

const db = require("../db/conexiondb")

class LibroModel{

    static async consultarLibros(){
        let libros = await db.query('SELECT * FROM libros')
        return libros[0]   // mysql2 devuelve [rows, fields]
    }

    // Puedes agregar más métodos después (crear, actualizar, eliminar)
}

module.exports = LibroModel