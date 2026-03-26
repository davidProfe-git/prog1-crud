const express = require('express')
const app = express()

const GameController = require('./controllers/GameController')

app.get('/keycards', GameController.obtenerKeycards)
app.get('/melee', GameController.obtenerMeleeWeapons)
app.get('/fire', GameController.obtenerFireWeapons)

const PORT = 3000
app.listen(PORT, () => console.log(`Servidor corriendo en http://localhost:${PORT}`))