-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla db_negocio.categoria_producto
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.categoria_producto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` (`id`, `nombre`, `imagen`, `estado`) VALUES
	(1, 'Tartas', 'dSGd4l25vvTejhVmoMbO.jpg', 'activo'),
	(16, 'Tartaletas', 'mfvLL7fxxr2ijheRVBE7.jpg', 'activo'),
	(17, 'Gelatinas', 'L99eqoG0hN4Y78oxplQm.jpg', 'activo'),
	(18, 'Pastelitos', 'Z0hqv85DVpc39ZDKh1dr.jpg', 'activo'),
	(19, 'Galletas', 'UqlfjBkWE31t94POiq8w.jpg', 'activo'),
	(20, 'Helados', 'SQ3ihQlGAsv63Kx1rsh8.jpg', 'activo');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `ci` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tipo` enum('frecuente','comun') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.cliente: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nombre`, `ci`, `password`, `direccion`, `telefono`, `celular`, `email`, `tipo`, `created_at`, `updated_at`) VALUES
	(1, 'dario', '123', NULL, 'sdfsd', 2423, 234, 'asd@asd.com', 'comun', '2018-06-16 02:56:19', '2018-06-16 02:56:19'),
	(6, 'juan', '456', NULL, 'dsfsdfds', 4567, 675, 'juan@juan.com', 'comun', '2018-08-01 02:24:00', '2018-08-01 02:24:00'),
	(7, 'filemon', '987', NULL, 'sin dir', 4567736, 77652353, 'filemon@filemon.com', 'comun', '2018-08-24 05:34:36', '2018-08-24 05:34:36'),
	(8, 'pedro', '789', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
	(9, 'fer', '321', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
	(10, 'carlos', '654', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-27 00:14:02', '2018-08-27 00:14:02');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_pedido_pedido1_idx` (`pedido_id`),
  KEY `fk_detalle_pedido_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_detalle_pedido_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.detalle_pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `subtotal`, `descripcion`) VALUES
	(1, 1, 3, 2, 200.00, 'sin descrip');
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_venta_venta1_idx` (`venta_id`),
  KEY `fk_detalle_venta_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.detalle_venta: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` (`id`, `venta_id`, `producto_id`, `cantidad`, `subtotal`) VALUES
	(1, 1, 3, 3, 630.00),
	(2, 2, 3, 1, 210.00),
	(3, 3, 3, 2, 420.00),
	(4, 3, 2, 9, 22.50),
	(5, 4, 1, 1, 20.30),
	(6, 5, 3, 2, 420.00),
	(7, 6, 1, 6, 121.80),
	(8, 7, 2, 10, 25.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.his_cantidad
CREATE TABLE IF NOT EXISTS `his_cantidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad_anterior` int(11) DEFAULT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` enum('entrada','salida') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_his_cantidad_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_his_cantidad_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.his_cantidad: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `his_cantidad` DISABLE KEYS */;
INSERT INTO `his_cantidad` (`id`, `producto_id`, `cantidad_anterior`, `cantidad_actual`, `fecha`, `tipo`, `created_at`, `updated_at`) VALUES
	(1, 2, 22, 32, '2018-07-25 00:00:00', 'entrada', '2018-07-26 03:29:05', '2018-07-26 03:29:05'),
	(2, 1, 4, 8, '2018-07-25 00:00:00', 'entrada', '2018-07-26 03:35:48', '2018-07-26 03:35:48');
/*!40000 ALTER TABLE `his_cantidad` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.ingredientes
CREATE TABLE IF NOT EXISTS `ingredientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `nombre_ingrediente` varchar(45) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `unidad_medida` enum('kilogramo','gramo','miligramo') DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingredientes_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_ingredientes_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.ingredientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.lote
CREATE TABLE IF NOT EXISTS `lote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foren ky` (`producto_id`),
  CONSTRAINT `FK_lote_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_negocio.lote: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` (`id`, `producto_id`, `cantidad`, `fecha`, `estado`) VALUES
	(1, 3, 10, '2018-08-20 00:00:00', 'activo'),
	(2, 2, 50, '2018-08-20 00:00:00', 'activo'),
	(3, 2, 40, '2018-08-22 00:00:00', 'activo'),
	(4, 3, 15, '2018-08-22 00:00:00', 'activo');
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.pedido: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `cliente_id`, `fecha`, `fecha_entrega`, `hora_entrega`, `acuenta`, `saldo`, `total`, `descuento`, `total_importe`, `iva`, `tipo`, `estado`, `forma_de_pago`, `comprobante`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-07-06', '2018-07-07', '11:26:34', NULL, 12.30, 200.00, NULL, NULL, 12.30, 'tienda', 'espera', 'tienda', NULL, '2018-07-07 01:59:49', '2018-07-07 01:59:49'),
	(2, 7, '2018-07-07', '2018-07-10', '12:30:00', NULL, 30.30, 300.00, NULL, NULL, 50.10, 'movil', 'entregado', 'banco', NULL, '2018-07-07 02:15:54', '2018-07-07 02:15:54'),
	(3, 6, '2018-08-16', '2018-08-09', '14:02:00', NULL, 12.20, 100.00, NULL, NULL, 12.00, 'tienda', 'preparado', 'tienda', NULL, '2018-08-15 02:34:40', '2018-08-15 02:34:40');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.preparado
CREATE TABLE IF NOT EXISTS `preparado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `vencimiento` time DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preparado_producto1_idx` (`producto_id`),
  KEY `fk_preparado_pedido1_idx` (`pedido_id`),
  KEY `fk_preparado_users1_idx` (`users_id`),
  CONSTRAINT `fk_preparado_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preparado_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preparado_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.preparado: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `preparado` DISABLE KEYS */;
INSERT INTO `preparado` (`id`, `producto_id`, `pedido_id`, `users_id`, `fecha`, `hora`, `vencimiento`, `cantidad`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, '2018-07-25', '18:37:16', '00:21:00', 12, '2018-07-26 02:37:16', '2018-07-26 02:37:16'),
	(2, 2, 1, 1, '2018-07-25', '18:39:56', '00:12:00', 4, '2018-07-26 02:39:56', '2018-07-26 02:39:56'),
	(3, 2, 1, 1, '2018-07-25', '18:43:06', '00:01:00', 2, '2018-07-26 02:43:06', '2018-07-26 02:43:06'),
	(4, 1, 1, 1, '2018-07-25', '18:46:14', '01:01:00', 1, '2018-07-26 02:46:14', '2018-07-26 02:46:14'),
	(5, 1, 1, 1, '2018-07-25', '18:48:14', '00:31:00', 1, '2018-07-26 02:48:14', '2018-07-26 02:48:14'),
	(6, 2, 1, 1, '2018-07-25', '18:48:37', '02:02:00', 4, '2018-07-26 02:48:37', '2018-07-26 02:48:37'),
	(7, 2, 1, 1, '2018-07-25', '19:29:05', '00:12:00', 10, '2018-07-26 03:29:05', '2018-07-26 03:29:05'),
	(8, 1, 1, 1, '2018-07-25', '19:35:48', '00:12:00', 4, '2018-07-26 03:35:48', '2018-07-26 03:35:48');
/*!40000 ALTER TABLE `preparado` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_producto_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `costo` decimal(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `estado` enum('activo','eliminado') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria_producto1_idx` (`categoria_producto_id`),
  CONSTRAINT `fk_producto_categoria_producto1` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.producto: ~43 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `categoria_producto_id`, `nombre`, `costo`, `cantidad`, `descripcion`, `duracion`, `imagen`, `estado`, `created_at`, `updated_at`) VALUES
	(1, 1, '5 frutas', 20.30, 10, 'fdsfds', 2, 'UhVirT94oLLLVazILdiX.jpg', 'activo', '2018-06-16 04:17:48', '2018-08-31 19:01:29'),
	(2, 1, 'Trebol', 2.50, 50, 'agdgrutu', 2, NULL, 'eliminado', '2018-07-20 03:50:46', '2018-08-31 19:06:56'),
	(3, 1, 'frutas extra', 210.00, 10, 'descripcion de torta tres leches', 5, 'MP62H1wzF9ako7yvndQt.jpg', 'activo', '2018-08-17 21:16:24', '2018-08-31 19:10:01'),
	(4, 1, 'mosaico', 10.00, 10, 'asd', NULL, NULL, 'eliminado', '2018-08-27 07:13:43', '2018-08-31 19:07:30'),
	(5, 1, 'queso', 100.00, 10, 'fgh', NULL, NULL, 'eliminado', '2018-08-27 07:14:23', '2018-08-31 19:07:45'),
	(6, 1, 'Tarta de queso', 200.00, 10, NULL, NULL, 'ZD1VluaxXtacVKR0cfmy.jpg', 'activo', '2018-08-27 07:15:05', '2018-08-31 19:12:57'),
	(7, 1, 'Tarta de limon', 100.00, 12, NULL, NULL, 'eoVfFZOjpYDoDUfY9i6s.jpg', 'activo', '2018-08-27 07:15:30', '2018-08-31 19:14:10'),
	(8, 1, 'tarta de manzana', 400.00, 10, NULL, NULL, 'gEchTHMa9Xe3pdEXhm91.jpg', 'activo', '2018-08-27 07:15:45', '2018-08-31 19:15:29'),
	(9, 1, 'tartaleta de manzana', 121.00, 10, NULL, NULL, 'ECTeqMujs95z2fWmEzjy.jpg', 'activo', '2018-08-27 07:16:11', '2018-08-31 19:17:27'),
	(10, 1, 'tarta de durazno', 101.00, 10, NULL, NULL, 'lGjS93P5jBTU0mmY216P.jpg', 'activo', '2018-08-27 07:16:28', '2018-08-31 19:25:46'),
	(11, 1, 'tarta de uva', 200.00, 10, NULL, NULL, 'HOQBPIjxORxeqrcokY7w.jpg', 'activo', '2018-08-27 07:16:45', '2018-08-31 19:24:13'),
	(12, 1, 'fresa', 300.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 07:17:22', '2018-08-27 07:17:22'),
	(13, 16, 'barcos', 45.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 07:18:42', '2018-08-27 07:18:42'),
	(14, 16, 'tartaleta de ceresas', 64.00, 32, NULL, NULL, 'CYGmOsgG2SvUr0qwlRhz.jpg', 'activo', '2018-08-27 07:19:04', '2018-08-31 19:20:17'),
	(15, 16, 'queso', 75.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(16, 16, 'chocolate', 74.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(17, 16, 'limon', 45.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(18, 16, 'manzana con hojaldre', 68.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(19, 16, 'Gelatinas clasicas', 32.00, 10, NULL, NULL, '0ANdb0GyMmPhj2ZZOEo5.png', 'activo', '2018-08-27 04:00:00', '2018-08-31 19:29:22'),
	(20, 16, 'gelatina de piña', 89.00, 10, NULL, NULL, 'CDSDkWBKzk5zciQAUlyk.jpg', 'activo', '2018-08-27 04:00:00', '2018-08-31 19:31:03'),
	(21, 16, 'combinada', 45.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(22, 16, 'fresa', 25.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(23, 16, 'mango', 28.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(24, 16, 'uva', 65.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(25, 17, 'corazon', 32.00, 12, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(26, 17, 'figuras o decoradas', 15.00, 12, NULL, NULL, '1g3nE4TP6hA6d1LBpG1X.jpg', 'activo', '2018-08-27 04:00:00', '2018-08-31 19:39:19'),
	(27, 17, 'individuales de leche', 15.00, 12, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(28, 17, 'rosca durazno', 65.00, 12, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(29, 17, 'rosca mosaico', 8.00, 12, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(30, 17, 'rosca tres sabores', 30.00, 12, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(31, 19, 'sable', 60.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(32, 19, 'sultana', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(33, 19, 'besos', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(34, 19, 'nuez', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(35, 19, 'canela', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(36, 19, 'mini orejas', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(37, 19, 'chispas de chocolate', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(38, 19, 'merengue', 30.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(39, 18, 'choux', 40.00, 20, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(40, 18, 'cisne', 30.00, 10, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(41, 20, 'helados', 10.00, 40, NULL, NULL, NULL, 'activo', '2018-08-27 04:00:00', '2018-08-27 04:00:00'),
	(42, 16, 'tartas con frutas', 20.00, 30, 'wtwetwywy', 4, 'C2Cs4K6G222bmMJPuKof.jpg', 'activo', '2018-08-31 19:06:32', '2018-08-31 19:06:32'),
	(43, 17, 'Gelatina de piña', 10.00, 30, 'asgatata', 12, 'lXRv2RBO4Kj91dJAuuTQ.jpg', 'activo', '2018-08-31 19:32:51', '2018-08-31 19:32:51');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.promocion
CREATE TABLE IF NOT EXISTS `promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `precio` decimal(11,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `unidad` enum('dias','horas') NOT NULL,
  `estado` enum('vigente','expirado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_promocion_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_promocion_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.promocion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` (`id`, `producto_id`, `precio`, `fecha`, `duracion`, `unidad`, `estado`, `created_at`, `updated_at`) VALUES
	(1, 1, 12.30, '2018-07-06 00:00:00', 5, 'dias', 'vigente', '2018-07-07 03:32:18', '2018-07-07 03:47:28'),
	(2, 1, 10.00, '2018-07-07 00:00:00', 3, 'dias', 'vigente', '2018-07-07 03:37:59', '2018-07-07 03:37:59'),
	(3, 1, 5.00, '2018-08-14 00:00:00', 10, 'dias', 'vigente', '2018-08-15 02:35:39', '2018-08-15 02:35:39');
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.users: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `direccion`, `telefono`, `celular`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
	(1, 'admin', 'nose', 23422, 324324, 'admin@admin.com', '$2y$10$XHNiWCcsSw0CMI//DjD5NelCB7o8eoVg5DphbqGcnPbrRm5PisDCO', 'e86HSFFAnKMFW9SP1SvKcM4gaslbzdShzyAwFrXSerVSgmnt1DX7Fl2rrWZ4', '2018-06-09 03:59:30', '2018-06-09 03:59:30', 'administrador'),
	(2, 'said', 'asdas dsad sas dasd', 234, 234, 'saiddipp@hotmail.com', '$2y$10$unoELXeQi.jZbXNSVj4W2.iNl9PfBpEhcSMqXnSwmbEGByb6oPbBe', 'cJXkk7IFsoC4A1aRQyJgV0skBHSADOdDZdMAJHPGp878PnW1ILmRIfUxH2he', '2018-06-09 04:10:41', '2018-06-09 04:10:41', 'administrador'),
	(3, 'gerardo', 'zona norte', 44493245, 78785423, 'gerarld@gmail.com', '$2y$10$b4ln2FA7cc2DxiOjx.k.OOS.W66z14OSpnl7BQ9aChNz5X/RGmD0m', 'FR96JLi7bzCyDys9TDnLYu5xdyZNLd0bUiYP7UJbUUttPUL3pW4KSRDUSOVF', '2018-06-12 23:09:24', '2018-06-12 23:09:24', 'administrador'),
	(4, 'said', 'pacata', 354, 654654, 'said.dipp@rnova.net', '$2y$10$0Liw5R6t0ZRr.1s9E3hBN.1tTY6672On7HADwQPWCKuCWC.Kv6pgC', NULL, '2018-06-16 04:00:07', '2018-06-16 04:00:07', 'administrador'),
	(5, 'roberto', 'askjfhasjkf', 124115, 334536, 'roberto@gmail.com', '$2y$10$Me0xzo/7u6zw3tZ0JvzWg.UfUzS2qpZ6S.z1dnJo1xycb2TgSbPGK', 'noWbyESlrtJMro0jXbiHpWueRElpTJGmYYg8X2SN15voRoSGNeTUKm6WBzIh', '2018-06-18 23:59:15', '2018-06-18 23:59:15', 'administrador'),
	(6, 'said', 'zsfagf', 1231515, 534636, 'saiddipp@hotmail.comsaid', '$2y$10$Fh2FMIdmyJUwFACsjW/f7uCbRHs0rqVkYG7Z8dmLJsqASEOMIq9Hu', NULL, '2018-06-19 00:00:43', '2018-06-19 00:00:43', 'administrador'),
	(7, 'dipp', 'dasrar', 12124, 4124125, 'said@gmail.com', '$2y$10$IZkyNCMuQlNsbAlzAQXcUep9A2HnLEyPLtxoJCU7R3xDFcsJ56Xcy', 'BnX3aVXfk62J82WSf9OBoWGvhycXSs7DCSyvU2aFomUPQTY5jLH5Pgby4Tyy', '2018-08-11 00:02:20', '2018-08-11 00:02:20', 'panadero'),
	(8, 'willam', 'dsadsa', 3454, 435435, 'willam@mamani.com', '$2y$10$Ey9qzjgnEK4KiLTrty7DNeDWhz7k.ycgD8tjSUHp.hnfIrUkuHTIK', '0uzAco7v11ZGucljlTPEHx7szdgxjPpNQSya11hYCvoeZo9qiPaqByw2gjN0', '2018-08-11 06:19:37', '2018-08-11 06:19:37', 'panadero'),
	(9, 'vendedor', 'sin dir', 4444444, 77777777, 'vendedor@rnova.net', '$2y$10$aVV3hfQXMc5DDBIQZKV9guicUMsJZBKlmqpWYwjhc9Ulw/FJvHFiK', NULL, '2018-08-17 21:23:01', '2018-08-17 21:23:01', 'vendedor');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `total_importe` decimal(11,2) DEFAULT NULL,
  `iva` decimal(11,2) DEFAULT NULL,
  `estado` enum('activo','cancelado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_cliente1_idx` (`cliente_id`),
  KEY `fk_venta_users1_idx` (`users_id`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` (`id`, `cliente_id`, `users_id`, `fecha`, `total`, `descuento`, `total_importe`, `iva`, `estado`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2018-08-23 00:00:00', 630.00, 0.00, 630.00, 0.00, 'activo', '2018-08-24 06:28:06', '2018-08-24 06:28:06'),
	(2, 6, 1, '2018-06-22 00:00:00', 210.00, 10.00, 200.00, 0.00, 'activo', '2018-06-23 05:32:17', '2018-06-23 05:32:17'),
	(3, 7, 1, '2018-06-22 00:00:00', 442.50, 0.00, 442.50, 0.00, 'activo', '2018-06-23 05:39:03', '2018-06-23 05:39:03'),
	(4, 6, 1, '2018-06-22 00:00:00', 20.30, 0.00, 20.30, 0.00, 'activo', '2018-06-23 05:08:15', '2018-06-23 05:08:15'),
	(5, 8, 1, '2018-08-26 00:00:00', 420.00, 20.00, 400.00, 0.00, 'activo', '2018-08-26 19:53:54', '2018-08-26 19:53:54'),
	(6, 9, 1, '2018-08-26 15:55:53', 121.80, 0.00, 121.80, 0.00, 'activo', '2018-08-26 19:55:53', '2018-08-26 19:55:53'),
	(7, 10, 1, '2018-08-26 20:14:02', 25.00, 0.00, 25.00, 0.00, 'activo', '2018-08-27 00:14:02', '2018-08-27 00:14:02');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
