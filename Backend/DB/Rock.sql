-- Crear base de datos
CREATE DATABASE IF NOT EXISTS bandas_rock_db;

-- Usar la base de datos
USE bandas_rock_db;

-- Eliminar tablas si ya existen (evita errores al ejecutar varias veces)
DROP TABLE IF EXISTS Canciones;
DROP TABLE IF EXISTS Albumes;
DROP TABLE IF EXISTS Miembros;
DROP TABLE IF EXISTS Bandas;

-- Tabla de Bandas
CREATE TABLE Bandas (
    id_banda INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100),
    anio_formacion INT,
    genero VARCHAR(100)
);

-- Tabla de Miembros
CREATE TABLE Miembros (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    instrumento VARCHAR(100),
    id_banda INT,
    FOREIGN KEY (id_banda) REFERENCES Bandas(id_banda)
);

-- Tabla de Álbumes
CREATE TABLE Albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_lanzamiento INT,
    id_banda INT,
    FOREIGN KEY (id_banda) REFERENCES Bandas(id_banda)
);

-- Tabla de Canciones
CREATE TABLE Canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    duracion TIME,
    id_album INT,
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album)
);

-- Insertar Bandas
INSERT INTO Bandas (nombre, pais, anio_formacion, genero) VALUES
('Queen', 'Reino Unido', 1970, 'Rock'),
('Nirvana', 'Estados Unidos', 1987, 'Grunge'),
('The Rolling Stones', 'Reino Unido', 1962, 'Rock'),
('Metallica', 'Estados Unidos', 1981, 'Heavy Metal');

-- Insertar Miembros
INSERT INTO Miembros (nombre, instrumento, id_banda) VALUES
('Freddie Mercury', 'Voz/Piano', 1),
('Brian May', 'Guitarra', 1),
('Kurt Cobain', 'Voz/Guitarra', 2),
('Krist Novoselic', 'Bajo', 2),
('Mick Jagger', 'Voz', 3),
('James Hetfield', 'Guitarra/Voz', 4);

-- Insertar Álbumes
INSERT INTO Albumes (titulo, anio_lanzamiento, id_banda) VALUES
('A Night at the Opera', 1975, 1),
('Nevermind', 1991, 2),
('Sticky Fingers', 1971, 3),
('Master of Puppets', 1986, 4);

-- Insertar Canciones
INSERT INTO Canciones (titulo, duracion, id_album) VALUES
('Bohemian Rhapsody', '00:05:55', 1),
('Smells Like Teen Spirit', '00:05:01', 2),
('Brown Sugar', '00:03:49', 3),
('Master of Puppets', '00:08:35', 4);