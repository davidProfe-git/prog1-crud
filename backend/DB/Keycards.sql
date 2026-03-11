-- 1️⃣ Crear la base de datos
CREATE DATABASE IF NOT EXISTS BlackoutGame;

-- 2️⃣ Seleccionar la base de datos
USE BlackoutGame;

-- 3️⃣ Crear la tabla Blackout_Keycards
CREATE TABLE IF NOT EXISTS Blackout_Keycards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    usos INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    rareza VARCHAR(50) NOT NULL,
    imagen_url VARCHAR(255) NOT NULL
);

-- 4️⃣ Insertar los datos de las tarjetas
INSERT INTO Blackout_Keycards (nombre, usos, valor, rareza, imagen_url) VALUES
('Blanca', 1, 0.00, 'Comun', 'https://example.com/blanca.png'),
('Morada', 1, 100.00, 'Comun', 'https://example.com/morada.png'),
('Azul', 2, 1500.00, 'Poco Comun', 'https://example.com/azul.png'),
('Verde', 1, 1000.00, 'Raro', 'https://example.com/verde.png'),
('Naranja', 1, 3000.00, 'Epico', 'https://example.com/naranja.png'),
('Roja', 1, 2500.00, 'Legendario', 'https://example.com/roja.png');