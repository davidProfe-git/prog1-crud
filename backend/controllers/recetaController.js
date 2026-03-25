const model = require('../models/recetaModel')

class RecetaController{

    static async obtenerRecetas(response){
        let receta = await model.consultarReceta()
        response.json({
            data: receta
        })
    }
}


module.exports = RecetaController;