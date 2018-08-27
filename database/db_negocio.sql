-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-08-2018 a las 04:21:09
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

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
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `nombre`, `imagen`, `estado`) VALUES
(1, 'pasteles', '5f9Xtk2WPRgQy4VTOuGf.jpg', 'activo'),
(2, 'empanadas', NULL, 'inactivo'),
(4, 'Tartas', NULL, 'inactivo'),
(16, 'pasteles', '0HXfZF1pZsPAgjoU56cI.jpg', 'activo'),
(17, 'empanadas', 'gh3jVqeeve7syk3TACCR.gif', 'activo'),
(18, 'patatas', 'KAlmROvmDaLOmYbdyVzs.jpg', 'activo'),
(19, 'patatas1', 'P70XHLwrOO755bnYSg0m.jpg', 'activo'),
(20, 'rosquillas', 'Eu7PbkJu4eZBuC01MsvZ.jpg', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `ci` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
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

INSERT INTO `cliente` (`id`, `nombre`, `ci`, `password`, `direccion`, `telefono`, `celular`, `email`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'dss', '123', NULL, 'sdfsd', 2423, 234, 'asd@asd.com', 'comun', '2018-06-16 02:56:19', '2018-06-16 02:56:19'),
(6, 'juan', '456', NULL, 'dsfsdfds', 4567, 675, 'juan@juan.com', 'comun', '2018-08-01 02:24:00', '2018-08-01 02:24:00'),
(7, 'filemon', '87876767', NULL, 'sin dir', 4567736, 77652353, 'filemon@filemon.com', 'comun', '2018-08-24 05:34:36', '2018-08-24 05:34:36'),
(8, 'juan', '456', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
(9, 'dss', '123', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
(10, 'dss', '123', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-27 00:14:02', '2018-08-27 00:14:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `subtotal`, `descripcion`) VALUES
(1, 1, 3, 2, '200.00', 'sin descrip');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `venta_id`, `producto_id`, `cantidad`, `subtotal`) VALUES
(1, 1, 3, 3, '630.00'),
(2, 2, 3, 1, '210.00'),
(3, 3, 3, 2, '420.00'),
(4, 3, 2, 9, '22.50'),
(5, 4, 1, 1, '20.30'),
(6, 5, 3, 2, '420.00'),
(7, 6, 1, 6, '121.80'),
(8, 7, 2, 10, '25.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `his_cantidad`
--

CREATE TABLE `his_cantidad` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad_anterior` int(11) DEFAULT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` enum('entrada','salida') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `his_cantidad`
--

INSERT INTO `his_cantidad` (`id`, `producto_id`, `cantidad_anterior`, `cantidad_actual`, `fecha`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 2, 22, 32, '2018-07-25 00:00:00', 'entrada', '2018-07-26 03:29:05', '2018-07-26 03:29:05'),
(2, 1, 4, 8, '2018-07-25 00:00:00', 'entrada', '2018-07-26 03:35:48', '2018-07-26 03:35:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `nombre_ingrediente` varchar(45) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `unidad_medida` enum('kilogramo','gramo','miligramo') DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `cliente_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `hora_entrega` time DEFAULT NULL,
  `acuenta` decimal(11,2) DEFAULT NULL,
  `saldo` decimal(11,2) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_importe` decimal(11,2) DEFAULT NULL,
  `iva` decimal(11,2) DEFAULT NULL,
  `tipo` enum('tienda','movil') NOT NULL,
  `estado` enum('espera','preparado','entregado','cancelado') DEFAULT NULL,
  `forma_de_pago` enum('tienda','banco','domicilio') DEFAULT NULL,
  `comprobante` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `cliente_id`, `fecha`, `fecha_entrega`, `hora_entrega`, `acuenta`, `saldo`, `total`, `descuento`, `total_importe`, `iva`, `tipo`, `estado`, `forma_de_pago`, `comprobante`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-07-06', '2018-07-07', '00:00:00', NULL, '12.30', '200.00', NULL, NULL, '12.30', 'tienda', 'espera', 'tienda', NULL, '2018-07-07 01:59:49', '2018-07-07 01:59:49'),
(2, 1, '2018-07-07', '2018-07-10', '12:30:00', NULL, '30.30', '300.00', NULL, NULL, '50.10', 'movil', 'entregado', 'banco', NULL, '2018-07-07 02:15:54', '2018-07-07 02:15:54'),
(3, 1, '2018-08-16', '2018-08-09', '14:02:00', NULL, '12.20', '100.00', NULL, NULL, '12.00', 'tienda', 'preparado', 'tienda', NULL, '2018-08-15 02:34:40', '2018-08-15 02:34:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preparado`
--

CREATE TABLE `preparado` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `vencimiento` time DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preparado`
--

INSERT INTO `preparado` (`id`, `producto_id`, `pedido_id`, `users_id`, `fecha`, `hora`, `vencimiento`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2018-07-25', '18:37:16', '00:21:00', 12, '2018-07-26 02:37:16', '2018-07-26 02:37:16'),
(2, 2, 1, 1, '2018-07-25', '18:39:56', '00:12:00', 4, '2018-07-26 02:39:56', '2018-07-26 02:39:56'),
(3, 2, 1, 1, '2018-07-25', '18:43:06', '00:01:00', 2, '2018-07-26 02:43:06', '2018-07-26 02:43:06'),
(4, 1, 1, 1, '2018-07-25', '18:46:14', '01:01:00', 1, '2018-07-26 02:46:14', '2018-07-26 02:46:14'),
(5, 1, 1, 1, '2018-07-25', '18:48:14', '00:31:00', 1, '2018-07-26 02:48:14', '2018-07-26 02:48:14'),
(6, 2, 1, 1, '2018-07-25', '18:48:37', '02:02:00', 4, '2018-07-26 02:48:37', '2018-07-26 02:48:37'),
(7, 2, 1, 1, '2018-07-25', '19:29:05', '00:12:00', 10, '2018-07-26 03:29:05', '2018-07-26 03:29:05'),
(8, 1, 1, 1, '2018-07-25', '19:35:48', '00:12:00', 4, '2018-07-26 03:35:48', '2018-07-26 03:35:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `categoria_producto_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `costo` decimal(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `categoria_producto_id`, `nombre`, `costo`, `cantidad`, `descripcion`, `duracion`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 2, 'chuntero', '20.30', 8, 'fdsfds', 2, NULL, '2018-06-16 04:17:48', '2018-07-26 03:35:48'),
(2, 1, 'empanadas', '2.50', 32, 'agdgrutu', 2, NULL, '2018-07-20 03:50:46', '2018-07-26 03:29:05'),
(3, 1, 'torta tres leches', '210.00', 10, 'descripcion de torta tres leches', 5, NULL, '2018-08-17 21:16:24', '2018-08-22 22:20:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `unidad` enum('dias','horas') NOT NULL,
  `estado` enum('vigente','expirado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id`, `producto_id`, `descuento`, `fecha`, `duracion`, `unidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '12.30', '2018-07-06 00:00:00', 5, 'dias', 'vigente', '2018-07-07 03:32:18', '2018-07-07 03:47:28'),
(2, 1, '10.00', '2018-07-07 00:00:00', 3, 'dias', 'vigente', '2018-07-07 03:37:59', '2018-07-07 03:37:59'),
(3, 1, '5.00', '2018-08-14 00:00:00', 10, 'dias', 'vigente', '2018-08-15 02:35:39', '2018-08-15 02:35:39');

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
(1, 'admin', 'nose', 23422, 324324, 'admin@admin.com', '$2y$10$XHNiWCcsSw0CMI//DjD5NelCB7o8eoVg5DphbqGcnPbrRm5PisDCO', '221Xqpncp1iR5Fspqd4sWMYy4kH3eWKEV4CxBZAqhRFrYJG7eLnblcevo2JY', '2018-06-09 03:59:30', '2018-06-09 03:59:30', 'administrador'),
(2, 'said', 'asdas dsad sas dasd', 234, 234, 'saiddipp@hotmail.com', '$2y$10$unoELXeQi.jZbXNSVj4W2.iNl9PfBpEhcSMqXnSwmbEGByb6oPbBe', 'cJXkk7IFsoC4A1aRQyJgV0skBHSADOdDZdMAJHPGp878PnW1ILmRIfUxH2he', '2018-06-09 04:10:41', '2018-06-09 04:10:41', 'administrador'),
(3, 'gerardo', 'zona norte', 44493245, 78785423, 'gerarld@gmail.com', '$2y$10$b4ln2FA7cc2DxiOjx.k.OOS.W66z14OSpnl7BQ9aChNz5X/RGmD0m', 'FR96JLi7bzCyDys9TDnLYu5xdyZNLd0bUiYP7UJbUUttPUL3pW4KSRDUSOVF', '2018-06-12 23:09:24', '2018-06-12 23:09:24', 'administrador'),
(4, 'said', 'pacata', 354, 654654, 'said.dipp@rnova.net', '$2y$10$0Liw5R6t0ZRr.1s9E3hBN.1tTY6672On7HADwQPWCKuCWC.Kv6pgC', NULL, '2018-06-16 04:00:07', '2018-06-16 04:00:07', 'administrador'),
(5, 'roberto', 'askjfhasjkf', 124115, 334536, 'roberto@gmail.com', '$2y$10$Me0xzo/7u6zw3tZ0JvzWg.UfUzS2qpZ6S.z1dnJo1xycb2TgSbPGK', 'noWbyESlrtJMro0jXbiHpWueRElpTJGmYYg8X2SN15voRoSGNeTUKm6WBzIh', '2018-06-18 23:59:15', '2018-06-18 23:59:15', 'administrador'),
(6, 'said', 'zsfagf', 1231515, 534636, 'saiddipp@hotmail.comsaid', '$2y$10$Fh2FMIdmyJUwFACsjW/f7uCbRHs0rqVkYG7Z8dmLJsqASEOMIq9Hu', NULL, '2018-06-19 00:00:43', '2018-06-19 00:00:43', 'administrador'),
(7, 'dipp', 'dasrar', 12124, 4124125, 'said@gmail.com', '$2y$10$IZkyNCMuQlNsbAlzAQXcUep9A2HnLEyPLtxoJCU7R3xDFcsJ56Xcy', 'BnX3aVXfk62J82WSf9OBoWGvhycXSs7DCSyvU2aFomUPQTY5jLH5Pgby4Tyy', '2018-08-11 00:02:20', '2018-08-11 00:02:20', 'panadero'),
(8, 'willam', 'dsadsa', 3454, 435435, 'willam@mamani.com', '$2y$10$Ey9qzjgnEK4KiLTrty7DNeDWhz7k.ycgD8tjSUHp.hnfIrUkuHTIK', '0uzAco7v11ZGucljlTPEHx7szdgxjPpNQSya11hYCvoeZo9qiPaqByw2gjN0', '2018-08-11 06:19:37', '2018-08-11 06:19:37', 'panadero'),
(9, 'vendedor', 'sin dir', 4444444, 77777777, 'vendedor@rnova.net', '$2y$10$aVV3hfQXMc5DDBIQZKV9guicUMsJZBKlmqpWYwjhc9Ulw/FJvHFiK', NULL, '2018-08-17 21:23:01', '2018-08-17 21:23:01', 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_importe` decimal(11,2) DEFAULT NULL,
  `iva` decimal(11,2) DEFAULT NULL,
  `estado` enum('activo','cancelado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `cliente_id`, `users_id`, `fecha`, `total`, `descuento`, `total_importe`, `iva`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-08-23 00:00:00', '630.00', '0.00', '630.00', '0.00', 'activo', '2018-08-24 06:28:06', '2018-08-24 06:28:06'),
(2, 6, 1, '2018-06-22 00:00:00', '210.00', '10.00', '200.00', '0.00', 'activo', '2018-06-23 05:32:17', '2018-06-23 05:32:17'),
(3, 7, 1, '2018-06-22 00:00:00', '442.50', '0.00', '442.50', '0.00', 'activo', '2018-06-23 05:39:03', '2018-06-23 05:39:03'),
(4, 6, 1, '2018-06-22 00:00:00', '20.30', '0.00', '20.30', '0.00', 'activo', '2018-06-23 05:08:15', '2018-06-23 05:08:15'),
(5, 8, 1, '2018-08-26 00:00:00', '420.00', '20.00', '400.00', '0.00', 'activo', '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
(6, 9, 1, '2018-08-26 15:55:53', '121.80', '0.00', '121.80', '0.00', 'activo', '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
(7, 10, 1, '2018-08-26 20:14:02', '25.00', '0.00', '25.00', '0.00', 'activo', '2018-08-27 00:14:02', '2018-08-27 00:14:02');

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
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foren ky` (`producto_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `FK_lote_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
