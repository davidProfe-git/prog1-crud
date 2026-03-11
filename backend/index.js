const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();

// Configurar carpeta pública
app.use(express.static(path.join(__dirname, 'public')));

// Conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'Andres',       // Cambia por tu usuario
  password: 'Andres1', // Cambia por tu contraseña
  database: 'BlackoutGame'   // La base de datos que creamos antes
});

// Ruta API para obtener tarjetas
app.get('/api/keycards', (req, res) => {
  connection.query('SELECT * FROM Blackout_Keycards', (err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});

// Servir HTML principal
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Iniciar servidor
const PORT = 3306;
app.listen(PORT, () => console.log(`Servidor corriendo en http://localhost:${PORT}`));