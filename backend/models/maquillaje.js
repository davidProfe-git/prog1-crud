// Model -> comunicarse con la base de datos
// View -> interfaz grafica con la que interactura el usario
// Controller -> comunicar vista con modelo, logica de negocio
const db = require("../db/conexiondb")

class maquillaje{

    static async consultarmaquillaje(){
        let maquillaje = await db.query('SELECT * FROM productos')
        return maquillaje
    }
static async consultarcategorias(){
        let categorias = await db.query('SELECT * FROM categorias')
        return categorias
}

static async consultarpublicaciones(){
        let publicaciones = await db.query('SELECT * FROM publicaciones')
        return publicaciones
}

static async consultarusuarios(){
        let usuarios = await db.query('SELECT * FROM usuarios')
        return usuarios
}

static async consultarcomentarios(){
        let comentarios = await db.query('SELECT * FROM comentarios')
        return comentarios
}

}

module.exports = maquillaje