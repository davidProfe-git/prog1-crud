-- =============================================
-- BASE DE DATOS CRUD LIBROS - Prog1 (Fechas separadas)
-- =============================================

CREATE DATABASE IF NOT EXISTS biblioteca_libros;
USE biblioteca_libros;

-- 1. Tabla de Autores
CREATE TABLE IF NOT EXISTS autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE NULL,
    nacionalidad VARCHAR(100) NULL,
    biografia TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla de Géneros
CREATE TABLE IF NOT EXISTS generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre_genero VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabla principal de Libros (sin fecha de publicación)
CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    id_genero INT NOT NULL,
    isbn VARCHAR(20) NULL UNIQUE,
    descripcion TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor) ON DELETE CASCADE,
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero) ON DELETE RESTRICT
);

-- 4. Tabla de Fechas de Publicación (APARTE)
CREATE TABLE IF NOT EXISTS fechas_publicacion (
    id_fecha INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    fecha_publicacion DATE NOT NULL,           -- Fecha exacta de publicación
    anio_publicacion INT NOT NULL,             -- Año solo (para búsquedas fáciles)
    lugar_publicacion VARCHAR(150) NULL,       -- Ciudad o país donde se publicó
    editorial VARCHAR(150) NULL,
    edicion INT NULL DEFAULT 1,                -- Número de edición
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_libro) REFERENCES libros(id) ON DELETE CASCADE
);

-- 5. Tabla de Reseñas (se mantiene igual)
CREATE TABLE IF NOT EXISTS reseñas (
    id_reseña INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    nombre_usuario VARCHAR(100) NOT NULL,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT NULL,
    fecha_reseña DATE DEFAULT (CURRENT_DATE),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_libro) REFERENCES libros(id) ON DELETE CASCADE
);

-- =============================================
-- DATOS DE EJEMPLO
-- =============================================

-- Autores
INSERT INTO autores (nombre, apellido, fecha_nacimiento, nacionalidad) VALUES
('Gabriel', 'García Márquez', '1927-03-06', 'Colombiana'),
('Antoine', 'de Saint-Exupéry', '1900-06-29', 'Francesa'),
('George', 'Orwell', '1903-06-25', 'Británica'),
('Miguel', 'de Cervantes', '1547-09-29', 'Española');

-- Géneros
INSERT INTO generos (nombre_genero, descripcion) VALUES
('Realismo mágico', 'Estilo literario que combina realidad y fantasía'),
('Fábula', 'Historia con moraleja'),
('Distopía', 'Sociedad imaginaria negativa'),
('Novela clásica', 'Obras importantes de la literatura universal');

-- Libros (sin fecha)
INSERT INTO libros (titulo, id_autor, id_genero, isbn, descripcion) VALUES
('Cien años de soledad', 1, 1, '978-8437604947', 'La historia de la familia Buendía en Macondo'),
('El principito', 2, 2, '978-0156012195', 'Un pequeño príncipe viaja por el universo'),
('1984', 3, 3, '978-0451524935', 'Una distopía sobre vigilancia totalitaria'),
('Don Quijote de la Mancha', 4, 4, '978-0142437230', 'Las aventuras del ingenioso hidalgo Don Quijote');

-- Fechas de Publicación (tabla aparte)
INSERT INTO fechas_publicacion (id_libro, fecha_publicacion, anio_publicacion, lugar_publicacion, editorial, edicion) VALUES
(1, '1967-05-30', 1967, 'Buenos Aires', 'Editorial Sudamericana', 1),
(2, '1943-04-06', 1943, 'Nueva York', 'Reynal & Hitchcock', 1),
(3, '1949-06-08', 1949, 'Londres', 'Secker & Warburg', 1),
(4, '1605-01-16', 1605, 'Madrid', 'Juan de la Cuesta', 1);

-- Reseñas de ejemplo
INSERT INTO reseñas (id_libro, nombre_usuario, puntuacion, comentario) VALUES
(1, 'Steven', 5, 'Una obra maestra de la literatura latinoamericana'),
(2, 'Laura', 4, 'Hermoso y lleno de enseñanzas'),
(3, 'Carlos', 5, 'Impactante y muy actual'),
(4, 'Ana', 5, 'Clásico imprescindible');