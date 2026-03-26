-- Crear base de datos
CREATE DATABASE IF NOT EXISTS blog_maquillaje;
USE blog_maquillaje;

-- ======================
-- TABLAS
-- ======================

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE publicaciones (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    contenido TEXT NOT NULL,
    id_usuario INT,
    id_categoria INT,
    fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT NOT NULL,
    id_usuario INT,
    id_publicacion INT,
    fecha_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id_publicacion)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    marca VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    enlace_compra VARCHAR(255)
);

CREATE TABLE publicaciones_productos (
    id_publicacion INT,
    id_producto INT,
    PRIMARY KEY (id_publicacion, id_producto),
    FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id_publicacion),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ======================
-- INSERTS (10 DATOS)
-- ======================

-- Usuarios
INSERT INTO usuarios (nombre, email, contraseña) VALUES
('Ana López', 'ana@mail.com', '123456'),
('María Gómez', 'maria@mail.com', '123456'),
('Laura Pérez', 'laura@mail.com', '123456'),
('Sofía Torres', 'sofia@mail.com', '123456'),
('Valentina Ruiz', 'vale@mail.com', '123456'),
('Camila Díaz', 'camila@mail.com', '123456'),
('Daniela Castro', 'daniela@mail.com', '123456'),
('Paula Herrera', 'paula@mail.com', '123456'),
('Juliana Rojas', 'juliana@mail.com', '123456'),
('Carolina Vargas', 'carolina@mail.com', '123456');

-- Categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Skincare', 'Cuidado de la piel'),
('Maquillaje diario', 'Looks naturales'),
('Maquillaje profesional', 'Looks avanzados'),
('Tutoriales', 'Paso a paso'),
('Reseñas', 'Opiniones de productos'),
('Tips', 'Consejos de belleza'),
('Cuidado del cabello', 'Haircare'),
('Tendencias', 'Moda y maquillaje actual'),
('Rutinas', 'Rutinas de belleza'),
('Productos económicos', 'Opciones baratas');

-- Publicaciones
INSERT INTO publicaciones (titulo, contenido, id_usuario, id_categoria) VALUES
('Rutina básica de skincare', 'Contenido ejemplo 1', 1, 1),
('Maquillaje natural en 5 minutos', 'Contenido ejemplo 2', 2, 2),
('Look profesional para eventos', 'Contenido ejemplo 3', 3, 3),
('Tutorial smokey eyes', 'Contenido ejemplo 4', 4, 4),
('Reseña base líquida', 'Contenido ejemplo 5', 5, 5),
('Tips para piel grasa', 'Contenido ejemplo 6', 6, 6),
('Cuidado del cabello seco', 'Contenido ejemplo 7', 7, 7),
('Tendencias 2026 maquillaje', 'Contenido ejemplo 8', 8, 8),
('Rutina nocturna', 'Contenido ejemplo 9', 9, 9),
('Maquillaje económico', 'Contenido ejemplo 10', 10, 10);

-- Comentarios
INSERT INTO comentarios (contenido, id_usuario, id_publicacion) VALUES
('Muy útil!', 2, 1),
('Me encantó', 3, 2),
('Excelente tutorial', 4, 3),
('Lo intentaré', 5, 4),
('Buen producto', 6, 5),
('Gracias por el tip', 7, 6),
('Me sirvió mucho', 8, 7),
('Interesante', 9, 8),
('Gran rutina', 10, 9),
('Lo compraré', 1, 10);

-- Productos
INSERT INTO productos (nombre, marca, descripcion, precio, enlace_compra) VALUES
('Base líquida', 'Maybelline', 'Cobertura media', 45.99, 'http://example.com/1'),
('Labial matte', 'MAC', 'Color rojo intenso', 89.99, 'http://example.com/2'),
('Corrector', 'L’Oreal', 'Alta cobertura', 39.99, 'http://example.com/3'),
('Polvo compacto', 'Revlon', 'Acabado mate', 29.99, 'http://example.com/4'),
('Máscara de pestañas', 'Maybelline', 'Volumen extremo', 35.99, 'http://example.com/5'),
('Delineador', 'NYX', 'Negro intenso', 25.99, 'http://example.com/6'),
('Paleta de sombras', 'Huda Beauty', '12 colores', 120.00, 'http://example.com/7'),
('Rubor', 'Rare Beauty', 'Acabado natural', 95.50, 'http://example.com/8'),
('Iluminador', 'Fenty Beauty', 'Brillo intenso', 110.00, 'http://example.com/9'),
('Primer', 'Benefit', 'Minimiza poros', 80.00, 'http://example.com/10');

-- Relación publicaciones-productos
INSERT INTO publicaciones_productos (id_publicacion, id_producto) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);