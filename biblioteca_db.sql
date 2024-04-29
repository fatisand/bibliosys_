-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2024 a las 16:14:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`) VALUES
(1, 'Jane Austen'),
(2, 'Agatha Christie'),
(3, 'Alejandro Dumas'),
(4, 'Edgar Allan Poe'),
(5, 'Homero'),
(6, 'William Shakespeare'),
(7, 'JK Rowling'),
(8, 'Megan Maxwell'),
(9, 'Susanne Collins');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `dni`, `telefono`, `direccion`) VALUES
(1, 'Marta Fernandez', 'Z25474892M', '692353137', 'Madrid'),
(2, 'Martin Gomez', '879654M', '692353137', 'Calle Buenavista 12'),
(3, 'Julian Santacruz', '637852M', '692353137', 'Calle Buenavista 25'),
(4, 'Selena Gomez', '547821P', '624578925', 'Calle Alcalá 25'),
(5, 'Eiza Gonzalez', '586415E', '654871452', 'Calle Mulhacen 35'),
(6, 'Gloria Fernandez', 'Z225417V', '624515874', 'Guadalajara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240419195608', '2024-04-19 21:56:25', 446),
('DoctrineMigrations\\Version20240422205905', '2024-04-22 22:59:37', 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `nombre`, `direccion`) VALUES
(1, 'Planeta', 'Madrid'),
(2, 'RBA', 'Barcelona'),
(3, 'Mondadori', 'Galicia'),
(4, 'Anagrama', 'Madrid'),
(5, 'El lector', 'Madrid'),
(6, 'Circulo Rojo', 'Torrejon de Ardoz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `autor_nombre_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `autor_nombre_id`, `nombre`, `genero`) VALUES
(1, 1, 'Orgullo y Prejuicio', 'Romantico'),
(2, 7, 'Harry Potter 1', 'Fantasia'),
(3, 7, 'Harry Potter 2', 'Fantasia'),
(4, 9, 'Los juegos del hambre', 'Juvenil'),
(5, 4, 'Las sombras del horror', 'terror'),
(6, 4, 'El cuervo', 'terror'),
(7, 2, 'Un crimen dormido', 'misterio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_editorial`
--

CREATE TABLE `libro_editorial` (
  `libro_id` int(11) NOT NULL,
  `editorial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `libro_editorial`
--

INSERT INTO `libro_editorial` (`libro_id`, `editorial_id`) VALUES
(1, 1),
(2, 3),
(3, 3),
(4, 1),
(5, 4),
(6, 4),
(7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id` int(11) NOT NULL,
  `nombre_libro_id` int(11) DEFAULT NULL,
  `nombre_cliente_id` int(11) DEFAULT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `observacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id`, `nombre_libro_id`, `nombre_cliente_id`, `fecha_prestamo`, `fecha_devolucion`, `observacion`) VALUES
(2, 4, 1, '2024-06-05', '2024-07-07', 'tapa rota'),
(3, 5, 3, '2024-07-06', '2024-08-09', 'libro nuevo'),
(6, 6, 6, '2024-04-28', '2024-05-28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `is_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nombre`, `is_verified`) VALUES
(1, 'user@bibliosys.com', '[]', '$2y$13$35aa/zlPcjxcZyaT9m.N0eK9zlDjpsfV5GqarYY06Ej7O.sXso9sa', 'bibliotecario1', 0),
(2, 'user2@bibliosys.com', '[]', '$2y$13$Pa7ZCfde.Wcl.mwDGurBneVLeMAjqpUQq7clJVQoiq3ngBCxqTIqO', 'bibliotecario2', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5799AD2BA8DD50B1` (`autor_nombre_id`);

--
-- Indices de la tabla `libro_editorial`
--
ALTER TABLE `libro_editorial`
  ADD PRIMARY KEY (`libro_id`,`editorial_id`),
  ADD KEY `IDX_B6067336C0238522` (`libro_id`),
  ADD KEY `IDX_B6067336BAF1A24D` (`editorial_id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F4D874F2B60BDDF3` (`nombre_libro_id`),
  ADD KEY `IDX_F4D874F223E015E1` (`nombre_cliente_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK_5799AD2BA8DD50B1` FOREIGN KEY (`autor_nombre_id`) REFERENCES `autor` (`id`);

--
-- Filtros para la tabla `libro_editorial`
--
ALTER TABLE `libro_editorial`
  ADD CONSTRAINT `FK_B6067336BAF1A24D` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B6067336C0238522` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `FK_F4D874F223E015E1` FOREIGN KEY (`nombre_cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_F4D874F2B60BDDF3` FOREIGN KEY (`nombre_libro_id`) REFERENCES `libro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
