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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `total_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.categoria_producto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` (`id`, `nombre`, `created_at`, `updated_at`, `imagen`, `total_producto`) VALUES
	(1, 'pasteles', NULL, NULL, NULL, NULL),
	(2, 'empanadas', NULL, NULL, NULL, NULL),
	(4, 'Tartas', NULL, NULL, NULL, NULL),
	(5, 'Gelatinas', NULL, NULL, NULL, NULL),
	(6, 'Galletas', NULL, NULL, NULL, NULL),
	(7, 'Helados', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `ci` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tipo` enum('frecuente','comun') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.cliente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nombre`, `ci`, `direccion`, `telefono`, `celular`, `email`, `tipo`, `created_at`, `updated_at`) VALUES
	(1, 'dss', NULL, 'sdfsd', 2423, 234, 'asd@asd.com', 'comun', '2018-06-15 18:56:19', '2018-06-15 18:56:19'),
	(2, 'ssssss', NULL, 'adsdsa', 2342, 432, 'wer@wer.com', 'frecuente', '2018-06-15 18:57:23', '2018-06-15 19:36:25'),
	(3, 'charito', NULL, 'fwegweg', 1241515, 1254125, 'samir@hotmail.com', 'frecuente', '2018-06-15 19:22:40', '2018-06-15 19:29:11'),
	(6, 'juan', NULL, 'dsfsdfds', 4567, 675, 'juan@juan.com', 'comun', '2018-07-31 18:24:00', '2018-07-31 18:24:00');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_pedido_pedido1_idx` (`pedido_id`),
  KEY `fk_detalle_pedido_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_detalle_pedido_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.detalle_pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_venta_venta1_idx` (`venta_id`),
  KEY `fk_detalle_venta_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.detalle_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.his_cantidad
