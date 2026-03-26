-- Crear base de datos
CREATE DATABASE blog_peliculas;
USE blog_peliculas;

-- Tabla de usuarios
CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de categorías (géneros)
CREATE TABLE categorias (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- Tabla de películas
CREATE TABLE peliculas (
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
descripcion TEXT,
fecha_estreno DATE,
director VARCHAR(150),
imagen_url VARCHAR(255),
id_categoria INT,
FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Tabla de reseñas (posts del blog)
CREATE TABLE resenas (
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
contenido TEXT NOT NULL,
calificacion DECIMAL(2,1), -- Ej: 8.5
fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_usuario INT,
id_pelicula INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

-- Tabla de comentarios
CREATE TABLE comentarios (
id INT AUTO_INCREMENT PRIMARY KEY,
contenido TEXT NOT NULL,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_usuario INT,
id_resena INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_resena) REFERENCES resenas(id)
);

-- Tabla de favoritos (usuarios guardan películas)
CREATE TABLE favoritos (
id_usuario INT,
id_pelicula INT,
PRIMARY KEY (id_usuario, id_pelicula),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

-- CATEGORIAS (10)
INSERT INTO categorias (id, nombre) VALUES
(1,'Acción'),
(2,'Comedia'),
(3,'Drama'),
(4,'Ciencia Ficción'),
(5,'Terror'),
(6,'Romance'),
(7,'Aventura'),
(8,'Animación'),
(9,'Suspenso'),
(10,'Fantasía');

-- USUARIOS (10)
INSERT INTO usuarios (id, nombre, email, password) VALUES
(1,'Juan Pérez','[juan@email.com](mailto:juan@email.com)','123'),
(2,'Ana Gómez','[ana@email.com](mailto:ana@email.com)','123'),
(3,'Carlos Ruiz','[carlos@email.com](mailto:carlos@email.com)','123'),
(4,'Laura Díaz','[laura@email.com](mailto:laura@email.com)','123'),
(5,'Pedro López','[pedro@email.com](mailto:pedro@email.com)','123'),
(6,'Sofía Torres','[sofia@email.com](mailto:sofia@email.com)','123'),
(7,'Miguel Castro','[miguel@email.com](mailto:miguel@email.com)','123'),
(8,'Valentina Rojas','[vale@email.com](mailto:vale@email.com)','123'),
(9,'Andrés Silva','[andres@email.com](mailto:andres@email.com)','123'),
(10,'Camila Moreno','[camila@email.com](mailto:camila@email.com)','123');

-- PELICULAS (10)
INSERT INTO peliculas (id, titulo, descripcion, fecha_estreno, director, imagen_url, id_categoria) VALUES
(1,'Inception','Sueños dentro de sueños','2010-07-16','Christopher Nolan','img1.jpg',4),
(2,'Titanic','Amor en el mar','1997-12-19','James Cameron','img2.jpg',6),
(3,'The Dark Knight','Batman vs Joker','2008-07-18','Christopher Nolan','img3.jpg',1),
(4,'Avengers Endgame','Batalla final','2019-04-26','Russo Brothers','img4.jpg',7),
(5,'The Conjuring','Caso paranormal','2013-07-19','James Wan','img5.jpg',5),
(6,'Interstellar','Viaje espacial','2014-11-07','Christopher Nolan','img6.jpg',4),
(7,'Joker','Origen del villano','2019-10-04','Todd Phillips','img7.jpg',3),
(8,'Deadpool','Antiheroe divertido','2016-02-12','Tim Miller','img8.jpg',2),
(9,'Get Out','Terror psicológico','2017-02-24','Jordan Peele','img9.jpg',9),
(10,'The Matrix','Realidad simulada','1999-03-31','Wachowski','img10.jpg',4);

-- RESEÑAS (10)
INSERT INTO resenas (id, titulo, contenido, calificacion, id_usuario, id_pelicula) VALUES
(1,'Increíble','Muy buena película',9.0,1,1),
(2,'Emotiva','Me hizo llorar',8.5,2,2),
(3,'Acción pura','Excelente Joker',9.5,3,3),
(4,'Épica','Gran final',9.0,4,4),
(5,'Aterradora','Mucho miedo',8.0,5,5),
(6,'Interesante','Muy profunda',9.2,6,6),
(7,'Impactante','Gran actuación',8.8,7,7),
(8,'Divertida','Muy graciosa',8.3,8,8),
(9,'Tensión total','Muy inquietante',8.7,9,9),
(10,'Clásica','Muy innovadora',9.4,10,10);

-- COMENTARIOS (10)
INSERT INTO comentarios (id, contenido, id_usuario, id_resena) VALUES
(1,'Totalmente de acuerdo',2,1),
(2,'No me gustó tanto',3,2),
(3,'Excelente crítica',4,3),
(4,'Muy buena opinión',5,4),
(5,'Coincido contigo',6,5),
(6,'Gran reseña',7,6),
(7,'Buen punto',8,7),
(8,'Interesante',9,8),
(9,'Muy cierto',10,9),
(10,'Buen análisis',1,10);

-- FAVORITOS (10)
INSERT INTO favoritos (id_usuario, id_pelicula) VALUES
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

