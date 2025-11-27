DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

-- Tabla de usuarios



CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(20) UNIQUE,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(100),
    contrasena VARCHAR(100),
    tipo VARCHAR(20)
);


-- Datos 
INSERT INTO usuarios (rut, nombre, password, rol) VALUES
('11111111-1', 'Ricardo Estudiante', '1234', 'estudiante'),
('22222222-2', 'María Funcionario', '1234', 'funcionario'),
('33333333-3', 'Maria Admin', '1234', 'administrador');

CREATE TABLE cubiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacidad INT,
    piso INT,
    disponibilidad VARCHAR(20),
	tipo VARCHAR(50)
);

-- Cubículos disponibles
INSERT INTO cubiculos (id, capacidad, piso, disponibilidad) VALUES
(1, 2, 1, 'disponible'), (2, 4, 1, 'disponible'), (3, 3, 1, 'disponible'),
(4, 5, 1, 'disponible'), (5, 6, 1, 'disponible'), (6, 7, 1, 'disponible'),
(7, 2, 2, 'disponible'), (8, 3, 2, 'disponible'), (9, 4, 2, 'disponible'),
(10, 5, 2, 'disponible'), (11, 6, 2, 'disponible'), (12, 7, 2, 'disponible'),
(13, 2, 3, 'disponible'), (14, 3, 3, 'disponible'), (15, 4, 3, 'disponible'),
(16, 5, 3, 'disponible'), (17, 6, 3, 'disponible'), (18, 7, 3, 'disponible'),
(19, 2, 4, 'disponible'), (20, 3, 4, 'disponible'), (21, 4, 4, 'disponible'),
(22, 5, 4, 'disponible'), (23, 6, 4, 'disponible'), (24, 7, 4, 'disponible');

-- Tabla de bloques horarios
CREATE TABLE bloques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    letra CHAR(1) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

-- Bloques horarios
INSERT INTO bloques (letra, hora_inicio, hora_fin) VALUES
('A', '08:00:00', '09:40:00'),
('B', '09:55:00', '11:25:00'),
('C', '11:40:00', '13:10:00'),
('D', '14:30:00', '15:50:00'),
('E', '16:15:00', '17:25:00'),
('F', '17:45:00', '19:30:00');

-- Tabla de reservas
CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(12),
    cubiculo_id INT,
    bloque_id INT,
    fecha DATE,
    estado ENUM('activa','cancelada') NOT NULL DEFAULT 'activa',
    FOREIGN KEY (rut) REFERENCES usuarios(rut),
    FOREIGN KEY (cubiculo_id) REFERENCES cubiculos(id),
    FOREIGN KEY (bloque_id) REFERENCES bloques(id)
);