CREATE TABLE IF NOT EXISTS `his_cantidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_anterior` int(11) DEFAULT NULL,
  `cantidad_actual` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo` enum('entrada','salida') DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_his_cantidad_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_his_cantidad_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.his_cantidad: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `his_cantidad` DISABLE KEYS */;
INSERT INTO `his_cantidad` (`id`, `cantidad_anterior`, `cantidad_actual`, `fecha`, `hora`, `tipo`, `producto_id`, `created_at`, `updated_at`) VALUES
	(1, 22, 32, '2018-07-25', '19:29:05', 'entrada', 2, '2018-07-25 19:29:05', '2018-07-25 19:29:05'),
	(2, 4, 8, '2018-07-25', '19:35:48', 'entrada', 1, '2018-07-25 19:35:48', '2018-07-25 19:35:48');
/*!40000 ALTER TABLE `his_cantidad` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.ingredientes
CREATE TABLE IF NOT EXISTS `ingredientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ingrediente` varchar(45) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  `unidad_medida` enum('kilogramo','gramo','miligramo') DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingredientes_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_ingredientes_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.ingredientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.oauth_access_tokens: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('10d0547dec32d86c869f3b61eab7b7226ee73cf3c4ad2ed28896f2f3a12bd2059fb67dbf7c26584c', 6, 1, 'MyApp', '[]', 0, '2018-07-31 18:24:00', '2018-07-31 18:24:00', '2019-07-31 18:24:00'),
	('17ca2311eb744617fdb98aa6f1915d431c86db505da549dc54f889e7f606e0472cb04b5520ca4d92', 1, 1, 'MyApp', '[]', 0, '2018-06-28 20:06:35', '2018-06-28 20:06:35', '2019-06-28 20:06:35'),
	('35fa38a8d5acbaabf295fa7806fd0c447ec16dbf26d068ed35a10ec62daef02d918cb00d15062169', 6, 1, 'MyApp', '[]', 0, '2018-07-31 18:28:10', '2018-07-31 18:28:10', '2019-07-31 18:28:10'),
	('3e6447b3bee103fa46706e38712fa8cf15d23f332c7f0baf9ac6fd74252a7180a79a154b8cdfbc57', 5, 1, 'MyApp', '[]', 0, '2018-07-31 17:13:16', '2018-07-31 17:13:16', '2019-07-31 17:13:16'),
	('ab2d3f66a58e68f1904a435e9fa35d854263181b25b200dee690c16554aedd3f041626b6e95881af', 1, 1, 'MyApp', '[]', 0, '2018-08-13 17:56:55', '2018-08-13 17:56:55', '2019-08-13 17:56:55'),
	('b1d3a7b83a25f220e7fba1b664d6bd408852bc45c016e18d9e916ae589752ae58df83d2de0d85b52', 4, 1, 'MyApp', '[]', 0, '2018-07-31 16:16:20', '2018-07-31 16:16:20', '2019-07-31 16:16:20'),
	('ecf2ae89a7e3d5d1413be82e138de3de82ff0584b64a809049bad8ce61b1cbcbc69c124d6b315dac', 1, 1, 'MyApp', '[]', 0, '2018-08-13 18:03:32', '2018-08-13 18:03:32', '2019-08-13 18:03:32');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.oauth_auth_codes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.oauth_clients: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'BIhdtDPGw2G54hR2A8ONHOJAv8101tEAJRRcQPYl', 'http://localhost', 1, 0, 0, '2018-06-28 18:16:33', '2018-06-28 18:16:33'),
	(2, NULL, 'Laravel Password Grant Client', 'C3iCZMScBHBDAzRe5sixTdMvVbdqJsIBLgw4EgsF', 'http://localhost', 0, 1, 0, '2018-06-28 18:16:34', '2018-06-28 18:16:34');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.oauth_personal_access_clients: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-06-28 18:16:33', '2018-06-28 18:16:33');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.oauth_refresh_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

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
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.pedido: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `saldo`, `estado`, `fecha`, `fecha_entrega`, `hora_entrega`, `forma_de_pago`, `iva`, `cliente_id`, `created_at`, `updated_at`, `cantidad`) VALUES
	(1, 12.30, 'espera', '2018-07-06', '2018-07-07', '00:00:00', 'tienda', 12.30, 1, '2018-07-06 17:59:49', '2018-07-06 17:59:49', NULL),
	(2, 30.30, 'entregado', '2018-07-07', '2018-07-10', '12:30:00', 'banco', 50.10, 1, '2018-07-06 18:15:54', '2018-07-06 18:15:54', NULL),
	(3, 12.20, 'preparado', '2018-08-16', '2018-08-09', '14:02:00', 'tienda', 12.00, 1, '2018-08-14 18:34:40', '2018-08-14 18:34:40', NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.preparado
CREATE TABLE IF NOT EXISTS `preparado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `vencimiento` time DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
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
INSERT INTO `preparado` (`id`, `fecha`, `hora`, `vencimiento`, `cantidad`, `producto_id`, `pedido_id`, `users_id`, `created_at`, `updated_at`) VALUES
	(1, '2018-07-25', '18:37:16', '00:21:00', 12, 1, 1, 1, '2018-07-25 18:37:16', '2018-07-25 18:37:16'),
	(2, '2018-07-25', '18:39:56', '00:12:00', 4, 2, 1, 1, '2018-07-25 18:39:56', '2018-07-25 18:39:56'),
	(3, '2018-07-25', '18:43:06', '00:01:00', 2, 2, 1, 1, '2018-07-25 18:43:06', '2018-07-25 18:43:06'),
	(4, '2018-07-25', '18:46:14', '01:01:00', 1, 1, 1, 1, '2018-07-25 18:46:14', '2018-07-25 18:46:14'),
	(5, '2018-07-25', '18:48:14', '00:31:00', 1, 1, 1, 1, '2018-07-25 18:48:14', '2018-07-25 18:48:14'),
	(6, '2018-07-25', '18:48:37', '02:02:00', 4, 2, 1, 1, '2018-07-25 18:48:37', '2018-07-25 18:48:37'),
	(7, '2018-07-25', '19:29:05', '00:12:00', 10, 2, 1, 1, '2018-07-25 19:29:05', '2018-07-25 19:29:05'),
	(8, '2018-07-25', '19:35:48', '00:12:00', 4, 1, 1, 1, '2018-07-25 19:35:48', '2018-07-25 19:35:48');
