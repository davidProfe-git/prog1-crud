const express = require('express')
const path = require('path')
const app = express()

const GameController = require('./controllers/GameController')

// Sirve el frontend desde la carpeta correcta
app.use(express.static(path.join(__dirname, '../frontend')))

app.get('/keycards', GameController.obtenerKeycards)
app.get('/melee', GameController.obtenerMeleeWeapons)
app.get('/fire', GameController.obtenerFireWeapons)

const PORT = 3000
app.listen(PORT, () => console.log(`Servidor corriendo en http://localhost:${PORT}`))