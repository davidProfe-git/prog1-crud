const GameModel = require('../models/GameModel')

class GameController {

    static async obtenerKeycards(req, res) {
        try {
            let keycards = await GameModel.consultarKeycards()
            res.json({ data: keycards })
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: error.message })
        }
    }

    static async obtenerMeleeWeapons(req, res) {
        try {
            let weapons = await GameModel.consultarMeleeWeapons()
            res.json({ data: weapons })
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: error.message })
        }
    }

    static async obtenerFireWeapons(req, res) {
        try {
            let weapons = await GameModel.consultarFireWeapons()
            res.json({ data: weapons })
        } catch (error) {
            console.error(error)
            res.status(500).json({ error: error.message })
        }
    }
}

module.exports = GameController