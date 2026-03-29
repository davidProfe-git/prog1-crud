const model = require('../models/libroModel')

class LibroController{

    static async obtenerLibros(response){
        let libros = await model.consultarLibros()
        response.json({
            data: libros
        })
    }
}

module.exports = LibroController;