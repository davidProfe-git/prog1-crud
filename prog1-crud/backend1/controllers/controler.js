const model = require('../models/libroModel')

class LibroController{

    static async obtenerLibros(response){
        let libros = await model.consultarLibros()
        response.json({
            data: libros
        })
    }

    static async obtenerautores(response){
        let autores = await model.consultarAutores()
        response.json({
            data: autores
        })
    }

    static async obtenerGeneros(response){                          
        let generos = await model.consultarGeneros()
        response.json({
            data: generos
        })
    }

    static async obtenerReseñas(response){
        let reseñas = await model.consultarReseñas()
        response.json({
            data: reseñas
        })
    }

    static async obtenerFechas(response){   
        let fechas = await model.consultarFechas()
        response.json({
            data: fechas
        })
    }    

}

module.exports = LibroController;