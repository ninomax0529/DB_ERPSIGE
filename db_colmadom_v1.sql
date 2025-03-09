/*
Navicat MySQL Data Transfer

Source Server         : erpsige
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : db_colmadom_v1

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2025-03-09 11:22:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `almacen`
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(120) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of almacen
-- ----------------------------

-- ----------------------------
-- Table structure for `articulo`
-- ----------------------------
DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articulo
-- ----------------------------

-- ----------------------------
-- Table structure for `articulo2`
-- ----------------------------
DROP TABLE IF EXISTS `articulo2`;
CREATE TABLE `articulo2` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `descripcion` text,
  `codigo_de_barra` varchar(80) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `sub_categoria` int(11) DEFAULT NULL,
  `unidad_entrada` int(11) DEFAULT NULL,
  `unidad_salida` int(11) DEFAULT NULL,
  `existencia` double DEFAULT NULL,
  `maximo` double DEFAULT NULL,
  `minimo` double DEFAULT NULL,
  `apedir` double DEFAULT NULL,
  `precio_compra` double DEFAULT NULL,
  `precio_compra_anterior` double DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `precio_venta_con_itbis` double DEFAULT NULL,
  `precio_venta_anterior` double DEFAULT NULL,
  `ultimo_suplidor` int(11) DEFAULT NULL,
  `exento_itbis` bit(1) NOT NULL DEFAULT b'0',
  `imagen` blob,
  `inventariable` bit(1) NOT NULL,
  `tipo_articulo` int(11) DEFAULT NULL,
  `margen_beneficio` double DEFAULT NULL,
  `porciento_utilidad` double DEFAULT NULL,
  `modelo` varchar(25) DEFAULT NULL,
  `marca` varchar(80) DEFAULT NULL,
  `linea_articulo` int(11) DEFAULT NULL,
  `nombre_linea` varchar(80) DEFAULT NULL,
  `para_venta` bit(1) NOT NULL,
  `para_consumo` bit(1) NOT NULL,
  `ruta_img` varchar(30) DEFAULT NULL,
  `embase` int(11) DEFAULT NULL,
  `nombre_embase` varchar(50) DEFAULT NULL,
  `compuesto` bit(1) NOT NULL DEFAULT b'0',
  `secuencia_documento` int(11) DEFAULT NULL,
  `itbis_gravado` double DEFAULT NULL,
  `venta_agranel` bit(1) NOT NULL DEFAULT b'0',
  `unidad_de_venta` int(11) DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `perecedero` bit(1) NOT NULL DEFAULT b'0',
  `fecha_vencimiento` date DEFAULT NULL,
  `habilitado` bit(1) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `unidad_entrada` (`unidad_entrada`),
  KEY `categoria` (`categoria`),
  KEY `sub_categoria` (`sub_categoria`),
  KEY `tipo_articulo` (`tipo_articulo`),
  KEY `unidad_salida` (`unidad_salida`),
  KEY `fk_articulo_secuecia_doc` (`secuencia_documento`),
  CONSTRAINT `articulo2_ibfk_1` FOREIGN KEY (`unidad_entrada`) REFERENCES `unidad` (`codigo`),
  CONSTRAINT `articulo2_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigo`),
  CONSTRAINT `articulo2_ibfk_3` FOREIGN KEY (`sub_categoria`) REFERENCES `sub_categoria` (`codigo`),
  CONSTRAINT `articulo2_ibfk_4` FOREIGN KEY (`tipo_articulo`) REFERENCES `tipo_articulo` (`codigo`),
  CONSTRAINT `articulo2_ibfk_5` FOREIGN KEY (`unidad_salida`) REFERENCES `unidad` (`codigo`),
  CONSTRAINT `articulo2_ibfk_7` FOREIGN KEY (`secuencia_documento`) REFERENCES `secuencia_documento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of articulo2
-- ----------------------------

-- ----------------------------
-- Table structure for `articulo_almacen`
-- ----------------------------
DROP TABLE IF EXISTS `articulo_almacen`;
CREATE TABLE `articulo_almacen` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `articulo` int(11) NOT NULL,
  `nombre_articulo` varchar(50) DEFAULT NULL,
  `almacen` int(11) NOT NULL,
  `nombre_almacen` varchar(50) DEFAULT NULL,
  `existencia` double NOT NULL,
  `unidad` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `creado_por` varchar(50) DEFAULT NULL,
  `actualizado_por` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_existencia_articulo` (`articulo`) USING BTREE,
  KEY `fk_existencia_almacen` (`almacen`) USING BTREE,
  KEY `fk_existencia_art_unidad` (`unidad`),
  CONSTRAINT `articulo_almacen_ibfk_1` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`codigo`),
  CONSTRAINT `articulo_almacen_ibfk_4` FOREIGN KEY (`unidad`) REFERENCES `unidad` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of articulo_almacen
-- ----------------------------

-- ----------------------------
-- Table structure for `categoria`
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creada_por` varchar(50) DEFAULT NULL,
  `habilitada` bit(1) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoria
-- ----------------------------

-- ----------------------------
-- Table structure for `rol`
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text,
  `fecha_creacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` varchar(0) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_rol_usuario_idx` (`usuario`) USING BTREE,
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'ADMINISTRADOR', '2020-03-04', 'ADMINISTRA TODO EL SISTEMA', null, null, '1');
INSERT INTO `rol` VALUES ('2', 'AUXILIAR', '2020-08-14', 'PARA AUXILIAR', null, null, '1');
INSERT INTO `rol` VALUES ('3', 'ASISTENTE ADMINISTRATIVO', '2021-06-24', 'ROL PARA  GESTIONAR  LOS PERMISOS ADMINISTRATIVOS', null, null, '1');
INSERT INTO `rol` VALUES ('4', 'AUX CONTABILIDAD', '2021-06-28', 'GESTIUONAR PERMISOS DE CONTABILIODAD', null, null, '1');
INSERT INTO `rol` VALUES ('5', 'EJECUTIVO DE VENTA', '2021-11-18', 'ESTE ROL ES PARA EJECUTIVO DE VENTA DE IGHTRACK\nSOLAMENTE', null, null, '1');
INSERT INTO `rol` VALUES ('6', 'CONTABILIDAD', '2022-12-13', 'ROL PARA GESTIONAR LA PARTE ADMINISTRATIVA', null, null, '1');
INSERT INTO `rol` VALUES ('7', 'VENTAS  /ASISTENTE ADMINISTRATIVO', '2023-07-20', 'VENTAS Y ASISTENTE ADMINISTRATIVO', null, null, '1');

-- ----------------------------
-- Table structure for `secuencia_documento`
-- ----------------------------
DROP TABLE IF EXISTS `secuencia_documento`;
CREATE TABLE `secuencia_documento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` int(11) NOT NULL,
  `numero` int(10) NOT NULL,
  `prefijo` varchar(4) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `sufijo` varchar(10) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_secuencia_doc_tipo_documento` (`tipo_documento`),
  CONSTRAINT `secuencia_documento_ibfk_1` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secuencia_documento
-- ----------------------------

-- ----------------------------
-- Table structure for `sub_categoria`
-- ----------------------------
DROP TABLE IF EXISTS `sub_categoria`;
CREATE TABLE `sub_categoria` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `creada_por` varchar(50) NOT NULL,
  `habilitada` bit(1) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_sub_categoria_categoria` (`categoria`) USING BTREE,
  CONSTRAINT `sub_categoria_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sub_categoria
-- ----------------------------

-- ----------------------------
-- Table structure for `tipo_documento`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `movimiento` varchar(10) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES ('1', 'COMPRAS', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('2', 'DEPOSITO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('3', 'SOLICITUD  DE CHEQUE', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('4', 'SOLICITUD  DE COMPRA', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('5', 'ORDEN DE COMPRA', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('6', 'ENTRADA DE DIARIO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('7', 'FACTURA DE VENTA', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('8', 'RECIBO DE INGRESO', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('9', 'PAGOS', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('10', 'RECIBO DE CAJA', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('11', 'ENTRADA INVENTARIO', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('12', 'FACTURA  DE COMPRA', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('13', 'TRANSFERENCIA  ALMACEN', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('14', 'COTIZACION', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('15', 'CONDUCE', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('16', 'CONTRATO', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('17', 'SALIDA DE INVENTARIO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('18', 'SOLICITUD SALIDAD DE INVENTARIO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('19', 'AJUSTE DE INVENTARIO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('20', 'DEVOLUCION DE INVENTARIO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('21', 'ARTICULO', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('22', 'NOMINA', 'EGRASO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('23', 'NOTA DE CREDITO', 'EGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('24', 'NOTA DE DEBITO', 'INGRESO', null, null, null);
INSERT INTO `tipo_documento` VALUES ('25', 'MOVIMIENTO BANCO', 'IE', null, null, null);

-- ----------------------------
-- Table structure for `unidad`
-- ----------------------------
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `abreviatura` varchar(6) DEFAULT NULL,
  `creada_por` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `habilitada` bit(1) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of unidad
-- ----------------------------

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo_usuario` varchar(100) DEFAULT NULL,
  `usuario` varchar(25) DEFAULT NULL,
  `contrasena` varchar(80) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creado_por` varchar(50) DEFAULT NULL,
  `habilitado` bit(1) NOT NULL DEFAULT b'1',
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuario
-- ----------------------------
