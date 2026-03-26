USE BlackoutGame;

-- Tabla Melee Weapons
CREATE TABLE IF NOT EXISTS Melee_Weapons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    daño DECIMAL(10,2) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    rareza VARCHAR(50) NOT NULL,
    imagen_url VARCHAR(255) NOT NULL
);

INSERT INTO Melee_Weapons (nombre, daño, valor, rareza, imagen_url) VALUES
('Cuchillo de Trinchera', 35.00, 500.00, 'Comun', 'https://example.com/cuchillo_trinchera.png'),
('Cuchillo Tactico', 40.00, 750.00, 'Comun', 'https://example.com/cuchillo_tactico.png'),
('Tomahawk', 55.00, 1200.00, 'Poco Comun', 'https://example.com/tomahawk.png'),
('Bate', 45.00, 300.00, 'Comun', 'https://example.com/bate.png'),
('Katana', 80.00, 3500.00, 'Raro', 'https://example.com/katana.png'),
('Lanza', 70.00, 2000.00, 'Poco Comun', 'https://example.com/lanza.png'),
('Martillo', 60.00, 900.00, 'Poco Comun', 'https://example.com/martillo.png'),
('Gran Hacha', 90.00, 4000.00, 'Raro', 'https://example.com/gran_hacha.png'),
('Gran Espada', 110.00, 6000.00, 'Epico', 'https://example.com/gran_espada.png'),
('GameBreaker', 150.00, 12000.00, 'Legendario', 'https://example.com/gamebreaker.png'),
('Hoja de Fotones', 200.00, 20000.00, 'Legendario', 'https://example.com/hoja_fotones.png');

-- Tabla Fire Weapons
CREATE TABLE IF NOT EXISTS Fire_Weapons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    daño DECIMAL(10,2) NOT NULL,
    capacidad_municion INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    rareza VARCHAR(50) NOT NULL,
    imagen_url VARCHAR(255) NOT NULL
);

INSERT INTO Fire_Weapons (nombre, daño, capacidad_municion, valor, rareza, imagen_url) VALUES
('G17', 30.00, 17, 1500.00, 'Comun', 'https://example.com/g17.png'),
('G18', 28.00, 33, 2000.00, 'Poco Comun', 'https://example.com/g18.png'),
('M1911', 45.00, 7, 1800.00, 'Comun', 'https://example.com/m1911.png'),
('Galil-11', 55.00, 35, 4500.00, 'Poco Comun', 'https://example.com/galil11.png'),
('M4A1', 60.00, 30, 6000.00, 'Raro', 'https://example.com/m4a1.png'),
('AK-47', 65.00, 30, 5500.00, 'Raro', 'https://example.com/ak47.png'),
('Spas-12', 90.00, 8, 4000.00, 'Poco Comun', 'https://example.com/spas12.png'),
('Mag-500', 95.00, 5, 3500.00, 'Poco Comun', 'https://example.com/mag500.png'),
('Tac-14', 85.00, 6, 3000.00, 'Comun', 'https://example.com/tac14.png'),
('M24', 120.00, 5, 9000.00, 'Epico', 'https://example.com/m24.png'),
('AWM', 150.00, 5, 15000.00, 'Legendario', 'https://example.com/awm.png'),
('GL-06', 200.00, 6, 18000.00, 'Legendario', 'https://example.com/gl06.png');