/*!40000 ALTER TABLE `preparado` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `costo` decimal(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `categoria_producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria_producto1_idx` (`categoria_producto_id`),
  CONSTRAINT `fk_producto_categoria_producto1` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.producto: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre`, `costo`, `cantidad`, `descripcion`, `duracion`, `categoria_producto_id`, `created_at`, `updated_at`, `imagen`) VALUES
	(1, 'chuntero', 20.30, 8, 'fdsfds', 2, 2, '2018-06-15 20:17:48', '2018-07-25 19:35:48', NULL),
	(2, 'empanadas', 2.50, 32, 'agdgrutu', 2, 1, '2018-07-19 19:50:46', '2018-07-25 19:29:05', NULL),
	(3, 'torta tres leches', 210.00, 10, NULL, 5, 1, '2018-08-17 13:16:24', '2018-08-17 13:16:24', NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.promocion
CREATE TABLE IF NOT EXISTS `promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descuento` decimal(11,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `estado` enum('vigente','expirado') DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estadodisponibilidad` enum('Disponible','Agotado') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_promocion_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_promocion_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.promocion: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` (`id`, `descuento`, `fecha`, `duracion`, `estado`, `producto_id`, `created_at`, `updated_at`, `estadodisponibilidad`) VALUES
	(1, 12.30, '2018-07-06', '5', 'vigente', 1, '2018-07-06 19:32:18', '2018-07-06 19:47:28', NULL),
	(2, 10.00, '2018-07-07', '3 horas', 'vigente', 1, '2018-07-06 19:37:59', '2018-07-06 19:37:59', NULL),
	(3, 5.00, '2018-08-14', '10 horas', 'vigente', 1, '2018-08-14 18:35:39', '2018-08-14 18:35:39', NULL);
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

-- Volcando datos para la tabla db_negocio.users: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `direccion`, `telefono`, `celular`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
	(1, 'admin', 'nose', 23422, 324324, 'admin@admin.com', '$2y$10$XHNiWCcsSw0CMI//DjD5NelCB7o8eoVg5DphbqGcnPbrRm5PisDCO', '8FPjehSm0KrkjmNxoeY7vYF1SGHI3t9IIK3R6MN476aojCu8yq4SC4HsVYI9', '2018-06-08 19:59:30', '2018-06-08 19:59:30', 'administrador'),
	(2, 'said', 'asdas dsad sas dasd', 234, 234, 'saiddipp@hotmail.com', '$2y$10$unoELXeQi.jZbXNSVj4W2.iNl9PfBpEhcSMqXnSwmbEGByb6oPbBe', 'cJXkk7IFsoC4A1aRQyJgV0skBHSADOdDZdMAJHPGp878PnW1ILmRIfUxH2he', '2018-06-08 20:10:41', '2018-06-08 20:10:41', 'administrador'),
	(3, 'gerardo', 'zona norte', 44493245, 78785423, 'gerarld@gmail.com', '$2y$10$b4ln2FA7cc2DxiOjx.k.OOS.W66z14OSpnl7BQ9aChNz5X/RGmD0m', 'FR96JLi7bzCyDys9TDnLYu5xdyZNLd0bUiYP7UJbUUttPUL3pW4KSRDUSOVF', '2018-06-12 15:09:24', '2018-06-12 15:09:24', 'administrador'),
	(4, 'said', 'pacata', 354, 654654, 'said.dipp@rnova.net', '$2y$10$0Liw5R6t0ZRr.1s9E3hBN.1tTY6672On7HADwQPWCKuCWC.Kv6pgC', NULL, '2018-06-15 20:00:07', '2018-06-15 20:00:07', 'administrador'),
	(5, 'roberto', 'askjfhasjkf', 124115, 334536, 'roberto@gmail.com', '$2y$10$Me0xzo/7u6zw3tZ0JvzWg.UfUzS2qpZ6S.z1dnJo1xycb2TgSbPGK', 'noWbyESlrtJMro0jXbiHpWueRElpTJGmYYg8X2SN15voRoSGNeTUKm6WBzIh', '2018-06-18 15:59:15', '2018-06-18 15:59:15', 'administrador'),
	(6, 'said', 'zsfagf', 1231515, 534636, 'saiddipp@hotmail.comsaid', '$2y$10$Fh2FMIdmyJUwFACsjW/f7uCbRHs0rqVkYG7Z8dmLJsqASEOMIq9Hu', NULL, '2018-06-18 16:00:43', '2018-06-18 16:00:43', 'administrador'),
	(7, 'dipp', 'dasrar', 12124, 4124125, 'said@gmail.com', '$2y$10$IZkyNCMuQlNsbAlzAQXcUep9A2HnLEyPLtxoJCU7R3xDFcsJ56Xcy', 'BnX3aVXfk62J82WSf9OBoWGvhycXSs7DCSyvU2aFomUPQTY5jLH5Pgby4Tyy', '2018-08-10 16:02:20', '2018-08-10 16:02:20', 'panadero'),
	(8, 'willam', 'dsadsa', 3454, 435435, 'willam@mamani.com', '$2y$10$Ey9qzjgnEK4KiLTrty7DNeDWhz7k.ycgD8tjSUHp.hnfIrUkuHTIK', '0uzAco7v11ZGucljlTPEHx7szdgxjPpNQSya11hYCvoeZo9qiPaqByw2gjN0', '2018-08-10 22:19:37', '2018-08-10 22:19:37', 'panadero'),
	(9, 'vendedor', 'sin dir', 4444444, 77777777, 'vendedor@rnova.net', '$2y$10$aVV3hfQXMc5DDBIQZKV9guicUMsJZBKlmqpWYwjhc9Ulw/FJvHFiK', NULL, '2018-08-17 13:23:01', '2018-08-17 13:23:01', 'vendedor');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla db_negocio.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_cliente1_idx` (`cliente_id`),
  KEY `fk_venta_users1_idx` (`users_id`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_negocio.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
