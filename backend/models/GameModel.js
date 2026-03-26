const db = require("../db/conexiondb")

class GameModel {

    static async consultarKeycards() {
        let [rows] = await db.query('SELECT * FROM Blackout_Keycards')
        return rows
    }

    static async consultarMeleeWeapons() {
        let [rows] = await db.query('SELECT * FROM Melee_Weapons')
        return rows
    }

    static async consultarFireWeapons() {
        let [rows] = await db.query('SELECT * FROM Fire_Weapons')
        return rows
    }
}

module.exports = GameModel