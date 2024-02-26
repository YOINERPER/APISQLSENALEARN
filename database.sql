/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - senalearn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`senalearn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `senalearn`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `Id_Cat` varchar(100) NOT NULL,
  `Nom_Cat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`Id_Cat`,`Nom_Cat`) values ('1','Programación'),('2','mamweboxds'),('2fquk70wlt28m5c0','desarrollo web'),('2fquk70wlt28mn9b','diseño gráfico'),('2fquk70wlt28muiz','marketing digital'),('2fquk70wlt28n9fi','negocios y emprendimiento'),('2fquk70wlt28nixt','ciencia de datos'),('2fquk70wlt28np26','arte y creatividad'),('2fquk70wlt28ogue','salud y bienestar'),('2fquk70wlt28ors4','cocina y gastronomía'),('3','Marketing'),('4','Idiomas'),('5','SOFTWARE');

/*Table structure for table `certificados` */

DROP TABLE IF EXISTS `certificados`;

CREATE TABLE `certificados` (
  `Tit_Cert` varchar(255) DEFAULT NULL,
  `Descp_Cert` varchar(255) DEFAULT NULL,
  `Fec_Crea_Cert` date DEFAULT NULL,
  `Firm_Dig_Cert` blob DEFAULT NULL,
  `Id_User_FK` int(11) NOT NULL,
  `Id_Cur_FK` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_User_FK`,`Id_Cur_FK`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `certificados_ibfk_1` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`),
  CONSTRAINT `certificados_ibfk_2` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `certificados` */

/*Table structure for table `comentarios` */

DROP TABLE IF EXISTS `comentarios`;

