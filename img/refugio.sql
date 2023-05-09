-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2023 a las 01:18:34
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `refugio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopciones`
--

CREATE DATABASE refugio;
USE refugio;

CREATE TABLE `adopciones` (
  `id_adopción` int(11) NOT NULL,
  `id_Mascotas` int(11) DEFAULT NULL,
  `id_adoptante` int(11) DEFAULT NULL,
  `Fecha_adopción` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptante`
--

CREATE TABLE `adoptante` (
  `id_adoptante` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `ine` varchar(50) DEFAULT NULL,
  `curp` varchar(50) DEFAULT NULL,
  `estado_adoptante` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_persona` int(11) DEFAULT NULL,
  `Nombre_de_usuario` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(50) DEFAULT NULL,
  `Fecha_de_registro` date DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_Mascotas` int(11) NOT NULL,
  `folio` varchar(50) DEFAULT NULL,
  `Estado_registro` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Especie` varchar(50) DEFAULT NULL,
  `Raza` varchar(50) DEFAULT NULL,
  `Tamaño` varchar(50) DEFAULT NULL,
  `Género` varchar(50) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Enfermedades` varchar(100) DEFAULT NULL,
  `Estado_llegada` varchar(50) DEFAULT NULL,
  `Estado_regreso` varchar(50) DEFAULT NULL,
  `Imagen` varchar(200) DEFAULT NULL,
  `Fecha_ingresado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas_areas`
--

CREATE TABLE `mascotas_areas` (
  `id_Mascotas` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `Fecha_asignación` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Teléfono` varchar(50) DEFAULT NULL,
  `Dirección` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `áreas`
--

CREATE TABLE `áreas` (
  `id_area` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripción` varchar(100) DEFAULT NULL,
  `Capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD PRIMARY KEY (`id_adopción`),
  ADD KEY `id_adoptante` (`id_adoptante`),
  ADD KEY `id_Mascotas` (`id_Mascotas`);

--
-- Indices de la tabla `adoptante`
--
ALTER TABLE `adoptante`
  ADD PRIMARY KEY (`id_adoptante`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_Mascotas`);

--
-- Indices de la tabla `mascotas_areas`
--
ALTER TABLE `mascotas_areas`
  ADD KEY `id_area` (`id_area`),
  ADD KEY `id_Mascotas` (`id_Mascotas`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `áreas`
--
ALTER TABLE `áreas`
  ADD PRIMARY KEY (`id_area`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD CONSTRAINT `adopciones_ibfk_1` FOREIGN KEY (`id_adoptante`) REFERENCES `adoptante` (`id_adoptante`),
  ADD CONSTRAINT `adopciones_ibfk_2` FOREIGN KEY (`id_Mascotas`) REFERENCES `mascotas` (`id_Mascotas`);

--
-- Filtros para la tabla `adoptante`
--
ALTER TABLE `adoptante`
  ADD CONSTRAINT `adoptante_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `mascotas_areas`
--
ALTER TABLE `mascotas_areas`
  ADD CONSTRAINT `mascotas_areas_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `áreas` (`id_area`),
  ADD CONSTRAINT `mascotas_areas_ibfk_2` FOREIGN KEY (`id_Mascotas`) REFERENCES `mascotas` (`id_Mascotas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
