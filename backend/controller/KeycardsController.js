const model = require('../models/KeycardsModel')

class KeycardController{

    static async obtenerKeycard(response){
        let keycard = await model.consultarKeycard()
        response.json({
            data: keycard
        })
    }
}


module.exports = KeycardsController;