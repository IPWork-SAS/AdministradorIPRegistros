DROP DATABASE IF EXISTS registro;
CREATE DATABASE registro;
USE registro;

DROP TABLE IF EXISTS eventos;
CREATE TABLE eventos (
    id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(255),
	fecha_inicial DATETIME NOT NULL,
	fecha_final DATETIME NOT NULL,
	evento_tabla VARCHAR(100) NOT NULL	
);
DROP TABLE IF EXISTS diccionario;
CREATE TABLE diccionario (
	id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre_columna VARCHAR(100) NOT NULL,
	alias_columna VARCHAR(100) NOT NULL
);

INSERT INTO diccionario (nombre_columna,alias_columna) VALUES ('nombre', 'Nombre'), ('descripcion', 'Descripción'), ('fecha_inicial', 'Fecha Inicial'), ('fecha_final', 'Fecha Final'), ('evento_tabla', 'Tabla'), ('fecha_creacion', 'Fecha Registro'),('nombre', 'Nombre'), ('apellidos', 'Apellido'), ('numero_documento', 'Numero Documento'),('correo_electronico','Correo'),('numero_celular', 'Número Contacto'), ('escarapela', '¿Tiene Escarapela?'),('cantidad_impresos','Cantidad Impresos'), ('categoria', 'Categoria'), ('sub_categoria', 'Sub Categoria');

DROP TABLE IF EXISTS categorias;
create table categorias(
    id int AUTO_INCREMENT,
    nombre_categoria varchar(100),
    PRIMARY KEY(id)
);
insert into categorias (nombre_categoria) VALUES('Expositor'),('Visitante'),('Estudiante'),('Staff');

DROP TABLE IF EXISTS sub_categorias;
CREATE TABLE sub_categorias(
	id int AUTO_INCREMENT,
	nombre_sub_categoria varchar(100),
	id_categoria int,
 	PRIMARY KEY(id)
);

insert into sub_categorias (nombre_sub_categoria) VALUES 
('Subcategoria1'),
('Subcategoria2'),
('Subcategoria3'),
('Subcategoria4'),
('Subcategoria5'),
('Subcategoria6'),
('Subcategoria7'),
('Subcategoria8');

DROP TABLE IF EXISTS log_impresiones;
CREATE TABLE log_impresiones(
	id int AUTO_INCREMENT,
	fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_usuario int,
 	PRIMARY KEY(id)
);

DROP TABLE IF EXISTS log_validadores;
CREATE TABLE log_validadores(
	id int AUTO_INCREMENT,
	id_evento int,
	fecha_validacion DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_usuario_validador int,
	numero_documento varchar(100),
	sub_categoria varchar(100),
	estado_validacion tinyint,
 	PRIMARY KEY(id)
);

DROP TABLE IF EXISTS sub_categorias_usuario;
CREATE TABLE sub_categorias_usuario(
	id int AUTO_INCREMENT,
	id_usuario int,
	id_sub_categoria int,
 	PRIMARY KEY(id)
);

