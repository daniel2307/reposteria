-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2018 a las 04:51:20
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
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `nombre`, `imagen`, `estado`) VALUES
(1, 'Tartas', 'dSGd4l25vvTejhVmoMbO.jpg', 'activo'),
(16, 'Tartaletas', 'mfvLL7fxxr2ijheRVBE7.jpg', 'activo'),
(17, 'Gelatinas', 'L99eqoG0hN4Y78oxplQm.jpg', 'activo'),
(18, 'Pastelitos', 'Z0hqv85DVpc39ZDKh1dr.jpg', 'activo'),
(19, 'Galletas', 'UqlfjBkWE31t94POiq8w.jpg', 'activo'),
(20, 'Helados', 'SQ3ihQlGAsv63Kx1rsh8.jpg', 'activo');

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
  `tipo` enum('frecuente','comun') DEFAULT 'comun',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `ci`, `direccion`, `telefono`, `celular`, `email`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'dario', '123', 'sdfsd', 2423, 234, 'asdasd@asd.com', 'comun', '2018-06-16 02:56:19', '2018-08-31 20:49:34'),
(6, 'juan', '456', 'dsfsdfds', 4567, 675, 'juan@juan.com', 'comun', '2018-08-01 02:24:00', '2018-08-01 02:24:00'),
(7, 'filemon', '987', 'sin dir', 4567736, 77652353, 'filemon@filemon.com', 'comun', '2018-08-24 05:34:36', '2018-08-24 05:34:36'),
(8, 'pedro', '789', NULL, NULL, NULL, NULL, NULL, '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
(9, 'fer', '321', NULL, NULL, NULL, NULL, NULL, '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
(10, 'carlos', '654', NULL, NULL, NULL, NULL, NULL, '2018-08-27 00:14:02', '2018-08-27 00:14:02'),
(11, 'boris777', '7777777', NULL, NULL, NULL, NULL, 'comun', '2018-08-31 20:52:42', '2018-08-31 20:55:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `subtotal`, `descripcion`) VALUES
(1, 1, 3, 2, '200.00', 'sin descrip'),
(2, 5, 37, 1, '30.00', NULL),
(3, 5, 4, 1, '10.00', NULL),
(4, 6, 13, 1, '45.00', NULL);

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
(8, 7, 2, 10, '25.00'),
(9, 8, 43, 10, '100.00'),
(10, 9, 12, 1, '300.00'),
(12, 11, 43, 5, '50.00'),
(13, 12, 43, 10, '100.00');

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
  `acuenta` decimal(11,2) DEFAULT '0.00',
  `saldo` decimal(11,2) DEFAULT '0.00',
  `total` decimal(11,2) DEFAULT '0.00',
  `descuento` decimal(11,2) DEFAULT '0.00',
  `total_importe` decimal(11,2) DEFAULT '0.00',
  `tipo` enum('tienda','movil') DEFAULT NULL,
  `estado` enum('espera','preparado','entregado','cancelado') DEFAULT NULL,
  `forma_de_pago` enum('tienda','banco','domicilio') DEFAULT NULL,
  `comprobante` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `cliente_id`, `fecha`, `fecha_entrega`, `hora_entrega`, `acuenta`, `saldo`, `total`, `descuento`, `total_importe`, `tipo`, `estado`, `forma_de_pago`, `comprobante`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-07-06', '2018-07-07', '11:26:34', NULL, '12.30', '200.00', NULL, NULL, 'tienda', 'espera', 'tienda', NULL, '2018-07-07 01:59:49', '2018-07-07 01:59:49'),
(2, 7, '2018-07-07', '2018-07-10', '12:30:00', NULL, '30.30', '300.00', NULL, NULL, 'movil', 'entregado', 'banco', NULL, '2018-07-07 02:15:54', '2018-07-07 02:15:54'),
(3, 6, '2018-08-16', '2018-08-09', '14:02:00', NULL, '12.20', '100.00', NULL, NULL, 'tienda', 'preparado', 'tienda', NULL, '2018-08-15 02:34:40', '2018-08-15 02:34:40'),
(5, 6, '2018-09-01', '2018-09-01', '00:00:00', '20.00', '10.00', '40.00', '0.00', '40.00', 'tienda', 'espera', 'tienda', NULL, '2018-09-01 23:51:09', '2018-09-01 23:51:09'),
(6, 6, '2018-09-01', '2018-09-27', '11:00:00', '40.00', '5.00', '45.00', '0.00', '45.00', 'tienda', 'espera', 'domicilio', NULL, '2018-09-02 00:47:55', '2018-09-02 00:47:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preparado`
--

CREATE TABLE `preparado` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
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

INSERT INTO `preparado` (`id`, `producto_id`, `fecha`, `hora`, `vencimiento`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-07-25', '18:37:16', '00:21:00', 12, '2018-07-26 02:37:16', '2018-07-26 02:37:16'),
(2, 2, '2018-07-25', '18:39:56', '00:12:00', 4, '2018-07-26 02:39:56', '2018-07-26 02:39:56'),
(3, 2, '2018-07-25', '18:43:06', '00:01:00', 2, '2018-07-26 02:43:06', '2018-07-26 02:43:06'),
(4, 1, '2018-07-25', '18:46:14', '01:01:00', 1, '2018-07-26 02:46:14', '2018-07-26 02:46:14'),
(5, 1, '2018-07-25', '18:48:14', '00:31:00', 1, '2018-07-26 02:48:14', '2018-07-26 02:48:14'),
(6, 2, '2018-07-25', '18:48:37', '02:02:00', 4, '2018-07-26 02:48:37', '2018-07-26 02:48:37'),
(7, 2, '2018-07-25', '19:29:05', '00:12:00', 10, '2018-07-26 03:29:05', '2018-07-26 03:29:05'),
(8, 1, '2018-07-25', '19:35:48', '00:12:00', 4, '2018-07-26 03:35:48', '2018-07-26 03:35:48');

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
  `estado` enum('activo','eliminado') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `categoria_producto_id`, `nombre`, `costo`, `cantidad`, `descripcion`, `duracion`, `imagen`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '5 frutas', '20.30', 0, 'fdsfds', 2, 'UhVirT94oLLLVazILdiX.jpg', 'activo', '2018-06-16 04:17:48', '2018-08-31 19:01:29'),
(2, 1, 'Trebol', '2.50', 0, 'agdgrutu', 2, NULL, 'eliminado', '2018-07-20 03:50:46', '2018-08-31 19:06:56'),
(3, 1, 'frutas extra', '210.00', 0, 'descripcion de torta tres leches', 5, 'MP62H1wzF9ako7yvndQt.jpg', 'activo', '2018-08-17 21:16:24', '2018-08-31 19:10:01'),
(4, 1, 'mosaico', '10.00', 0, 'asd', NULL, NULL, 'eliminado', '2018-08-27 07:13:43', '2018-08-31 19:07:30'),
(5, 1, 'queso', '100.00', 0, 'fgh', NULL, NULL, 'eliminado', '2018-08-27 07:14:23', '2018-08-31 19:07:45'),
(6, 1, 'Tarta de queso', '200.00', 0, NULL, NULL, 'ZD1VluaxXtacVKR0cfmy.jpg', 'activo', '2018-08-27 07:15:05', '2018-08-31 19:12:57'),
(7, 1, 'Tarta de limon', '100.00', 0, NULL, NULL, 'eoVfFZOjpYDoDUfY9i6s.jpg', 'activo', '2018-08-27 07:15:30', '2018-08-31 19:14:10'),
(8, 1, 'tarta de manzana', '400.00', 0, NULL, NULL, 'gEchTHMa9Xe3pdEXhm91.jpg', 'activo', '2018-08-27 07:15:45', '2018-08-31 19:15:29'),
(9, 1, 'tartaleta de manzana', '121.00', 0, NULL, NULL, 'ECTeqMujs95z2fWmEzjy.jpg', 'activo', '2018-08-27 07:16:11', '2018-08-31 19:17:27'),
(10, 1, 'tarta de durazno', '101.00', 0, NULL, NULL, 'lGjS93P5jBTU0mmY216P.jpg', 'activo', '2018-08-27 07:16:28', '2018-08-31 19:25:46'),
(11, 1, 'tarta de uva', '200.00', 0, NULL, NULL, 'HOQBPIjxORxeqrcokY7w.jpg', 'activo', '2018-08-27 07:16:45', '2018-08-31 19:24:13'),
(12, 1, 'fresa', '300.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 07:17:22', '2018-09-03 16:20:47'),
(13, 16, 'barcos', '45.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 07:18:42', '2018-08-27 07:18:42'),
(14, 16, 'tartaleta de ceresas', '64.00', 0, NULL, NULL, 'CYGmOsgG2SvUr0qwlRhz.jpg', 'activo', '2018-08-27 07:19:04', '2018-08-31 19:20:17'),
(15, 16, 'queso', '75.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(16, 16, 'chocolate', '74.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(17, 16, 'limon', '45.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-04 01:29:59'),
(18, 16, 'manzana con hojaldre', '68.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(19, 16, 'Gelatinas clasicas', '32.00', 0, NULL, NULL, '0ANdb0GyMmPhj2ZZOEo5.png', 'activo', '2018-08-27 04:00:00', '2018-08-31 19:29:22'),
(20, 16, 'gelatina de piña', '89.00', 0, NULL, NULL, 'CDSDkWBKzk5zciQAUlyk.jpg', 'activo', '2018-08-27 04:00:00', '2018-08-31 19:31:03'),
(21, 16, 'combinada', '45.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(22, 16, 'fresa', '25.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(23, 16, 'mango', '28.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(24, 16, 'uva', '65.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(25, 17, 'corazon', '32.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(26, 17, 'figuras o decoradas', '15.00', 0, NULL, NULL, '1g3nE4TP6hA6d1LBpG1X.jpg', 'activo', '2018-08-27 04:00:00', '2018-08-31 19:39:19'),
(27, 17, 'individuales de leche', '15.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(28, 17, 'rosca durazno', '65.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(29, 17, 'rosca mosaico', '8.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(30, 17, 'rosca tres sabores', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(31, 19, 'sable', '60.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(32, 19, 'sultana', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(33, 19, 'besos', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(34, 19, 'nuez', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(35, 19, 'canela', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(36, 19, 'mini orejas', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(37, 19, 'chispas de chocolate', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(38, 19, 'merengue', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(39, 18, 'choux', '40.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-04 01:36:08'),
(40, 18, 'cisne', '30.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-04 01:36:00'),
(41, 20, 'helados', '10.00', 0, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(42, 16, 'tartas con frutas', '20.00', 0, 'wtwetwywy', 4, 'C2Cs4K6G222bmMJPuKof.jpg', 'activo', '2018-08-31 19:06:32', '2018-09-04 01:35:26'),
(43, 17, 'Gelatina de piña', '10.00', 0, 'asgatata', 12, 'lXRv2RBO4Kj91dJAuuTQ.jpg', 'activo', '2018-08-31 19:32:51', '2018-09-04 02:45:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT '0',
  `unidad` enum('dias','horas') DEFAULT NULL,
  `cantidad` int(11) DEFAULT '0',
  `precio` decimal(11,2) DEFAULT '0.00',
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `estado` enum('vigente','expirado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id`, `producto_id`, `fecha`, `duracion`, `unidad`, `cantidad`, `precio`, `fecha_inicio`, `fecha_fin`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-07-06 00:00:00', 5, 'dias', 0, '12.30', NULL, NULL, 'vigente', '2018-07-07 03:32:18', '2018-07-07 03:47:28'),
(2, 1, '2018-07-07 00:00:00', 3, 'dias', 0, '10.00', NULL, NULL, 'vigente', '2018-07-07 03:37:59', '2018-07-07 03:37:59'),
(3, 1, '2018-08-14 00:00:00', 10, 'dias', 0, '5.00', NULL, NULL, 'vigente', '2018-08-15 02:35:39', '2018-08-15 02:35:39'),
(4, 37, '2018-08-31 16:36:51', 1, 'horas', 0, '20.00', NULL, NULL, 'vigente', '2018-08-31 21:36:51', '2018-08-31 21:36:51'),
(5, 32, '2018-08-31 16:45:45', 2, 'dias', 0, '5.00', NULL, NULL, 'vigente', '2018-08-31 21:45:45', '2018-08-31 21:45:45'),
(6, 35, '2018-09-01 22:22:54', 4, 'dias', 10, '5.00', '2018-09-01 00:00:00', '2018-09-05 00:00:00', 'vigente', '2018-09-02 02:22:54', '2018-09-02 02:22:54');

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
  `rol` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `direccion`, `telefono`, `celular`, `email`, `password`, `remember_token`, `rol`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'nose', 23422, 324324, 'admin@admin.com', '$2y$10$XHNiWCcsSw0CMI//DjD5NelCB7o8eoVg5DphbqGcnPbrRm5PisDCO', 'e86HSFFAnKMFW9SP1SvKcM4gaslbzdShzyAwFrXSerVSgmnt1DX7Fl2rrWZ4', 'administrador', '2018-06-09 03:59:30', '2018-06-09 03:59:30'),
(2, 'said', 'asdas dsad sas dasd', 234, 234, 'saiddipp@hotmail.com', '$2y$10$unoELXeQi.jZbXNSVj4W2.iNl9PfBpEhcSMqXnSwmbEGByb6oPbBe', 'cJXkk7IFsoC4A1aRQyJgV0skBHSADOdDZdMAJHPGp878PnW1ILmRIfUxH2he', 'administrador', '2018-06-09 04:10:41', '2018-06-09 04:10:41'),
(3, 'gerardo', 'zona norte', 44493245, 78785423, 'gerarld@gmail.com', '$2y$10$b4ln2FA7cc2DxiOjx.k.OOS.W66z14OSpnl7BQ9aChNz5X/RGmD0m', 'FR96JLi7bzCyDys9TDnLYu5xdyZNLd0bUiYP7UJbUUttPUL3pW4KSRDUSOVF', 'administrador', '2018-06-12 23:09:24', '2018-06-12 23:09:24'),
(4, 'said', 'pacata', 354, 654654, 'said.dipp@rnova.net', '$2y$10$0Liw5R6t0ZRr.1s9E3hBN.1tTY6672On7HADwQPWCKuCWC.Kv6pgC', NULL, 'administrador', '2018-06-16 04:00:07', '2018-06-16 04:00:07'),
(5, 'roberto', 'askjfhasjkf', 124115, 334536, 'roberto@gmail.com', '$2y$10$Me0xzo/7u6zw3tZ0JvzWg.UfUzS2qpZ6S.z1dnJo1xycb2TgSbPGK', 'noWbyESlrtJMro0jXbiHpWueRElpTJGmYYg8X2SN15voRoSGNeTUKm6WBzIh', 'administrador', '2018-06-18 23:59:15', '2018-06-18 23:59:15'),
(6, 'said', 'zsfagf', 1231515, 534636, 'saiddipp@hotmail.comsaid', '$2y$10$Fh2FMIdmyJUwFACsjW/f7uCbRHs0rqVkYG7Z8dmLJsqASEOMIq9Hu', NULL, 'administrador', '2018-06-19 00:00:43', '2018-06-19 00:00:43'),
(7, 'dipp', 'dasrar', 12124, 4124125, 'said@gmail.com', '$2y$10$IZkyNCMuQlNsbAlzAQXcUep9A2HnLEyPLtxoJCU7R3xDFcsJ56Xcy', 'BnX3aVXfk62J82WSf9OBoWGvhycXSs7DCSyvU2aFomUPQTY5jLH5Pgby4Tyy', 'panadero', '2018-08-11 00:02:20', '2018-08-11 00:02:20'),
(8, 'willam', 'dsadsa', 3454, 435435, 'willam@mamani.com', '$2y$10$Ey9qzjgnEK4KiLTrty7DNeDWhz7k.ycgD8tjSUHp.hnfIrUkuHTIK', '0uzAco7v11ZGucljlTPEHx7szdgxjPpNQSya11hYCvoeZo9qiPaqByw2gjN0', 'panadero', '2018-08-11 06:19:37', '2018-08-11 06:19:37'),
(9, 'vendedor', 'sin dir', 4444444, 77777777, 'vendedor@rnova.net', '$2y$10$aVV3hfQXMc5DDBIQZKV9guicUMsJZBKlmqpWYwjhc9Ulw/FJvHFiK', NULL, 'vendedor', '2018-08-17 21:23:01', '2018-08-17 21:23:01');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `cliente_id`, `users_id`, `fecha`, `total`, `descuento`, `total_importe`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-08-23 00:00:00', '630.00', '0.00', '630.00', '2018-08-24 06:28:06', '2018-08-24 06:28:06'),
(2, 6, 1, '2018-06-22 00:00:00', '210.00', '10.00', '200.00', '2018-06-23 05:32:17', '2018-06-23 05:32:17'),
(3, 7, 1, '2018-06-22 00:00:00', '442.50', '0.00', '442.50', '2018-06-23 05:39:03', '2018-06-23 05:39:03'),
(4, 6, 1, '2018-06-22 00:00:00', '20.30', '0.00', '20.30', '2018-06-23 05:08:15', '2018-06-23 05:08:15'),
(5, 8, 1, '2018-08-26 00:00:00', '420.00', '20.00', '400.00', '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
(6, 9, 1, '2018-08-26 15:55:53', '121.80', '0.00', '121.80', '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
(7, 10, 1, '2018-08-26 20:14:02', '25.00', '0.00', '25.00', '2018-08-27 00:14:02', '2018-08-27 00:14:02'),
(8, 8, 1, '2018-09-02 11:28:57', '100.00', '0.00', '100.00', '2018-09-02 15:28:57', '2018-09-02 15:28:57'),
(9, 8, 1, '2018-09-03 12:20:47', '300.00', '0.00', '300.00', '2018-09-03 16:20:47', '2018-09-03 16:20:47'),
(11, 7, 1, '2018-09-03 21:57:29', '50.00', '0.00', '50.00', '2018-09-04 01:57:29', '2018-09-04 01:57:29'),
(12, 7, 1, '2018-09-03 22:45:42', '100.00', '0.00', '100.00', '2018-09-04 02:45:42', '2018-09-04 02:45:42');

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
  ADD KEY `fk_preparado_producto1_idx` (`producto_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `preparado`
--
ALTER TABLE `preparado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  ADD CONSTRAINT `fk_preparado_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
