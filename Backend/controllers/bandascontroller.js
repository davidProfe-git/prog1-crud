const model = require('../models/Rockmodel')

class BandasController{

    static async obtenerbanda(response){
        let banda = await model.consultarbanda()
        response.json({
            data: banda
        })
    }

        static async obteneralbumes(response){
        let albumes = await model.consultaralbumes()
        response.json({
            data: albumes
        })
    }

            static async obtenercanciones(response){
        let canciones = await model.consultarcanciones()
        response.json({
            data: canciones
        })
    }

                static async obtenermiembros(response){
        let miembros = await model.consultarmiembros()
        response.json({
            data: miembros
        })
    }
}

module.exports = BandasController