CREATE TABLE `comentarios` (
  `Id_Com` int(255) NOT NULL,
  `Id_User_FK` int(11) DEFAULT NULL,
  `Id_Cursos_FK` varchar(100) DEFAULT NULL,
  `Fecha_Pub_Com` date DEFAULT NULL,
  `Desc_Comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Com`),
  KEY `Id_User_FK` (`Id_User_FK`),
  KEY `Id_Cursos_FK` (`Id_Cursos_FK`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`Id_Cursos_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `comentarios` */

/*Table structure for table `contenido_modulo` */

DROP TABLE IF EXISTS `contenido_modulo`;

CREATE TABLE `contenido_modulo` (
  `Id_Cont` int(11) NOT NULL,
  `Tip_Cont` varchar(50) DEFAULT NULL,
  `Url_Cont` varchar(255) DEFAULT NULL,
  `Tit_Cont` varchar(255) DEFAULT NULL,
  `Id_Mod_FK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Cont`),
  KEY `Id_Mod_FK` (`Id_Mod_FK`),
  CONSTRAINT `contenido_modulo_ibfk_1` FOREIGN KEY (`Id_Mod_FK`) REFERENCES `modulocurso` (`Id_Mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `contenido_modulo` */

insert  into `contenido_modulo`(`Id_Cont`,`Tip_Cont`,`Url_Cont`,`Tit_Cont`,`Id_Mod_FK`) values (1,'Video','https://example.com/video1.mp4','Variables en Programación','1'),(2,'Texto',NULL,'Psicología del Color','1'),(3,'PDF','https://example.com/marketing-guide.pdf','Análisis de Campañas de Marketing','1'),(4,'Audio','https://example.com/english-vocabulary.mp3','Vocabulario Importante','1'),(5,'Presentación','https://example.com/financial-planning.ppt','Introducción a la Planificación Financiera','1');

/*Table structure for table `cursos` */

DROP TABLE IF EXISTS `cursos`;

CREATE TABLE `cursos` (
  `Id_Cur` varchar(100) NOT NULL,
  `Nom_Cur` varchar(255) DEFAULT NULL,
  `Des_Cur` varchar(255) DEFAULT NULL,
  `Hor_Cont_Total` int(11) DEFAULT NULL,
  `Fech_Crea_Cur` date DEFAULT NULL,
  `Id_Cat_FK` varchar(100) DEFAULT NULL,
  `Fot_Cur` varchar(200) DEFAULT NULL,
  `Est_Cur` int(1) DEFAULT NULL COMMENT '1:CREADO, 2: PUBLICADO, 3:ELIMINADO',
  PRIMARY KEY (`Id_Cur`),
  KEY `Id_Cat_FK` (`Id_Cat_FK`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`Id_Cat_FK`) REFERENCES `categorias` (`Id_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cursos` */

insert  into `cursos`(`Id_Cur`,`Nom_Cur`,`Des_Cur`,`Hor_Cont_Total`,`Fech_Crea_Cur`,`Id_Cat_FK`,`Fot_Cur`,`Est_Cur`) values ('1','Curso de Programación Avanzada','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-07','1','https://ejemplo.com/imagen_curso.jpg',2),('2','Fundamentos del Diseño Gráfico','Domina los elementos esenciales del diseño gráfico',40,'2023-02-01','2',NULL,2),('2fquk2aclt1pzzry','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),('2fquk3a8lt1q1ddf','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),('2fquk5t0lt1q0tbv','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),('2fqukuklt1puwas','Curso de COSTURA','Este curso cubre temas avanzados de COSTURA.',100,'2024-02-07','4','https://ejemplo.com/imagen_curso.jpg',1),('3','Estrategias de Marketing Digital','Explora estrategias efectivas de marketing digital',40,'2023-03-01','3',NULL,2),('4','Inglés Intermedio','Desarrolla habilidades en el idioma inglés',15,'2023-04-01','4',NULL,2),('5','Gestión Financiera Personal','Aprende a manejar tus finanzas personales',18,'2023-05-01','5',NULL,2),('ahyv2bslt0x9d1j','Curso de Programación Avanzada','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-05','1','https://ejemplo.com/imagen_curso.jpg',1),('ahyv5bolsxp9nxs','Costura Basica','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-05','1','https://ejemplo.com/imagen_curso.jpg',1),('ahyv8bslsxtrcct','Costura Basica','Este curso cubre temas avanzados de programación en varios lenguajes.',40,'2024-02-05','1','https://ejemplo.com/imagen_curso.jpg',1);

/*Table structure for table `evaluacion` */

DROP TABLE IF EXISTS `evaluacion`;

CREATE TABLE `evaluacion` (
  `Id_Eva` int(11) NOT NULL,
  `Tit_Eva` varchar(255) DEFAULT NULL,
  `Des_Eva` varchar(255) DEFAULT NULL,
  `Fec_Crea` date DEFAULT NULL,
  `Fec_Cer` date DEFAULT NULL,
  `Id_Mod_Cur_FK` varchar(100) DEFAULT NULL,
  `Not_Min_Apr_Eva` decimal(5,2) DEFAULT NULL,
  `Estado_Eval` varchar(50) DEFAULT NULL,
  `Intentos_Eval` int(11) DEFAULT NULL,
  `Tipo_Eval` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Eva`),
  KEY `Id_Mod_Cur_FK` (`Id_Mod_Cur_FK`),
  CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`Id_Mod_Cur_FK`) REFERENCES `modulocurso` (`Id_Mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `evaluacion` */

insert  into `evaluacion`(`Id_Eva`,`Tit_Eva`,`Des_Eva`,`Fec_Crea`,`Fec_Cer`,`Id_Mod_Cur_FK`,`Not_Min_Apr_Eva`,`Estado_Eval`,`Intentos_Eval`,`Tipo_Eval`) values (1,'Examen de Programación','Evalúa tus conocimientos en programación','2023-01-10','2023-01-20','1',70.00,'Activo',3,'Examen'),(2,'Prueba de Diseño Gráfico','Evalúa tus habilidades en diseño gráfico','2023-02-15','2023-02-25','2',75.00,'Activo',2,'Quiz'),(3,'Evaluación de Marketing Digital','Evalúa tu comprensión de estrategias de marketing digital','2023-03-20','2023-03-30','3',80.00,'Activo',3,'Examen');

/*Table structure for table `inscripciones` */

DROP TABLE IF EXISTS `inscripciones`;

CREATE TABLE `inscripciones` (
  `Id_User_FK` int(11) NOT NULL,
  `Id_Cur_FK` varchar(100) NOT NULL,
  `Est_Curso` varchar(50) DEFAULT NULL,
  `fecha_insc` date DEFAULT NULL,
  PRIMARY KEY (`Id_User_FK`,`Id_Cur_FK`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `inscripciones` */

/*Table structure for table `localizacion` */

DROP TABLE IF EXISTS `localizacion`;

CREATE TABLE `localizacion` (
  `Id_Loc` int(11) NOT NULL AUTO_INCREMENT,
  `Dir_Ip` varchar(255) DEFAULT NULL,
  `Id_User_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Loc`),
  KEY `Id_User_FK` (`Id_User_FK`),
  CONSTRAINT `localizacion_ibfk_1` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `localizacion` */

insert  into `localizacion`(`Id_Loc`,`Dir_Ip`,`Id_User_FK`) values (20,'192.168.0.3',40),(21,'192.168.1.6',40),(24,'192.168.0.3',43),(25,'192.168.0.3',44),(26,'192.168.0.3',45),(27,'192.168.0.3',46),(28,'192.168.1.6',46),(29,'192.168.0.1',47);

/*Table structure for table `modulocurso` */

DROP TABLE IF EXISTS `modulocurso`;

CREATE TABLE `modulocurso` (
  `Id_Mod` varchar(100) NOT NULL,
  `Tit_Mod` varchar(255) DEFAULT NULL,
  `Est_Mod` int(1) DEFAULT NULL COMMENT '1:activo, 2: bloqueado',
  `Id_Cur_FK` varchar(100) DEFAULT NULL,
  `Horas_Cont_Mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Mod`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `modulocurso_ibfk_1` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `modulocurso` */

insert  into `modulocurso`(`Id_Mod`,`Tit_Mod`,`Est_Mod`,`Id_Cur_FK`,`Horas_Cont_Mod`) values ('1','Conceptos Básicos de Programación',0,'1',10),('2','Color y Composición en Diseño',0,'2',8),('2fquky0lt2anljg','prueba 1',1,'1',10),('3','Publicidad en Redes Sociales',0,'3',12),('4','Vocabulario en Inglés',0,'4',6),('5','Planificación Financiera',0,'5',9);

/*Table structure for table `objetivos_cursos` */

DROP TABLE IF EXISTS `objetivos_cursos`;

CREATE TABLE `objetivos_cursos` (
  `Id_Objetivo` varchar(100) NOT NULL,
  `Desc_Objetivo` varchar(255) DEFAULT NULL,
  `Id_Cur_FK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Objetivo`),
  KEY `Id_Cur_FK` (`Id_Cur_FK`),
  CONSTRAINT `objetivos_cursos_ibfk_1` FOREIGN KEY (`Id_Cur_FK`) REFERENCES `cursos` (`Id_Cur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objetivos_cursos` */

insert  into `objetivos_cursos`(`Id_Objetivo`,`Desc_Objetivo`,`Id_Cur_FK`) values ('2fquk3hwlt1qhsab','el mejor inicio xd','3'),('ahyv74lt0znqnh','ya no aprenderas x2','1'),('ewrewrewrewr43ds','El mejor inicio xd','3');

/*Table structure for table `opciones` */

DROP TABLE IF EXISTS `opciones`;

CREATE TABLE `opciones` (
  `id_opcion` int(11) NOT NULL,
  `nombre_opcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_opcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `opciones` */

insert  into `opciones`(`id_opcion`,`nombre_opcion`) values (1,'Opción 1'),(2,'Opción 2'),(3,'Opción 3'),(4,'Opción 4'),(5,'Opción 5');

/*Table structure for table `preguntaseval` */

DROP TABLE IF EXISTS `preguntaseval`;

CREATE TABLE `preguntaseval` (
  `Id_Preg_Eval` int(11) NOT NULL,
  `Text_Preg_Eval` varchar(255) DEFAULT NULL,
  `Id_Eval_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Preg_Eval`),
  KEY `Id_Eval_FK` (`Id_Eval_FK`),
  CONSTRAINT `preguntaseval_ibfk_1` FOREIGN KEY (`Id_Eval_FK`) REFERENCES `evaluacion` (`Id_Eva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `preguntaseval` */

/*Table structure for table `respuestaseval` */

DROP TABLE IF EXISTS `respuestaseval`;

CREATE TABLE `respuestaseval` (
  `Id_Res_Eval` int(11) NOT NULL,
  `Text_Resp_Eval` varchar(255) DEFAULT NULL,
  `Resp_Correcta_Eval` tinyint(1) DEFAULT NULL,
  `Id_Preg_Eval_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Res_Eval`),
  KEY `Id_Preg_Eval_FK` (`Id_Preg_Eval_FK`),
  CONSTRAINT `respuestaseval_ibfk_1` FOREIGN KEY (`Id_Preg_Eval_FK`) REFERENCES `preguntaseval` (`Id_Preg_Eval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `respuestaseval` */

/*Table structure for table `resultados_evaluacion` */

DROP TABLE IF EXISTS `resultados_evaluacion`;

CREATE TABLE `resultados_evaluacion` (
  `Id_Res_Eval` int(11) NOT NULL,
  `Id_Eval_FK` int(11) DEFAULT NULL,
  `Id_User_FK` int(11) DEFAULT NULL,
  `Puntuacion` decimal(5,2) DEFAULT NULL,
  `Fech_Real_Eval` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Res_Eval`),
  KEY `Id_Eval_FK` (`Id_Eval_FK`),
  KEY `Id_User_FK` (`Id_User_FK`),
  CONSTRAINT `resultados_evaluacion_ibfk_1` FOREIGN KEY (`Id_Eval_FK`) REFERENCES `evaluacion` (`Id_Eva`),
  CONSTRAINT `resultados_evaluacion_ibfk_2` FOREIGN KEY (`Id_User_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resultados_evaluacion` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`Id_Rol`,`Nom_Rol`) values (1,'ESTUDIANTE'),(2,'ADMIN'),(3,'INSTRUCTOR');

/*Table structure for table `roles_opciones` */

DROP TABLE IF EXISTS `roles_opciones`;

CREATE TABLE `roles_opciones` (
  `Id_Rol_fk` int(11) NOT NULL,
  `id_opcion_fk` int(11) NOT NULL,
  PRIMARY KEY (`Id_Rol_fk`,`id_opcion_fk`),
  KEY `id_opcion_fk` (`id_opcion_fk`),
  CONSTRAINT `roles_opciones_ibfk_2` FOREIGN KEY (`id_opcion_fk`) REFERENCES `opciones` (`id_opcion`),
  CONSTRAINT `roles_opciones_ibfk_3` FOREIGN KEY (`Id_Rol_fk`) REFERENCES `roles` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles_opciones` */

insert  into `roles_opciones`(`Id_Rol_fk`,`id_opcion_fk`) values (1,1),(1,2),(1,3),(1,4),(2,5);

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `Id_Token` int(11) NOT NULL AUTO_INCREMENT,
  `Token` varchar(255) DEFAULT NULL,
  `Fec_Caducidad` varchar(100) DEFAULT NULL,
  `User_Id_FK` int(11) DEFAULT NULL,
  `Tipo_token` char(1) DEFAULT NULL COMMENT '1: inicio Sesion, 2: verificacion Email, 3: recuperacion de contraseña, 4: Verificar IP',
  PRIMARY KEY (`Id_Token`),
  KEY `Usuario_Id` (`User_Id_FK`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`User_Id_FK`) REFERENCES `usuarios` (`Id_User`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tokens` */

insert  into `tokens`(`Id_Token`,`Token`,`Fec_Caducidad`,`User_Id_FK`,`Tipo_token`) values (71,'ebe4e93b-dfb5-41c6-afb6-0e0c0ae1eb38','1708637565',40,'2'),(76,'500dc24b-8e2f-466b-a92b-e89b287f8280','1708640168',40,'4'),(80,'3e1a77dd-2aeb-4836-a894-4fcdd7f8e928','1708642429',43,'2'),(81,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQwLCJFbWFfVXNlciI6IllPSU5FUlBFUlRVWkBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg2NDE5MDIsImV4cCI6MTcwODY1NjMwMn0.YfzG530iwM94LFAyibyAEaT5JyBE4t5tP-1oyGOOXHs','1708656302',NULL,'1'),(82,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQwLCJFbWFfVXNlciI6IllPSU5FUlBFUlRVWkBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg4MjMzNzMsImV4cCI6MTcwODgzNzc3M30.UOItMkoDRmDKlIbWVUY_kJT0Jmn44ysaW-xClx2dduY','1708837773',NULL,'1'),(83,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQwLCJFbWFfVXNlciI6IllPSU5FUlBFUlRVWkBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg4MjQ5MTgsImV4cCI6MTcwODgzOTMxOH0.hd9fwUVJuGWbcWMdWRuyw64AMDES7s8x5FEPGoOx5_k','1708839318',NULL,'1'),(84,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQwLCJFbWFfVXNlciI6IllPSU5FUlBFUlRVWkBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg4MjcwOTIsImV4cCI6MTcwODg0MTQ5Mn0.Qrak7vJ4SwajHc9wU3wPH4ms8Jt9-h05xg2_W_S8iKI','1708841492',NULL,'1'),(85,'721730dd-7ff9-4f67-b429-c029340d1801','1708828025',44,'2'),(86,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQwLCJFbWFfVXNlciI6IllPSU5FUlBFUlRVWkBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg4MjkxMjgsImV4cCI6MTcwODg0MzUyOH0.Dt8QEWtXf39jAPblRoUHKa_eXJZfPPY2jResDO33Phs','1708843528',NULL,'1'),(87,'7c2fb530-63fa-4f5d-9f07-3701db0c3ec1','1708830050',45,'2'),(88,'d5db8cd9-090c-4721-981f-7f1cbd799b33','1708830091',46,'2'),(89,'f271578a-7e19-462e-91b5-16a07aa524d6','1708830187',46,'4'),(90,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQ2LCJFbWFfVXNlciI6InlvaW5lcnBlcnR1ekBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjF9LCJpYXQiOjE3MDg4Mjk4MTMsImV4cCI6MTcwODg0NDIxM30.Fc7tyMS1LnbbPV7rZqVUh_L2rWL9wsqZObNm4eqygRw','1708844213',NULL,'1'),(91,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQwLCJFbWFfVXNlciI6IllPSU5FUmRzYWZhc2ZQRVJUVVpAR01BSUwuQ09NIiwiSWRfUm9sX0ZLIjoyfSwiaWF0IjoxNzA4ODI5ODk1LCJleHAiOjE3MDg4NDQyOTV9.iNaAWj3Fnf9GVCqKEIezyWK7EbrXA9L-wlHt-JZzw2k','1708844295',NULL,'1'),(92,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQ2LCJFbWFfVXNlciI6InlvaW5lcnBlcnR1ekBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjF9LCJpYXQiOjE3MDg4Nzc5NjAsImV4cCI6MTcwODg5MjM2MH0.ebsZxqVOIq_LEY_qKLIHrrV0t1JxafapE-C2wORvyks','1708892360',NULL,'1'),(93,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQ2LCJFbWFfVXNlciI6InlvaW5lcnBlcnR1ekBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg4NzgwMTksImV4cCI6MTcwODg5MjQxOX0.5A8MFVVR59x5Ff4gdjpOQUjSXfCLeP4ICQ4m-nsxpYw','1708892419',NULL,'1'),(94,'511672a3-2cec-46a8-9fd7-5725b74580e2','1708882310',47,'2'),(95,'6b3d5794-d3d9-40d4-b77b-2eba6eeaa9d7','1708883188',47,'4'),(96,'7a88ae5d-e7d8-4e31-8682-5c57d8d79768','1708910279',47,'4'),(97,'9857a886-b937-4c39-a779-bfbdbdcaa498','1708910288',47,'4'),(98,'a13eaf14-c368-4ae0-890c-ef31b4633909','1708910294',47,'4'),(99,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQ3LCJFbWFfVXNlciI6InlvaW5lcnBlcnR1ekBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjF9LCJpYXQiOjE3MDg5MDk0NDgsImV4cCI6MTcwODkyMzg0OH0.TcTAnmIwd3iGm6xA9XVMCnluO15vv4lbA3WLPFJJ9YY','1708923848',NULL,'1'),(100,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7IklkX1VzZXIiOjQ3LCJFbWFfVXNlciI6InlvaW5lcnBlcnR1ekBHTUFJTC5DT00iLCJJZF9Sb2xfRksiOjJ9LCJpYXQiOjE3MDg5MDk0OTgsImV4cCI6MTcwODkyMzg5OH0.om160JO4IIO3O59cLMhZW6bzqzmbn9233F5jyUa4c70','1708923898',NULL,'1');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `Id_User` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_User` varchar(255) DEFAULT NULL,
  `Ape_User` varchar(255) DEFAULT NULL,
  `Tel_User` varchar(20) DEFAULT NULL,
  `Ema_User` varchar(255) DEFAULT NULL,
  `Pass_User` varchar(255) DEFAULT NULL,
  `Id_Rol_FK` int(11) DEFAULT NULL,
  `Fot_User` varchar(255) DEFAULT NULL,
  `Est_Email_User` int(1) DEFAULT 0,
  PRIMARY KEY (`Id_User`),
  KEY `Id_Rol_FK` (`Id_Rol_FK`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Rol_FK`) REFERENCES `roles` (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`Id_User`,`Nom_User`,`Ape_User`,`Tel_User`,`Ema_User`,`Pass_User`,`Id_Rol_FK`,`Fot_User`,`Est_Email_User`) values (40,'YOINER','PERTUZ',NULL,'YOINERdsafasfPERTUZ@GMAIL.COM','$2b$10$8Apx.sbElZGnh5cQt3owUux8EfCS3TWBZMRTa3cdfYbb9AyGOdIPm',2,NULL,1),(43,'YOINER','PERTUZ',NULL,'YOINERPERTUZ342434324324324324324324324342@GMAIL.COM','$2b$10$.KKX7jpp/AQlZNmp.f/XA.qmOU5AuPE5grrhSQYq9hSEAgKBzSBqi',1,NULL,0),(44,'YOINER','PERTUZ',NULL,'xdyoiner@GMAIL.COM','$2b$10$6Y4a2d0k2qhEj2FltBvsdeNnPqU3DCznzWVdtBdsvUKBDAurmwmv.',1,NULL,0),(45,'YOINER','PERTUZ',NULL,'xdfgyoiner@GMAIL.COM','$2b$10$WRD4SqsaI2i8THzryTjYRuO62B9LTJuRF5FGnZpZHp6ijgCyyC6KK',1,NULL,0),(46,'petro','urrego',NULL,'yoinesdasdsdrpertuz@GMAIL.COM','$2b$10$C5GFh4BUK8c9NpyewhpDT.1NQaL753uKiIZ32k545nUg7zp4v1BkS',2,NULL,1),(47,'YOINER','PERTUZ',NULL,'yoinerpertuz@GMAIL.COM','$2b$10$ainZOy48wQfrmzj0q0qOg.sDTFYSP5cLbMJR9EzeCzC5ScpGnh2aC',2,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
