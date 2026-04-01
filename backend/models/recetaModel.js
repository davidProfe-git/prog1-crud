// Model -> comunicarse con la base de datos
// View -> interfaz grafica con la que interactura el usario
// Controller -> comunicar vista con modelo, logica de negocio
const db = require("../db/conexiondb")

class RecetaModel{

    static async consultarReceta(){
        let [recetas] = await db.query('SELECT * FROM recetas')
        return recetas
    }


}

module.exports = RecetaModel