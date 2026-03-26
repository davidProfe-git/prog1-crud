const model = require('../models/peliculasmodel')

class RecetaController{

    static async obtenerpeliculas(response){
        let peliculas = await model.consultarPeliculas()
        response.json({
            data: peliculas
        })
    }
    static async obtenerreviews(response){
        let peliculas = await model.consultarreviews()
        response.json({
            data: peliculas
        })
}
static async obtenercomentarios(response){
        let peliculas = await model.consultarcomentarios()
        response.json({
            data: peliculas
        })
}
static async obtenerfavoritos(response){
        let peliculas = await model.consultarfavoritos()
        response.json({
            data: peliculas
        })
}
}



module.exports = RecetaController;
