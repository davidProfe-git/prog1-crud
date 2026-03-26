const model = require('../models/maquillaje')

class maquillajeController{

    static async obtenermaquillaje(response){
        let maquillaje = await model.consultarmaquillaje()
        response.json({
            data: maquillaje
        })
    }

    
    static async obtenercategorias(response){
        let categorias = await model.consultarcategorias()
        response.json({
            data: categorias
        })
    }

    static async obtenerpublicaciones(response){
        let publicaciones = await model.consultarpublicaciones()
        response.json({
            data: publicaciones
        })
    }

    static async obtenerusuarios(response){
        let usuarios = await model.consultarusuarios()
        response.json({
            data: usuarios
        })
    }

    static async obtenercomentarios(response){
        let comentarios = await model.consultarcomentarios()
        response.json({
            data: comentarios
        })
    }
}


module.exports = maquillajeController;