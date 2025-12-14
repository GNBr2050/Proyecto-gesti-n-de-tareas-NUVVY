CREATE DATABASE IF NOT EXISTS sistema_tareas;
USE sistema_tareas;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS tareas;
DROP TABLE IF EXISTS usuarios;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE usuarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(120) NOT NULL,
  password_hash varchar(255) NOT NULL,
  rol enum('admin','estudiante') DEFAULT 'estudiante',
  creado_en timestamp NOT NULL DEFAULT current_timestamp(),
  avatar varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email (email)
);

CREATE TABLE tareas (
  id int(11) NOT NULL AUTO_INCREMENT,
  usuario_id int(11) NOT NULL,
  titulo varchar(200) NOT NULL,
  hecho tinyint(1) DEFAULT 0,
  creado_en timestamp NOT NULL DEFAULT current_timestamp(),
  estado enum('pendiente','en_progreso','completada') DEFAULT 'pendiente',
  fecha_limite datetime DEFAULT NULL,
  descripcion text DEFAULT NULL,
  archivado tinyint(1) DEFAULT 0,
  PRIMARY KEY (id),
  KEY idx_tareas_usuario (usuario_id),
  CONSTRAINT tareas_ibfk_1 FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE
);

INSERT INTO usuarios (id, email, password_hash, rol) VALUES
(1, 'admin@ucss.edu.pe', 'scrypt:32768:8:1$THmZ75zhIaXFqHEL$0da115f028187c2d359f8fb22b4c585623311a753a853e849dacdef2760ed7162c8df414763749043de0e04c55d057ec1d0569dcb8ad6327c55ce93c600c6121', 'admin');