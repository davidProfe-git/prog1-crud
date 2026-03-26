// Model -> comunicarse con la base de datos
// View -> interfaz grafica con la que interactura el usario
// Controller -> comunicar vista con modelo, logica de negocio
const db = require("../db/conexiondb")

class peliculasModel{

    static async consultarPeliculas(){
        let peliculas = await db.query('SELECT * FROM peliculas')
        return peliculas
    }


}

module.exports = peliculasModel