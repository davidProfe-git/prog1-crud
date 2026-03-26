const model = require('../models/peliculasmodel')

class RecetaController{

    static async obtenerpeliculas(response){
        let peliculas = await model.consultarPeliculas()
        response.json({
            data: peliculas
        })
    }
}


module.exports = RecetaController;
