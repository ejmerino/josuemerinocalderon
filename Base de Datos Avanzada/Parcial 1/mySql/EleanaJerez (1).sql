
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-05-2024 a las 19:49:17
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

create database EleanaJerez;
use EleanaJerez;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `EleanaJerez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CUADROS`
--

CREATE TABLE `CUADROS` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `dimensiones` varchar(45) DEFAULT NULL,
  `fecha_pintado` varchar(45) DEFAULT NULL,
  `tecnica_utilizada` varchar(45) DEFAULT NULL,
  `PINACOTECA_nombre` varchar(45) NOT NULL,
  `PINTOR_nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `CUADROS`
--

INSERT INTO `CUADROS` (`codigo`, `nombre`, `dimensiones`, `fecha_pintado`, `tecnica_utilizada`, `PINACOTECA_nombre`, `PINTOR_nombre`) VALUES
(1, 'La última cena', '3x2', '01-01-1489', '01-01-1489', 'Museo del Louvre', 'Leonardo da Vinci'),
(2, 'La Mona Lisa', '50x50', '01-01-1490', '01-01-1491', 'Museo del Louvre', 'Leonardo da Vinci'),
(3, 'Noche estrellada', '59x39', '01-01-1900', '01-01-1901', 'Museo de Arte Metropolitano (MET) ', 'Vincent van Gogh'),
(4, 'Los girasoles', '56x45', '01-01-1800', '01-01-1801', 'Museo Hermitage ', 'Vincent van Gogh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESCUELA`
--

