const express = require('express')
const aplication = express()

aplication.get('/', (req, res) => {
    res.send('<h1>Hola mundo!</h1>')
})

aplication.get('/saludo', (req, res) => {
    res.json({mensaje: "Mi <b>primera</b> prueba de servidor con Express"})
})

aplication.listen(3000, () => {
    console.log('El servidor se levanto!')
})