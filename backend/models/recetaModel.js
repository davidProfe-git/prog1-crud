// Model -> comunicarse con la base de datos
// View -> interfaz grafica con la que interactura el usario
// Controller -> comunicar vista con modelo, logica de negocio
const db = require("../db/conexiondb")

class RecetaModel{

    static async consultarReceta(){
        let receta = await db.query('SELECT * FROM recetas where id = 4')
        return receta
    }


}

module.exports = RecetaModel