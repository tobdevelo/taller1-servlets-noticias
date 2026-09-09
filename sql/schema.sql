CREATE DATABASE IF NOT EXISTS bd_noticias;
USE bd_noticias;

CREATE TABLE IF NOT EXISTS usuarios (
    id VARCHAR(50) PRIMARY KEY,
    clave VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS noticias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    pais VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    periodista VARCHAR(100) NOT NULL,
    programaEmite VARCHAR(100) NOT NULL,
    fechaEmision DATE NOT NULL,
    descripcion TEXT NOT NULL,
    nivelPublico VARCHAR(30) NOT NULL
);

INSERT INTO usuarios (id, clave, nombre, rol) VALUES
('admin', '12345', 'Administrador', 'Administrador'),
('editor1', '12345', 'Carlos Perez', 'Editor');

INSERT INTO noticias (categoria, fecha, pais, departamento, ciudad, periodista, programaEmite, fechaEmision, descripcion, nivelPublico) VALUES
('Tecnologia', '2026-03-01', 'Colombia', 'Bolivar', 'Cartagena', 'Carlos Perez', 'Noticiero Central', '2026-03-01', 'Primera noticia de prueba', 'General');
