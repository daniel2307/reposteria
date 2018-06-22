-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2018 a las 17:33:48
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_negocio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `total_producto` int(11) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `nombre`, `imagen`, `total_producto`, `estado`) VALUES
(1, 'pasteles', '5f9Xtk2WPRgQy4VTOuGf.jpg', NULL, 'activo'),
(2, 'empanadas', NULL, NULL, 'inactivo'),
(4, 'Tartas', NULL, NULL, 'inactivo'),
(16, 'pasteles', '0HXfZF1pZsPAgjoU56cI.jpg', NULL, 'activo'),
(17, 'empanadas', 'gh3jVqeeve7syk3TACCR.gif', NULL, 'activo'),
(18, 'patatas', 'KAlmROvmDaLOmYbdyVzs.jpg', NULL, 'activo'),
(19, 'patatas1', 'P70XHLwrOO755bnYSg0m.jpg', NULL, 'activo'),
(20, 'rosquillas', 'Eu7PbkJu4eZBuC01MsvZ.jpg', NULL, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `ci` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tipo` enum('frecuente','comun') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `ci`, `direccion`, `telefono`, `celular`, `email`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'dss', '123', 'sdfsd', 2423, 234, 'asd@asd.com', 'comun', '2018-06-15 22:56:19', '2018-06-15 22:56:19'),
(6, 'juan', '456', 'dsfsdfds', 4567, 675, 'juan@juan.com', 'comun', '2018-07-31 22:24:00', '2018-07-31 22:24:00'),
(7, 'filemon', '87876767', 'sin dir', 4567736, 77652353, 'filemon@filemon.com', 'comun', '2018-08-24 01:34:36', '2018-08-24 01:34:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `cantidad`, `subtotal`, `venta_id`, `producto_id`, `created_at`, `updated_at`) VALUES
(1, '3', 630, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `his_cantidad`
--

CREATE TABLE `his_cantidad` (
  `id` int(11) NOT NULL,
  `cantidad_anterior` int(11) DEFAULT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` enum('entrada','salida') DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `his_cantidad`
--

INSERT INTO `his_cantidad` (`id`, `cantidad_anterior`, `cantidad_actual`, `fecha`, `hora`, `tipo`, `producto_id`, `created_at`, `updated_at`) VALUES
(1, 22, 32, '2018-07-25', '19:29:05', 'entrada', 2, '2018-07-25 23:29:05', '2018-07-25 23:29:05'),
(2, 4, 8, '2018-07-25', '19:35:48', 'entrada', 1, '2018-07-25 23:35:48', '2018-07-25 23:35:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `nombre_ingrediente` varchar(45) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `unidad_medida` enum('kilogramo','gramo','miligramo') DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `saldo` decimal(11,2) DEFAULT NULL,
  `estado` enum('espera','preparado','entregado','cancelado') DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `hora_entrega` time DEFAULT NULL,
  `forma_de_pago` enum('tienda','banco','domicilio') DEFAULT NULL,
  `iva` decimal(11,2) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `saldo`, `estado`, `fecha`, `fecha_entrega`, `hora_entrega`, `forma_de_pago`, `iva`, `cliente_id`, `created_at`, `updated_at`, `cantidad`) VALUES
(1, '12.30', 'espera', '2018-07-06', '2018-07-07', '00:00:00', 'tienda', '12.30', 1, '2018-07-06 21:59:49', '2018-07-06 21:59:49', NULL),
(2, '30.30', 'entregado', '2018-07-07', '2018-07-10', '12:30:00', 'banco', '50.10', 1, '2018-07-06 22:15:54', '2018-07-06 22:15:54', NULL),
(3, '12.20', 'preparado', '2018-08-16', '2018-08-09', '14:02:00', 'tienda', '12.00', 1, '2018-08-14 22:34:40', '2018-08-14 22:34:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preparado`
--

CREATE TABLE `preparado` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `vencimiento` time DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preparado`
--

INSERT INTO `preparado` (`id`, `fecha`, `hora`, `vencimiento`, `cantidad`, `producto_id`, `pedido_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '2018-07-25', '18:37:16', '00:21:00', 12, 1, 1, 1, '2018-07-25 22:37:16', '2018-07-25 22:37:16'),
(2, '2018-07-25', '18:39:56', '00:12:00', 4, 2, 1, 1, '2018-07-25 22:39:56', '2018-07-25 22:39:56'),
(3, '2018-07-25', '18:43:06', '00:01:00', 2, 2, 1, 1, '2018-07-25 22:43:06', '2018-07-25 22:43:06'),
(4, '2018-07-25', '18:46:14', '01:01:00', 1, 1, 1, 1, '2018-07-25 22:46:14', '2018-07-25 22:46:14'),
(5, '2018-07-25', '18:48:14', '00:31:00', 1, 1, 1, 1, '2018-07-25 22:48:14', '2018-07-25 22:48:14'),
(6, '2018-07-25', '18:48:37', '02:02:00', 4, 2, 1, 1, '2018-07-25 22:48:37', '2018-07-25 22:48:37'),
(7, '2018-07-25', '19:29:05', '00:12:00', 10, 2, 1, 1, '2018-07-25 23:29:05', '2018-07-25 23:29:05'),
(8, '2018-07-25', '19:35:48', '00:12:00', 4, 1, 1, 1, '2018-07-25 23:35:48', '2018-07-25 23:35:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `costo` decimal(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `categoria_producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `costo`, `cantidad`, `descripcion`, `duracion`, `categoria_producto_id`, `created_at`, `updated_at`, `imagen`) VALUES
(1, 'chuntero', '20.30', 8, 'fdsfds', 2, 2, '2018-06-16 00:17:48', '2018-07-25 23:35:48', NULL),
(2, 'empanadas', '2.50', 32, 'agdgrutu', 2, 1, '2018-07-19 23:50:46', '2018-07-25 23:29:05', NULL),
(3, 'torta tres leches', '210.00', 10, 'descripcion de torta tres leches', 5, 1, '2018-08-17 17:16:24', '2018-08-22 18:20:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `estado` enum('vigente','expirado') DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estadodisponibilidad` enum('Disponible','Agotado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id`, `descuento`, `fecha`, `duracion`, `estado`, `producto_id`, `created_at`, `updated_at`, `estadodisponibilidad`) VALUES
(1, '12.30', '2018-07-06', '5', 'vigente', 1, '2018-07-06 23:32:18', '2018-07-06 23:47:28', NULL),
(2, '10.00', '2018-07-07', '3 horas', 'vigente', 1, '2018-07-06 23:37:59', '2018-07-06 23:37:59', NULL),
(3, '5.00', '2018-08-14', '10 horas', 'vigente', 1, '2018-08-14 22:35:39', '2018-08-14 22:35:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `direccion`, `telefono`, `celular`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(1, 'admin', 'nose', 23422, 324324, 'admin@admin.com', '$2y$10$XHNiWCcsSw0CMI//DjD5NelCB7o8eoVg5DphbqGcnPbrRm5PisDCO', 'sBAntCnfcY5Zs769Atm5oi263OX6FaYD9kCRvwvTD7Bfh50322oA3AVmGWKr', '2018-06-08 23:59:30', '2018-06-08 23:59:30', 'administrador'),
(2, 'said', 'asdas dsad sas dasd', 234, 234, 'saiddipp@hotmail.com', '$2y$10$unoELXeQi.jZbXNSVj4W2.iNl9PfBpEhcSMqXnSwmbEGByb6oPbBe', 'cJXkk7IFsoC4A1aRQyJgV0skBHSADOdDZdMAJHPGp878PnW1ILmRIfUxH2he', '2018-06-09 00:10:41', '2018-06-09 00:10:41', 'administrador'),
(3, 'gerardo', 'zona norte', 44493245, 78785423, 'gerarld@gmail.com', '$2y$10$b4ln2FA7cc2DxiOjx.k.OOS.W66z14OSpnl7BQ9aChNz5X/RGmD0m', 'FR96JLi7bzCyDys9TDnLYu5xdyZNLd0bUiYP7UJbUUttPUL3pW4KSRDUSOVF', '2018-06-12 19:09:24', '2018-06-12 19:09:24', 'administrador'),
(4, 'said', 'pacata', 354, 654654, 'said.dipp@rnova.net', '$2y$10$0Liw5R6t0ZRr.1s9E3hBN.1tTY6672On7HADwQPWCKuCWC.Kv6pgC', NULL, '2018-06-16 00:00:07', '2018-06-16 00:00:07', 'administrador'),
(5, 'roberto', 'askjfhasjkf', 124115, 334536, 'roberto@gmail.com', '$2y$10$Me0xzo/7u6zw3tZ0JvzWg.UfUzS2qpZ6S.z1dnJo1xycb2TgSbPGK', 'noWbyESlrtJMro0jXbiHpWueRElpTJGmYYg8X2SN15voRoSGNeTUKm6WBzIh', '2018-06-18 19:59:15', '2018-06-18 19:59:15', 'administrador'),
(6, 'said', 'zsfagf', 1231515, 534636, 'saiddipp@hotmail.comsaid', '$2y$10$Fh2FMIdmyJUwFACsjW/f7uCbRHs0rqVkYG7Z8dmLJsqASEOMIq9Hu', NULL, '2018-06-18 20:00:43', '2018-06-18 20:00:43', 'administrador'),
(7, 'dipp', 'dasrar', 12124, 4124125, 'said@gmail.com', '$2y$10$IZkyNCMuQlNsbAlzAQXcUep9A2HnLEyPLtxoJCU7R3xDFcsJ56Xcy', 'BnX3aVXfk62J82WSf9OBoWGvhycXSs7DCSyvU2aFomUPQTY5jLH5Pgby4Tyy', '2018-08-10 20:02:20', '2018-08-10 20:02:20', 'panadero'),
(8, 'willam', 'dsadsa', 3454, 435435, 'willam@mamani.com', '$2y$10$Ey9qzjgnEK4KiLTrty7DNeDWhz7k.ycgD8tjSUHp.hnfIrUkuHTIK', '0uzAco7v11ZGucljlTPEHx7szdgxjPpNQSya11hYCvoeZo9qiPaqByw2gjN0', '2018-08-11 02:19:37', '2018-08-11 02:19:37', 'panadero'),
(9, 'vendedor', 'sin dir', 4444444, 77777777, 'vendedor@rnova.net', '$2y$10$aVV3hfQXMc5DDBIQZKV9guicUMsJZBKlmqpWYwjhc9Ulw/FJvHFiK', NULL, '2018-08-17 17:23:01', '2018-08-17 17:23:01', 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_importe` decimal(11,2) DEFAULT NULL,
  `iva` decimal(11,2) DEFAULT NULL,
  `estado` enum('activo','cancelado') DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `hora`, `total`, `descuento`, `total_importe`, `iva`, `estado`, `cliente_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '2018-08-23', '10:28:06', '630.00', '0.00', '630.00', '0.00', 'activo', NULL, 1, '2018-08-24 02:28:06', '2018-08-24 02:28:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_pedido_pedido1_idx` (`pedido_id`),
  ADD KEY `fk_detalle_pedido_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_venta_venta1_idx` (`venta_id`),
  ADD KEY `fk_detalle_venta_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `his_cantidad`
--
ALTER TABLE `his_cantidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_his_cantidad_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingredientes_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_cliente1_idx` (`cliente_id`);

--
-- Indices de la tabla `preparado`
--
ALTER TABLE `preparado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_preparado_producto1_idx` (`producto_id`),
  ADD KEY `fk_preparado_pedido1_idx` (`pedido_id`),
  ADD KEY `fk_preparado_users1_idx` (`users_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria_producto1_idx` (`categoria_producto_id`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promocion_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venta_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_venta_users1_idx` (`users_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `his_cantidad`
--
ALTER TABLE `his_cantidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `preparado`
--
ALTER TABLE `preparado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedido_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `his_cantidad`
--
ALTER TABLE `his_cantidad`
  ADD CONSTRAINT `fk_his_cantidad_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD CONSTRAINT `fk_ingredientes_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preparado`
--
ALTER TABLE `preparado`
  ADD CONSTRAINT `fk_preparado_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_preparado_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_preparado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria_producto1` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD CONSTRAINT `fk_promocion_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