CREATE TABLE `ESCUELA` (
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `fecha_aparecio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ESCUELA`
--

INSERT INTO `ESCUELA` (`nombre`, `pais`, `fecha_aparecio`) VALUES
('Academia de Bellas Artes de Brera', 'talia', '01-01-1900'),
('Academia de Bellas Artes de Florencia', 'Florencia', '01-01-1900'),
('Academia de Bellas Artes de Viena', 'Austria', '01-01-1900'),
('Bauhaus', 'España', '01-01-1900'),
('École des Beaux-Arts', 'Francia', '01-01-1900'),
('Escuela de Bellas Artes d ', 'Estados Unidos', '01-01-1900'),
('Escuela de Bellas Artes de Atenas', 'Grecia', '01-01-1900'),
('Real Academia de Bellas Artes de Amberes', 'Bélgica', '01-01-1900'),
('Real Academia de Bellas Artes de San Carlos', 'España', '01-01-1900'),
('Real Academia de Bellas Artes de San Fernando', 'España', '01-01-1900');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MECENAS`
--

CREATE TABLE `MECENAS` (
  `nombre` varchar(45) NOT NULL,
  `fecha_muerte` varchar(45) DEFAULT NULL,
  `ciudad_naciemiento` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `MECENAS`
--

INSERT INTO `MECENAS` (`nombre`, `fecha_muerte`, `ciudad_naciemiento`, `pais`, `fecha`) VALUES
('Cardenal Richelieu', '01-01-1500', 'Florencia', 'Francia', '01-01-1500'),
('Casa de Habsburgo', '01-01-1500', 'Florencia', 'talia', '01-01-1500'),
('Casa de Médici', '01-01-1500', 'Florencia', 'Italia', '01-01-1500'),
('Casa de Orleans', '01-01-1500', 'Paris', 'Francia', '01-01-1500'),
('Casa de Stuart', '01-01-1500', 'Londres', 'Inglaterra', '01-01-1500'),
('Duque de Orléans', '01-01-1500', 'Florencia', 'Francia', '01-01-1500'),
('Familia Borghese ', '01-01-1500', 'Florencia', 'talia', '01-01-1500'),
('Familia de los Rothschild', '01-01-1500', 'Londres', 'Inglaterra', '01-01-1500'),
('Pablo Picasso y Gertrude Stein', '01-01-1500', 'Paris', 'Francia', '01-01-1500'),
('Papa Julio II', '01-01-1500', 'Florencia', 'talia', '01-01-1500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PINACOTECA`
--

CREATE TABLE `PINACOTECA` (
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `m2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `PINACOTECA`
--

INSERT INTO `PINACOTECA` (`nombre`, `ciudad`, `direccion`, `m2`) VALUES
('Galería de los Uffizi', 'Florencia', 'Florencia', 1000),
('Galería Nacional ', 'Londres', 'Londres', 1000),
('Galería Nacional de Arte', 'Washington, D.C.', 'Washington, D.C.', 1000),
('Museo de Arte Metropolitano (MET) ', 'Nueva York', 'Nueva York', 1000),
('Museo de Arte Moderno (MoMA)', 'Nueva York', 'Nueva York', 1000),
('Museo de Orsay', 'París', 'París', 1000),
('Museo del Louvre', 'Paris', 'Paris', 2000),
('Museo Hermitage ', 'San Petersburgo', 'San Petersburgo', 1000),
('Museo Nacional de Tokio', 'Tokio', 'Tokio', 1000),
('Museo Nacional del Prado', 'Madrid', 'Madrid', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PINTOR`
--

CREATE TABLE `PINTOR` (
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `fecha_defuncion` varchar(45) DEFAULT NULL,
  `ESCUELA_nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `PINTOR`
--

INSERT INTO `PINTOR` (`nombre`, `pais`, `ciudad`, `fecha_nacimiento`, `fecha_defuncion`, `ESCUELA_nombre`) VALUES
('Claude Monet ', 'Francia', 'Paris', '1840-1926', '1840-1926', 'École des Beaux-Arts'),
('Edgar Degas ', 'España', 'Madrid', '(1834-1917', '(1834-1917', 'Real Academia de Bellas Artes de San Fernando'),
('Georgia O\'Keeffe', 'Estados Unidos', 'New York', '1887-1986)', '1887-1986)', 'École des Beaux-Arts'),
('Johannes Vermeer ', 'Austria', 'Viena', '1632-1675', '1632-1675', 'Academia de Bellas Artes de Viena'),
('Leonardo da Vinci', 'Italia', 'Florencia', '01-01-1452', '01-01-1519', 'Academia de Bellas Artes de Florencia'),
('Michelangelo Buonarrot', 'Italia', 'Florencia', '1475-1564', '1475-1564', 'Academia de Bellas Artes de Florencia'),
('Pablo Picasso', 'España', 'Barcelona', '1881-1973', '1881-1973', 'Bauhaus'),
('Rembrandt van Rijn', 'Francia', 'Paris', '1606-1669', '1606-1669', 'Academia de Bellas Artes de Florencia'),
('Salvador Dal', 'España', 'Barcelona', '1904-1989', '1904-1989', 'Real Academia de Bellas Artes de San Carlos'),
('Vincent van Gogh', 'Holanda', 'Amsterdan', '01-01-1853', '01-01-1890', 'École des Beaux-Arts');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PINTOR_has_MECENAS`
--

CREATE TABLE `PINTOR_has_MECENAS` (
  `PINTOR_nombre` varchar(45) NOT NULL,
  `MECENAS_nombre` varchar(45) NOT NULL,
  `id_pintor_mecenas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `PINTOR_has_MECENAS`
--

INSERT INTO `PINTOR_has_MECENAS` (`PINTOR_nombre`, `MECENAS_nombre`, `id_pintor_mecenas`) VALUES
('Salvador Dal', 'Familia Borghese ', '2'),
('Vincent van Gogh', 'Cardenal Richelieu', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CUADROS`
--
ALTER TABLE `CUADROS`
  ADD PRIMARY KEY (`codigo`,`PINACOTECA_nombre`,`PINTOR_nombre`),
  ADD KEY `fk_CUADROS_PINACOTECA` (`PINACOTECA_nombre`),
  ADD KEY `fk_CUADROS_PINTOR1` (`PINTOR_nombre`);

--
-- Indices de la tabla `ESCUELA`
--
ALTER TABLE `ESCUELA`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `MECENAS`
--
ALTER TABLE `MECENAS`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `PINACOTECA`
--
ALTER TABLE `PINACOTECA`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `PINTOR`
--
ALTER TABLE `PINTOR`
  ADD PRIMARY KEY (`nombre`,`ESCUELA_nombre`),
  ADD KEY `fk_PINTOR_ESCUELA1` (`ESCUELA_nombre`);

--
-- Indices de la tabla `PINTOR_has_MECENAS`
--
ALTER TABLE `PINTOR_has_MECENAS`
  ADD PRIMARY KEY (`PINTOR_nombre`,`MECENAS_nombre`,`id_pintor_mecenas`),
  ADD KEY `fk_PINTOR_has_MECENAS_MECENAS1` (`MECENAS_nombre`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CUADROS`
--
ALTER TABLE `CUADROS`
  ADD CONSTRAINT `fk_CUADROS_PINACOTECA` FOREIGN KEY (`PINACOTECA_nombre`) REFERENCES `PINACOTECA` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CUADROS_PINTOR1` FOREIGN KEY (`PINTOR_nombre`) REFERENCES `PINTOR` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PINTOR`
--
ALTER TABLE `PINTOR`
  ADD CONSTRAINT `fk_PINTOR_ESCUELA1` FOREIGN KEY (`ESCUELA_nombre`) REFERENCES `ESCUELA` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PINTOR_has_MECENAS`
--
ALTER TABLE `PINTOR_has_MECENAS`
  ADD CONSTRAINT `fk_PINTOR_has_MECENAS_MECENAS1` FOREIGN KEY (`MECENAS_nombre`) REFERENCES `MECENAS` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PINTOR_has_MECENAS_PINTOR1` FOREIGN KEY (`PINTOR_nombre`) REFERENCES `PINTOR` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
