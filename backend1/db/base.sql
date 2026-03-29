CREATE DATABASE IF NOT EXISTS biblioteca_libros;
USE biblioteca_libros;

CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    genero VARCHAR(100),
    anio_publicacion INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Algunos datos de ejemplo
INSERT INTO libros (titulo, autor, genero, anio_publicacion) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967),
('El principito', 'Antoine de Saint-Exupéry', 'Fábula', 1943),
('1984', 'George Orwell', 'Distopía', 1949),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela', 1605);