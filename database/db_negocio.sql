-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2018 a las 18:06:09
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
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
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
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `ci` varchar(45) DEFAULT NULL,
  `tipo` enum('frecuente','comun') DEFAULT 'comun',
  `estado` enum('activo','eliminado') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `user_id`, `nombre`, `ci`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, NULL, 'dario', '123', 'comun', 'activo', '2018-06-16 02:56:19', '2018-08-31 20:49:34'),
(6, NULL, 'juan', '456', 'comun', 'activo', '2018-08-01 02:24:00', '2018-08-01 02:24:00'),
(7, NULL, 'filemon', '987', 'comun', 'activo', '2018-08-24 05:34:36', '2018-08-24 05:34:36'),
(8, NULL, 'pedro', '789', 'comun', 'activo', '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
(9, 12, 'fer', '321', 'comun', 'activo', '2018-08-26 19:55:53', '2018-09-25 20:56:11'),
(10, 5, 'carlos', '654', 'comun', 'activo', '2018-08-27 00:14:02', '2018-08-27 00:14:02'),
(18, 18, 'oliver galarga', '55555', 'comun', 'activo', '2018-09-25 21:04:34', '2018-09-25 21:04:34');

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
(4, 6, 13, 1, '45.00', 'no tiene descripcion'),
(15, 5, 37, 2, '60.00', 'ddddddddddddd'),
(16, 5, 4, 2, '20.00', 'aaaaaaaaaaa'),
(17, 5, 1, 1, '20.30', 'wwwwwwwwwwww');

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
(13, 12, 43, 10, '100.00'),
(14, 13, 3, 1, '210.00'),
(15, 14, 4, 10, '100.00');

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

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `producto_id`, `nombre_ingrediente`, `cantidad`, `unidad_medida`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'arina', '20', 'kilogramo', 'sin descrip', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(2, 1, 'arina', '20', 'kilogramo', 'sin descrip', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(3, 1, 'arina', '20', 'kilogramo', 'sin descrip', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
(4, 1, 'arina', '20', 'kilogramo', 'sin descrip', '2018-08-27 04:00:00', '2018-08-27 04:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id`, `producto_id`, `cantidad`, `fecha`, `estado`) VALUES
(14, 43, 30, '2018-09-07 15:01:27', 'activo'),
(15, 42, 30, '2018-09-07 15:01:30', 'activo'),
(16, 41, 40, '2018-09-07 15:01:33', 'activo'),
(17, 40, 50, '2018-09-07 15:01:35', 'activo'),
(18, 39, 60, '2018-09-07 15:01:38', 'activo'),
(19, 38, 70, '2018-09-07 15:01:42', 'activo'),
(20, 37, 30, '2018-09-07 15:01:45', 'activo'),
(21, 36, 60, '2018-09-07 15:01:48', 'activo'),
(22, 35, 70, '2018-09-07 15:01:50', 'activo'),
(23, 34, 60, '2018-09-07 15:01:53', 'activo'),
(24, 33, 70, '2018-09-07 15:02:01', 'activo'),
(25, 32, 60, '2018-09-07 15:02:16', 'activo'),
(26, 31, 30, '2018-09-07 15:02:35', 'activo'),
(27, 24, 30, '2018-09-07 15:02:46', 'activo'),
(28, 13, 50, '2018-09-07 15:02:55', 'activo'),
(29, 6, 40, '2018-09-07 15:03:13', 'activo'),
(30, 1, 50, '2018-09-07 15:03:19', 'activo'),
(31, 3, 57, '2018-09-07 15:03:27', 'activo'),
(32, 7, 40, '2018-09-07 15:03:34', 'activo'),
(33, 10, 60, '2018-09-07 15:03:45', 'activo'),
(34, 12, 60, '2018-09-07 15:03:53', 'activo'),
(35, 11, 70, '2018-09-07 15:03:58', 'activo'),
(36, 9, 40, '2018-09-07 15:04:05', 'activo'),
(37, 8, 50, '2018-09-07 15:04:09', 'activo'),
(38, 23, 40, '2018-09-07 15:04:20', 'activo'),
(39, 22, 100, '2018-09-07 15:04:29', 'activo'),
(40, 25, 55, '2018-09-07 15:04:36', 'activo'),
(41, 28, 44, '2018-09-07 15:04:40', 'activo'),
(42, 18, 63, '2018-09-07 15:04:47', 'activo'),
(43, 19, 44, '2018-09-07 15:04:53', 'activo'),
(44, 20, 86, '2018-09-07 15:04:58', 'activo'),
(45, 17, 78, '2018-09-07 15:05:04', 'activo'),
(46, 16, 55, '2018-09-07 15:05:12', 'activo'),
(47, 15, 78, '2018-09-07 15:05:16', 'activo'),
(48, 14, 37, '2018-09-07 15:05:20', 'activo'),
(49, 21, 69, '2018-09-07 15:05:26', 'activo'),
(50, 30, 88, '2018-09-07 15:05:37', 'activo'),
(51, 29, 78, '2018-09-07 15:05:43', 'activo'),
(52, 27, 45, '2018-09-07 15:05:49', 'activo'),
(53, 26, 21, '2018-09-07 15:05:55', 'activo'),
(54, 2, 32, '2018-09-07 21:14:30', 'activo'),
(55, 5, 56, '2018-09-07 21:14:44', 'activo'),
(56, 4, 23, '2018-09-07 21:14:51', 'activo');

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
  `descuento` decimal(11,2) NOT NULL DEFAULT '0.00',
  `total_importe` decimal(11,2) DEFAULT '0.00',
  `tipo` enum('tienda','movil') DEFAULT NULL,
  `estado` enum('espera','preparado','entregado','cancelado') NOT NULL DEFAULT 'espera',
  `forma_de_pago` enum('tienda','banco','domicilio') DEFAULT NULL,
  `comprobante` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `cliente_id`, `fecha`, `fecha_entrega`, `hora_entrega`, `acuenta`, `saldo`, `total`, `descuento`, `total_importe`, `tipo`, `estado`, `forma_de_pago`, `comprobante`, `created_at`, `updated_at`) VALUES
(5, 6, '2018-09-01', '2018-09-30', '12:00:00', '20.00', '80.30', '100.30', '0.00', '100.30', 'tienda', 'entregado', 'banco', NULL, '2018-09-01 23:51:09', '2018-09-22 16:01:46'),
(6, 6, '2018-09-01', '2018-09-28', '11:00:00', '40.00', '5.00', '45.00', '0.00', '45.00', 'tienda', 'cancelado', 'domicilio', NULL, '2018-09-02 00:47:55', '2018-09-22 16:05:11');

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
(1, 1, '5 frutas', '20.30', 50, 'fdsfds', 2, 'UhVirT94oLLLVazILdiX.jpg', 'activo', '2018-06-16 04:17:48', '2018-09-07 19:03:19'),
(2, 1, 'Trebol', '2.50', 32, 'agdgrutu', 2, NULL, 'activo', '2018-07-20 03:50:46', '2018-09-08 01:14:30'),
(3, 1, 'frutas extra', '210.00', 57, 'descripcion de torta tres leches', 5, 'MP62H1wzF9ako7yvndQt.jpg', 'activo', '2018-08-17 21:16:24', '2018-09-22 17:22:34'),
(4, 1, 'mosaico', '10.00', 23, 'asd', NULL, NULL, 'activo', '2018-08-27 07:13:43', '2018-09-17 13:33:18'),
(5, 1, 'queso', '100.00', 56, 'fgh', NULL, NULL, 'activo', '2018-08-27 07:14:23', '2018-09-08 01:14:44'),
(6, 1, 'Tarta de queso', '200.00', 40, NULL, NULL, 'ZD1VluaxXtacVKR0cfmy.jpg', 'activo', '2018-08-27 07:15:05', '2018-09-07 19:03:13'),
(7, 1, 'Tarta de limon', '100.00', 40, NULL, NULL, 'eoVfFZOjpYDoDUfY9i6s.jpg', 'activo', '2018-08-27 07:15:30', '2018-09-07 19:03:34'),
(8, 1, 'tarta de manzana', '400.00', 50, NULL, NULL, 'gEchTHMa9Xe3pdEXhm91.jpg', 'activo', '2018-08-27 07:15:45', '2018-09-07 19:04:09'),
(9, 1, 'tartaleta de manzana', '121.00', 40, NULL, NULL, 'ECTeqMujs95z2fWmEzjy.jpg', 'activo', '2018-08-27 07:16:11', '2018-09-07 19:04:05'),
(10, 1, 'tarta de durazno', '101.00', 60, NULL, NULL, 'lGjS93P5jBTU0mmY216P.jpg', 'activo', '2018-08-27 07:16:28', '2018-09-07 19:03:45'),
(11, 1, 'tarta de uva', '200.00', 70, NULL, NULL, 'HOQBPIjxORxeqrcokY7w.jpg', 'activo', '2018-08-27 07:16:45', '2018-09-07 19:03:58'),
(12, 1, 'fresa', '300.00', 60, NULL, NULL, NULL, 'activo', '2018-08-27 07:17:22', '2018-09-07 19:03:53'),
(13, 16, 'barcos', '45.00', 50, NULL, NULL, NULL, 'activo', '2018-08-27 07:18:42', '2018-09-07 19:02:55'),
(14, 16, 'tartaleta de ceresas', '64.00', 37, NULL, NULL, 'CYGmOsgG2SvUr0qwlRhz.jpg', 'activo', '2018-08-27 07:19:04', '2018-09-07 19:05:20'),
(15, 16, 'queso', '75.00', 78, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:16'),
(16, 16, 'chocolate', '74.00', 55, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:12'),
(17, 16, 'limon', '45.00', 78, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:04'),
(18, 16, 'manzana con hojaldre', '68.00', 63, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:47'),
(19, 16, 'Gelatinas clasicas', '32.00', 44, NULL, NULL, '0ANdb0GyMmPhj2ZZOEo5.png', 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:53'),
(20, 16, 'gelatina de piña', '89.00', 86, NULL, NULL, 'CDSDkWBKzk5zciQAUlyk.jpg', 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:58'),
(21, 16, 'combinada', '45.00', 69, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:26'),
(22, 16, 'fresa', '25.00', 100, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:29'),
(23, 16, 'mango', '28.00', 40, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:20'),
(24, 16, 'uva', '65.00', 30, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:02:46'),
(25, 17, 'corazon', '32.00', 55, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:36'),
(26, 17, 'figuras o decoradas', '15.00', 21, NULL, NULL, '1g3nE4TP6hA6d1LBpG1X.jpg', 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:55'),
(27, 17, 'individuales de leche', '15.00', 45, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:49'),
(28, 17, 'rosca durazno', '65.00', 44, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:04:40'),
(29, 17, 'rosca mosaico', '8.00', 78, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:43'),
(30, 17, 'rosca tres sabores', '30.00', 88, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:05:37'),
(31, 19, 'sable', '60.00', 30, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:02:35'),
(32, 19, 'sultana', '30.00', 60, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:02:16'),
(33, 19, 'besos', '30.00', 70, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:02:01'),
(34, 19, 'nuez', '30.00', 60, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:53'),
(35, 19, 'canela', '30.00', 70, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:50'),
(36, 19, 'mini orejas', '30.00', 60, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:48'),
(37, 19, 'chispas de chocolate', '30.00', 30, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:45'),
(38, 19, 'merengue', '30.00', 70, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:42'),
(39, 18, 'choux', '40.00', 60, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:38'),
(40, 18, 'cisne', '30.00', 50, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:35'),
(41, 20, 'helados', '10.00', 40, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-09-07 19:01:33'),
(42, 16, 'tartas con frutas', '20.00', 30, 'wtwetwywy', 4, 'C2Cs4K6G222bmMJPuKof.jpg', 'activo', '2018-08-31 19:06:32', '2018-09-07 19:01:30'),
(43, 17, 'Gelatina de piña', '10.00', 30, 'asgatata', 12, 'lXRv2RBO4Kj91dJAuuTQ.jpg', 'activo', '2018-08-31 19:32:51', '2018-09-07 19:01:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT '0',
  `precio` decimal(11,2) DEFAULT '0.00',
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `hora_inicio` time NOT NULL DEFAULT '00:00:00',
  `hora_fin` time NOT NULL DEFAULT '00:00:00',
  `estado` enum('espera','vigente','expirado') NOT NULL DEFAULT 'espera',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `promocion`
--

INSERT INTO `promocion` (`id`, `producto_id`, `fecha`, `cantidad`, `precio`, `fecha_inicio`, `fecha_fin`, `hora_inicio`, `hora_fin`, `estado`, `created_at`, `updated_at`) VALUES
(3, 1, '2018-08-14 00:00:00', 0, '5.00', '2018-09-18', '2018-09-18', '13:00:00', '20:59:00', 'expirado', '2018-08-15 02:35:39', '2018-09-28 23:59:40'),
(4, 37, '2018-08-31 16:36:51', 0, '20.00', '2018-09-29', '2018-10-24', '12:00:00', '20:09:00', 'vigente', '2018-08-31 21:36:51', '2018-09-28 23:59:39'),
(7, 35, '2018-09-18 13:18:28', 20, '5.00', '2018-09-29', '2018-09-20', '15:00:00', '23:59:00', 'expirado', '2018-09-18 17:18:28', '2018-09-28 23:59:40'),
(9, 1, '2018-09-27 19:45:15', 10, '10.00', '2018-09-27', '2018-09-27', '13:00:00', '20:00:00', 'expirado', '2018-09-27 23:45:15', '2018-09-28 23:59:40'),
(10, 33, '2018-09-29 21:08:19', 70, '15.00', '2018-09-29', '2018-09-29', '21:10:00', '21:15:00', 'expirado', '2018-09-30 01:08:19', '2018-09-30 01:08:19'),
(11, 13, '2018-09-29 21:33:34', 50, '30.00', '2018-09-29', '2018-09-30', '00:00:00', '00:00:00', 'expirado', '2018-09-30 01:33:34', '2018-09-30 01:33:34'),
(12, 21, '2018-09-29 22:03:00', 69, '40.00', '2018-09-29', '2018-09-30', '00:00:00', '00:00:00', 'expirado', '2018-09-30 02:03:00', '2018-09-30 02:03:00'),
(13, 17, '2018-10-04 11:49:20', 78, '40.00', '2018-10-04', '2018-10-04', '11:50:00', '11:52:00', 'expirado', '2018-10-04 15:49:20', '2018-10-04 15:49:20');

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
  `rol` enum('administrador','vendedor','cliente') NOT NULL,
  `estado` enum('activo','eliminado') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `direccion`, `telefono`, `celular`, `email`, `password`, `remember_token`, `rol`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'nose', 23422, 324324, 'admin@admin.com', '$2y$10$XHNiWCcsSw0CMI//DjD5NelCB7o8eoVg5DphbqGcnPbrRm5PisDCO', 'EZchjmFY6oIZ78O3DQJ3ZeD2qN9tkuZgLAo4BMClYPIIPaa5uG5wMVMNc1En', 'administrador', 'activo', '2018-06-09 03:59:30', '2018-06-09 03:59:30'),
(5, 'roberto', 'askjfhasjkf', 124115, 334536, 'roberto@gmail.com', '$2y$10$Me0xzo/7u6zw3tZ0JvzWg.UfUzS2qpZ6S.z1dnJo1xycb2TgSbPGK', 'noWbyESlrtJMro0jXbiHpWueRElpTJGmYYg8X2SN15voRoSGNeTUKm6WBzIh', 'administrador', 'activo', '2018-06-18 23:59:15', '2018-09-22 16:52:52'),
(11, 'vendedor', NULL, NULL, NULL, 'vendedor@vendedor.com', '$2y$10$9Cb7Gk3I20GKARSk2gwAc.7n0SisMuM.ExHE7J6mGHKOaQmb8YAsu', 'ef4kdD8LgL19FkQATdhVYMMSIQHmiKSqbQVwoGWhI9l2P0EQJLQxG4Ocy6PN', 'vendedor', 'activo', '2018-09-15 16:12:51', '2018-09-15 16:12:51'),
(12, 'fer', NULL, NULL, 7777777, 'fer@fer.com', '$2y$10$9Cb7Gk3I20GKARSk2gwAc.7n0SisMuM.ExHE7J6mGHKOaQmb8YAsu', NULL, 'cliente', 'activo', '2018-09-25 20:56:11', '2018-09-25 20:56:39'),
(18, 'oliver', 'zona chimba', 4444444, 7777777, 'oliver@galarga.com', '$2y$10$psVNnNiWIj2XJIgiyXd3pO3t28lVAO4KubbPbaV7iaBtlEEyJeyyq', NULL, 'cliente', 'activo', '2018-09-25 21:04:34', '2018-09-25 21:04:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
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
(1, 1, 1, '2017-08-23', '630.00', '0.00', '630.00', '2018-08-24 06:28:06', '2018-08-24 06:28:06'),
(2, 6, 1, '2018-06-22', '210.00', '10.00', '200.00', '2018-06-23 05:32:17', '2018-06-23 05:32:17'),
(3, 7, 1, '2018-06-22', '442.50', '0.00', '442.50', '2018-06-23 05:39:03', '2018-06-23 05:39:03'),
(4, 6, 1, '2018-06-22', '20.30', '0.00', '20.30', '2018-06-23 05:08:15', '2018-06-23 05:08:15'),
(5, 8, 1, '2018-08-26', '420.00', '20.00', '400.00', '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
(6, 9, 1, '2018-08-26', '121.80', '0.00', '121.80', '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
(7, 10, 1, '2018-08-26', '25.00', '0.00', '25.00', '2018-08-27 00:14:02', '2018-08-27 00:14:02'),
(8, 8, 1, '2018-09-02', '100.00', '0.00', '100.00', '2018-09-02 15:28:57', '2018-09-02 15:28:57'),
(9, 8, 1, '2018-09-03', '300.00', '0.00', '300.00', '2018-09-03 16:20:47', '2018-09-03 16:20:47'),
(11, 7, 1, '2018-09-03', '50.00', '0.00', '50.00', '2018-09-04 01:57:29', '2018-09-04 01:57:29'),
(12, 7, 1, '2018-09-03', '100.00', '0.00', '100.00', '2018-09-04 02:45:42', '2018-09-04 02:45:42'),
(13, 10, 11, '2018-09-17', '210.00', '0.00', '210.00', '2018-09-17 13:31:53', '2018-09-17 13:31:53'),
(14, 7, 11, '2018-09-30', '100.00', '0.00', '100.00', '2018-09-17 13:33:18', '2018-09-17 13:33:18');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `his_cantidad`
--
ALTER TABLE `his_cantidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `eventoPromocion` ON SCHEDULE EVERY 1 MINUTE STARTS '2018-09-29 14:44:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
 update promocion set estado = 'vigente' 
 where estado = 'espera'
 and fecha_inicio < CURDATE();

 update promocion set estado = 'vigente' 
 where estado = 'espera'
 and fecha_inicio = CURDATE()
 and hora_inicio <= CURTIME();

 update promocion set estado = 'expirado' 
 where estado = 'vigente'
 and fecha_fin < CURDATE();

 update promocion set estado = 'expirado' 
 where estado = 'vigente'
 and fecha_fin = CURDATE()
 and hora_fin <= CURTIME();
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
