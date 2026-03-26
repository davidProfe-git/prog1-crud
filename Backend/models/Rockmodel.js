
const db = require("../db/conexiondb")

class RockModel{

    static async consultarbanda(){
        let banda = await db.query('SELECT * FROM bandas LIMIT 100')
        return banda
    }

        static async consultaralbumes(){
        let albumes = await db.query('SELECT * FROM albumes LIMIT 100')
        return albumes
    }

            static async consultarcanciones(){
        let canciones = await db.query('SELECT * FROM canciones LIMIT 100')
        return canciones
    }

                static async consultarmiembros(){
        let miembros = await db.query('SELECT * FROM miembros LIMIT 100')
        return miembros
    }

}

module.exports = RockModel