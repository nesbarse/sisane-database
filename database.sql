SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sisane
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sisane` ;

-- -----------------------------------------------------
-- Schema sisane
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sisane` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `sisane` ;

-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2016 a las 09:59:16
-- Versión del servidor: 5.6.32
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sisane`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analitica`
--

CREATE TABLE `analitica` (
  `id` int(11) NOT NULL,
  `informe` longtext COLLATE utf8_unicode_ci,
  `fecha_petición` datetime DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `anticoagulante_id` int(11) DEFAULT NULL,
  `tipomuestra_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anticoagulante`
--

CREATE TABLE `anticoagulante` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_episodio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tipodocumento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `episodio`
--

CREATE TABLE `episodio` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `informe` longtext COLLATE utf8_unicode_ci,
  `id_importancia` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `importe` decimal(10,0) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_episodio` int(11) DEFAULT NULL,
  `prioridad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tecnica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `importancia`
--

CREATE TABLE `importancia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `importancia`
--

INSERT INTO `importancia` (`id`, `descripcion`) VALUES
(1, 'irrelevante'),
(2, 'leve'),
(3, 'moderada'),
(4, 'severa'),
(5, 'grave'),
(6, 'muy grave'),
(7, 'crítica'),
(8, 'fatal'),
(9, 'mortal'),
(10, 'desconocida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id`, `descripcion`) VALUES
(1, 'acetadote'),
(2, 'tylenol'),
(3, 'dulcolax'),
(4, 'hibiclens'),
(5, 'valium'),
(6, 'teveten'),
(7, 'motrin'),
(8, 'vicodin'),
(9, 'neurontin'),
(10, 'antizol'),
(11, 'isuprel'),
(12, 'mutamycin'),
(13, 'levatol'),
(14, 'trental'),
(15, 'astudal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundo_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundo_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciudad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigopostal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provincia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posologia`
--

CREATE TABLE `posologia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_medicamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `posologia`
--

INSERT INTO `posologia` (`id`, `descripcion`, `id_medicamento`) VALUES
(1, 'desayuno, comida, cena', 2),
(2, 'comida, cena', 4),
(3, 'desayuno', 6),
(4, 'desayuno, cena', 1),
(5, 'cena', 8),
(6, 'desayuno, comida', 9),
(7, 'desayuno', 2),
(8, 'desayuno, comida, cena', 7),
(9, 'comida, cena', 5),
(10, 'cena', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridad`
--

CREATE TABLE `prioridad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE `prueba` (
  `id` int(11) NOT NULL,
  `informe` longtext COLLATE utf8_unicode_ci,
  `fecha_petición` datetime DEFAULT NULL,
  `id_episodio` int(11) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `imagen_id` int(11) DEFAULT NULL,
  `analitica_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnica`
--

CREATE TABLE `tecnica` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomuestra`
--

CREATE TABLE `tipomuestra` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id` int(11) NOT NULL,
  `id_medicamento` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `cuidados` longtext COLLATE utf8_unicode_ci,
  `id_via` int(11) DEFAULT NULL,
  `id_posologia` int(11) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `id_episodio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usertype` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `via`
--

CREATE TABLE `via` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_medicamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `via`
--

INSERT INTO `via` (`id`, `descripcion`, `id_medicamento`) VALUES
(1, 'Via oral', 1),
(2, 'Via sublingual', 2),
(3, 'Via topica', 3),
(4, 'Via transdermica', 4),
(5, 'Via oftalmica', 5),
(6, 'Via otica', 6),
(7, 'Via intranasal', 7),
(8, 'Via intravenosa', 8),
(9, 'Via intramuscular', 9),
(10, 'Via subcutanea', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id`, `descripcion`) VALUES
(1, 'cabeza'),
(2, 'brazo'),
(3, 'torax'),
(4, 'lumbar'),
(5, 'pierna'),
(6, 'pie'),
(7, 'mano'),
(8, 'rodilla'),
(9, 'tobillo'),
(10, 'coxis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonaimagen`
--

CREATE TABLE `zonaimagen` (
  `id` int(11) NOT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_imagen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `analitica`
--
ALTER TABLE `analitica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_analitica_color1_idx` (`color_id`),
  ADD KEY `fk_analitica_anticoagulante1_idx` (`anticoagulante_id`),
  ADD KEY `fk_analitica_tipomuestra1_idx` (`tipomuestra_id`);

--
-- Indices de la tabla `anticoagulante`
--
ALTER TABLE `anticoagulante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_buy_document_idx` (`id_documento`),
  ADD KEY `fk_cargo_episodio1_idx` (`id_episodio`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_document_documenttype_idx` (`id_tipodocumento`);

--
-- Indices de la tabla `episodio`
--
ALTER TABLE `episodio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_episodio_servicio1_idx` (`id_servicio`),
  ADD KEY `fk_episodio_tipo1_idx` (`id_tipo`),
  ADD KEY `fk_episodio_importancia_idx` (`id_importancia`),
  ADD KEY `fk_episodio_paciente1_idx` (`id_paciente`),
  ADD KEY `fk_episodio_medico1_idx` (`id_medico`),
  ADD KEY `fk_episodio_episodio1_idx` (`id_episodio`),
  ADD KEY `fk_episodio_prioridad1_idx` (`prioridad_id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_imagen_tecnica1_idx` (`id_tecnica`);

--
-- Indices de la tabla `importancia`
--
ALTER TABLE `importancia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_medico_servicio1_idx` (`id_servicio`),
  ADD KEY `fk_medico_especialidad1_idx` (`id_especialidad`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente_servicio1_idx` (`servicio_id`);

--
-- Indices de la tabla `posologia`
--
ALTER TABLE `posologia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posologia_medicamento1_idx` (`id_medicamento`);

--
-- Indices de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prueba`
--
ALTER TABLE `prueba`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prueba_episodio1_idx` (`id_episodio`),
  ADD KEY `fk_prueba_imagen1_idx` (`imagen_id`),
  ADD KEY `fk_prueba_analitica1_idx` (`analitica_id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnica`
--
ALTER TABLE `tecnica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipomuestra`
--
ALTER TABLE `tipomuestra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente_has_medicamento_medicamento1_idx` (`id_medicamento`),
  ADD KEY `fk_tratamiento_via1_idx` (`id_via`),
  ADD KEY `fk_tratamiento_posologia1_idx` (`id_posologia`),
  ADD KEY `fk_tratamiento_episodio1_idx` (`id_episodio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_usertype1_idx` (`id_usertype`),
  ADD KEY `fk_usuario_medico1_idx` (`id_medico`);

--
-- Indices de la tabla `via`
--
ALTER TABLE `via`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_via_medicamento1_idx` (`id_medicamento`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `zonaimagen`
--
ALTER TABLE `zonaimagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zona_imagen_imagen1_idx` (`id_imagen`),
  ADD KEY `fk_zona_imagen_zona1_idx` (`id_zona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `analitica`
--
ALTER TABLE `analitica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `anticoagulante`
--
ALTER TABLE `anticoagulante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `episodio`
--
ALTER TABLE `episodio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `importancia`
--
ALTER TABLE `importancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `posologia`
--
ALTER TABLE `posologia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `prueba`
--
ALTER TABLE `prueba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tecnica`
--
ALTER TABLE `tecnica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipomuestra`
--
ALTER TABLE `tipomuestra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `via`
--
ALTER TABLE `via`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `zonaimagen`
--
ALTER TABLE `zonaimagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `analitica`
--
ALTER TABLE `analitica`
  ADD CONSTRAINT `fk_analitica_anticoagulante` FOREIGN KEY (`anticoagulante_id`) REFERENCES `anticoagulante` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_analitica_color` FOREIGN KEY (`color_id`) REFERENCES `prioridad` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_analitica_tipomuestra` FOREIGN KEY (`tipomuestra_id`) REFERENCES `tipomuestra` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `fk_cargo_documento` FOREIGN KEY (`id_documento`) REFERENCES `documento` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cargo_episodio` FOREIGN KEY (`id_episodio`) REFERENCES `episodio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `fk_document_tipodocumento` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipodocumento` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `episodio`
--
ALTER TABLE `episodio`
  ADD CONSTRAINT `fk_episodio_episodio` FOREIGN KEY (`id_episodio`) REFERENCES `episodio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_episodio_importancia` FOREIGN KEY (`id_importancia`) REFERENCES `importancia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_episodio_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_episodio_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_episodio_prioridad` FOREIGN KEY (`prioridad_id`) REFERENCES `prioridad` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_episodio_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_episodio_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `fk_imagen_tecnica1` FOREIGN KEY (`id_tecnica`) REFERENCES `tecnica` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `fk_medico_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_medico_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_paciente_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `posologia`
--
ALTER TABLE `posologia`
  ADD CONSTRAINT `fk_posologia_medicamento` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `prueba`
--
ALTER TABLE `prueba`
  ADD CONSTRAINT `fk_prueba_analitica` FOREIGN KEY (`analitica_id`) REFERENCES `analitica` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prueba_episodio` FOREIGN KEY (`id_episodio`) REFERENCES `episodio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prueba_imagen` FOREIGN KEY (`imagen_id`) REFERENCES `imagen` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `fk_tratamiento_episodio` FOREIGN KEY (`id_episodio`) REFERENCES `episodio` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tratamiento_medicamento` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tratamiento_posologia` FOREIGN KEY (`id_posologia`) REFERENCES `posologia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tratamiento_via` FOREIGN KEY (`id_via`) REFERENCES `via` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_tipousuario` FOREIGN KEY (`id_usertype`) REFERENCES `tipousuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `via`
--
ALTER TABLE `via`
  ADD CONSTRAINT `fk_via_medicamento` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `zonaimagen`
--
ALTER TABLE `zonaimagen`
  ADD CONSTRAINT `fk_zona_imagen_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zona_imagen_zona` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
