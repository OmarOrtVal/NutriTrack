-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2026 a las 22:47:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nutritrack`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentos_registrados`
--

CREATE TABLE `alimentos_registrados` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `alimento` varchar(255) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `unidad` varchar(50) NOT NULL,
  `calorias` decimal(8,2) NOT NULL,
  `proteinas` decimal(8,2) DEFAULT 0.00,
  `carbohidratos` decimal(8,2) DEFAULT 0.00,
  `grasas` decimal(8,2) DEFAULT 0.00,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('Mujer','Hombre','Personalizado') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `actividad_fisica` enum('sedentario','ligero','moderado','activo','muy_activo') DEFAULT NULL,
  `dieta_especifica` varchar(50) DEFAULT NULL,
  `experiencia_cocina` enum('principiante','intermedio','avanzado') DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_alergias`
--

CREATE TABLE `usuario_alergias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `alergia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_intolerancias`
--

CREATE TABLE `usuario_intolerancias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `intolerancia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_objetivos`
--

CREATE TABLE `usuario_objetivos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `objetivo` enum('bajar_peso','mantener_peso','subir_peso','ganar_musculo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentos_registrados`
--
ALTER TABLE `alimentos_registrados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alimentos_usuario` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuario_alergias`
--
ALTER TABLE `usuario_alergias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alergia_usuario` (`usuario_id`);

--
-- Indices de la tabla `usuario_intolerancias`
--
ALTER TABLE `usuario_intolerancias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_intolerancia_usuario` (`usuario_id`);

--
-- Indices de la tabla `usuario_objetivos`
--
ALTER TABLE `usuario_objetivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_objetivo_usuario` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimentos_registrados`
--
ALTER TABLE `alimentos_registrados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_alergias`
--
ALTER TABLE `usuario_alergias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario_intolerancias`
--
ALTER TABLE `usuario_intolerancias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario_objetivos`
--
ALTER TABLE `usuario_objetivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimentos_registrados`
--
ALTER TABLE `alimentos_registrados`
  ADD CONSTRAINT `fk_alimentos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario_alergias`
--
ALTER TABLE `usuario_alergias`
  ADD CONSTRAINT `fk_alergia_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario_intolerancias`
--
ALTER TABLE `usuario_intolerancias`
  ADD CONSTRAINT `fk_intolerancia_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario_objetivos`
--
ALTER TABLE `usuario_objetivos`
  ADD CONSTRAINT `fk_objetivo_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