DROP TABLE IF EXISTS files_campania;
CREATE TABLE files_campania (
	id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	id_campania INT(10) UNSIGNED NOT NULL,
	id_tipo_archivo_multimedia INT(10) UNSIGNED NOT NULL,
	nombre VARCHAR(255) NOT NULL DEFAULT 'Untitled.txt',
	mime VARCHAR(50) NULL DEFAULT 'image/png',
	tamano BIGINT(20) NULL DEFAULT NULL,
	datos MEDIUMBLOB NULL,
	estado TINYINT(4) NULL DEFAULT NULL,
	fecha_creacion DATETIME NOT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS styles_campania;
CREATE TABLE styles_campania (
	id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	id_campania INT(10) UNSIGNED NOT NULL,
	width_logo_web VARCHAR(255) NOT NULL DEFAULT '200px',
	margin_logo_web VARCHAR(255) NOT NULL DEFAULT '1px',
	width_logo_movil VARCHAR(255) NOT NULL DEFAULT '120px',
	margin_logo_movil VARCHAR(255) NOT NULL DEFAULT '1px',
	container_form_color VARCHAR(255) NOT NULL DEFAULT '#005153ad',
	container_form_font_color VARCHAR(255) NOT NULL DEFAULT '#EEE',
	button_font_color VARCHAR(255) NOT NULL DEFAULT '#EEE',
	button_background_color VARCHAR(255) NOT NULL DEFAULT '#20396f',
	button_border_color VARCHAR(255) NOT NULL DEFAULT '#20396f',
	button_hover_font_color VARCHAR(255) NOT NULL DEFAULT '#EEE',
	button_hover_background_color VARCHAR(255) NOT NULL DEFAULT '#1a2b50',
	checkbox_terms_background_color VARCHAR(255) NOT NULL DEFAULT '#20396f',
	checkbox_terms_border_color VARCHAR(255) NOT NULL DEFAULT '#20396f',
	msg_error_color_font VARCHAR(255) NOT NULL DEFAULT '#EEE',
	msg_error_color_background VARCHAR(255) NOT NULL DEFAULT 'rgb(160,19,35,0.91)',
	title_portal VARCHAR(100) NULL DEFAULT NULL,
	color_title_portal VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS terms_conditions_campania;
CREATE TABLE terms_conditions_campania (
	id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	id_campania INT(10) UNSIGNED NOT NULL,
	terms_conditions_es LONGTEXT NOT NULL,
	terms_conditions_en LONGTEXT NOT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS banner_files_campania;
CREATE TABLE banner_files_campania (
	id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	id_campania INT(10) UNSIGNED NOT NULL,
	nombre_img_web VARCHAR(255) NOT NULL DEFAULT 'Untitled.txt',
	mime_img_web VARCHAR(100) NULL DEFAULT NULL,
	tamano_img_web BIGINT(20) NULL DEFAULT NULL,
	datos_img_web MEDIUMBLOB NULL,
	nombre_img_movil VARCHAR(255) NOT NULL DEFAULT 'Untitled.txt',
	mime_img_movil VARCHAR(100) NULL DEFAULT NULL,
	tamano_img_movil BIGINT(20) NULL DEFAULT NULL,
	datos_img_movil MEDIUMBLOB NULL,
	estado TINYINT(4) NULL DEFAULT NULL,
	fecha_creacion DATETIME NOT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS tipos_archivos_multimedia;
CREATE TABLE tipos_archivos_multimedia (
	id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	tipo VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);
insert into tipos_archivos_multimedia (tipo) VALUES 
("Background"),
("Logo"),
("Favicon");

DROP TABLE IF EXISTS users_radius;
CREATE TABLE users_radius (
	id INT(11) NOT NULL AUTO_INCREMENT,
	id_campania INT(11) NOT NULL,
	id_cliente INT(11) NOT NULL,
	username VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	fecha_creacion DATETIME NOT NULL,
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS assistpeople;
CREATE TABLE assistpeople(
	id INT(11) NOT NULL AUTO_INCREMENT,
	id_userIngreso INT(11) NOT NULL,
	id_userSalida INT(11),
	numero_documento VARCHAR(100) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellidos VARCHAR(255) NOT NULL,
	fecha_nacimiento VARCHAR(10) NOT NULL,
	fecha_ingreso VARCHAR(30) NOT NULL,
	fecha_salida VARCHAR(30),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `files_campania` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_campania` int(10) unsigned NOT NULL,
  `id_tipo_archivo_multimedia` int(10) unsigned NOT NULL,
  `nombre` varchar(255) NOT NULL DEFAULT 'Untitled.txt',
  `mime` varchar(50) DEFAULT 'image/png',
  `tamano` bigint(20) DEFAULT NULL,
  `datos` mediumblob,
  `estado` tinyint(4) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id`));

REPLACE INTO `files_campania` (`id`, `id_campania`, `id_tipo_archivo_multimedia`, `nombre`, `mime`, `tamano`, `datos`, `estado`, `fecha_creacion`) VALUES
	(1, 1, 1, '/img/background.png', 'image/png', NULL, NULL, NULL, '2020-03-11 12:02:14'),
	(2, 1, 2, '/img/logo.png', 'image/png', NULL, NULL, NULL, '2020-03-11 12:02:14'),
	(3, 1, 3, '/img/favicon.ico', 'image/png', NULL, NULL, NULL, '2020-03-11 12:02:14');

CREATE TABLE IF NOT EXISTS `banner_files_campania` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_campania` int(10) unsigned NOT NULL,
  `nombre_img_web` varchar(255) NOT NULL DEFAULT 'Untitled.txt',
  `mime_img_web` varchar(100) DEFAULT NULL,
  `tamano_img_web` bigint(20) DEFAULT NULL,
  `datos_img_web` mediumblob,
  `nombre_img_movil` varchar(255) NOT NULL DEFAULT 'Untitled.txt',
  `mime_img_movil` varchar(100) DEFAULT NULL,
  `tamano_img_movil` bigint(20) DEFAULT NULL,
  `datos_img_movil` mediumblob,
  `estado` tinyint(4) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id`));


  CREATE TABLE IF NOT EXISTS `portal_cautivo_campestre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_evento` bigint(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_numero_documento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `escarapela` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad_impresos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_categoria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`));


