-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql_80
-- Tiempo de generación: 30-10-2024 a las 15:14:48
-- Versión del servidor: 8.0.37
-- Versión de PHP: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `FARMACIA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Caducidades`
--

CREATE TABLE `Caducidades` (
  `idCaducidad` int NOT NULL,
  `idMedicamento` int DEFAULT NULL,
  `FechaCaducidad` date DEFAULT NULL,
  `TiempoRestante` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clasificacion`
--

CREATE TABLE `Clasificacion` (
  `idClasificacion` int NOT NULL,
  `Tipo` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comiciones`
--

CREATE TABLE `Comiciones` (
  `idComicion` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `Porcentaje` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Controlado`
--

CREATE TABLE `Controlado` (
  `idControlado` int NOT NULL,
  `NombrePaciente` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NombreDoctor` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TelefonoDoctor` varchar(18) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CedulaDoctor` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Detalle` varchar(700) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetallePedidos`
--

CREATE TABLE `DetallePedidos` (
  `idDetallePedido` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleVentas`
--

CREATE TABLE `DetalleVentas` (
  `idDetalleVenta` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL,
  `PrecioTotal` decimal(10,2) DEFAULT NULL,
  `idComicion` int DEFAULT NULL,
  `idControlado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleados`
--

CREATE TABLE `Empleados` (
  `idEmpleado` int NOT NULL,
  `idSucursal` int DEFAULT NULL,
  `Nombre` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ApellidoP` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ApellidoM` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Telefono` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CURP` varchar(18) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RFC` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estatus`
--

CREATE TABLE `Estatus` (
  `E_Regresable` int NOT NULL,
  `Detalle` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Inventario`
--

CREATE TABLE `Inventario` (
  `idInventario` int NOT NULL,
  `idSucursal` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  `CantidadDisponible` int DEFAULT NULL,
  `CantidadVendida` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medicamentos`
--

CREATE TABLE `Medicamentos` (
  `idProducto` int NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `idClasificacion` int DEFAULT NULL,
  `FechaCaducidad` date DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `PrecioCompra` decimal(10,2) DEFAULT NULL,
  `PrecioVenta` decimal(10,2) DEFAULT NULL,
  `idProvedor` int DEFAULT NULL,
  `E_Regresable` int DEFAULT NULL,
  `Descripcion` varchar(700) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ofertas`
--

CREATE TABLE `Ofertas` (
  `idOferta` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `PorcentajeDescuento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `idPedido` int NOT NULL,
  `idSucursal` int DEFAULT NULL,
  `idProvedor` int DEFAULT NULL,
  `FechaPedido` date DEFAULT NULL,
  `Estado` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `idDetallePedido` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Provedores`
--

CREATE TABLE `Provedores` (
  `idProvedor` int NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Telefono` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Direccion` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sucursal`
--

CREATE TABLE `Sucursal` (
  `id_Sucursal` int NOT NULL,
  `Nombre` varchar(70) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Telefono` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Direccion` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `idVenta` int NOT NULL,
  `idDetalleVenta` int DEFAULT NULL,
  `idSucursal` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `FechaVenta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Caducidades`
--
ALTER TABLE `Caducidades`
  ADD PRIMARY KEY (`idCaducidad`),
  ADD KEY `idMedicamento` (`idMedicamento`);

--
-- Indices de la tabla `Clasificacion`
--
ALTER TABLE `Clasificacion`
  ADD PRIMARY KEY (`idClasificacion`);

--
-- Indices de la tabla `Comiciones`
--
ALTER TABLE `Comiciones`
  ADD PRIMARY KEY (`idComicion`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `Controlado`
--
ALTER TABLE `Controlado`
  ADD PRIMARY KEY (`idControlado`);

--
-- Indices de la tabla `DetallePedidos`
--
ALTER TABLE `DetallePedidos`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `DetalleVentas`
--
ALTER TABLE `DetalleVentas`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idComicion` (`idComicion`),
  ADD KEY `idControlado` (`idControlado`);

--
-- Indices de la tabla `Empleados`
--
ALTER TABLE `Empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `Estatus`
--
ALTER TABLE `Estatus`
  ADD PRIMARY KEY (`E_Regresable`);

--
-- Indices de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `idSucursal` (`idSucursal`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `Medicamentos`
--
ALTER TABLE `Medicamentos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idClasificacion` (`idClasificacion`),
  ADD KEY `idProvedor` (`idProvedor`),
  ADD KEY `E_Regresable` (`E_Regresable`);

--
-- Indices de la tabla `Ofertas`
--
ALTER TABLE `Ofertas`
  ADD PRIMARY KEY (`idOferta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idDetallePedido` (`idDetallePedido`),
  ADD KEY `idProvedor` (`idProvedor`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `Provedores`
--
ALTER TABLE `Provedores`
  ADD PRIMARY KEY (`idProvedor`);

--
-- Indices de la tabla `Sucursal`
--
ALTER TABLE `Sucursal`
  ADD PRIMARY KEY (`id_Sucursal`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idDetalleVenta` (`idDetalleVenta`),
  ADD KEY `idSucursal` (`idSucursal`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Caducidades`
--
ALTER TABLE `Caducidades`
  MODIFY `idCaducidad` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clasificacion`
--
ALTER TABLE `Clasificacion`
  MODIFY `idClasificacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Comiciones`
--
ALTER TABLE `Comiciones`
  MODIFY `idComicion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Controlado`
--
ALTER TABLE `Controlado`
  MODIFY `idControlado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `DetallePedidos`
--
ALTER TABLE `DetallePedidos`
  MODIFY `idDetallePedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `DetalleVentas`
--
ALTER TABLE `DetalleVentas`
  MODIFY `idDetalleVenta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Empleados`
--
ALTER TABLE `Empleados`
  MODIFY `idEmpleado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Estatus`
--
ALTER TABLE `Estatus`
  MODIFY `E_Regresable` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  MODIFY `idInventario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Medicamentos`
--
ALTER TABLE `Medicamentos`
  MODIFY `idProducto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ofertas`
--
ALTER TABLE `Ofertas`
  MODIFY `idOferta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `idPedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Provedores`
--
ALTER TABLE `Provedores`
  MODIFY `idProvedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Sucursal`
--
ALTER TABLE `Sucursal`
  MODIFY `id_Sucursal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `idVenta` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Caducidades`
--
ALTER TABLE `Caducidades`
  ADD CONSTRAINT `Caducidades_ibfk_1` FOREIGN KEY (`idMedicamento`) REFERENCES `Medicamentos` (`idProducto`);

--
-- Filtros para la tabla `Comiciones`
--
ALTER TABLE `Comiciones`
  ADD CONSTRAINT `Comiciones_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `Medicamentos` (`idProducto`);

--
-- Filtros para la tabla `DetallePedidos`
--
ALTER TABLE `DetallePedidos`
  ADD CONSTRAINT `DetallePedidos_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `Medicamentos` (`idProducto`);

--
-- Filtros para la tabla `DetalleVentas`
--
ALTER TABLE `DetalleVentas`
  ADD CONSTRAINT `DetalleVentas_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `Medicamentos` (`idProducto`),
  ADD CONSTRAINT `DetalleVentas_ibfk_2` FOREIGN KEY (`idComicion`) REFERENCES `Comiciones` (`idComicion`),
  ADD CONSTRAINT `DetalleVentas_ibfk_3` FOREIGN KEY (`idControlado`) REFERENCES `Controlado` (`idControlado`);

--
-- Filtros para la tabla `Empleados`
--
ALTER TABLE `Empleados`
  ADD CONSTRAINT `Empleados_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`id_Sucursal`);

--
-- Filtros para la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD CONSTRAINT `Inventario_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`id_Sucursal`),
  ADD CONSTRAINT `Inventario_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Medicamentos` (`idProducto`);

--
-- Filtros para la tabla `Medicamentos`
--
ALTER TABLE `Medicamentos`
  ADD CONSTRAINT `Medicamentos_ibfk_1` FOREIGN KEY (`idClasificacion`) REFERENCES `Clasificacion` (`idClasificacion`),
  ADD CONSTRAINT `Medicamentos_ibfk_2` FOREIGN KEY (`idProvedor`) REFERENCES `Provedores` (`idProvedor`),
  ADD CONSTRAINT `Medicamentos_ibfk_3` FOREIGN KEY (`E_Regresable`) REFERENCES `Estatus` (`E_Regresable`);

--
-- Filtros para la tabla `Ofertas`
--
ALTER TABLE `Ofertas`
  ADD CONSTRAINT `Ofertas_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `Medicamentos` (`idProducto`);

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`idDetallePedido`) REFERENCES `DetallePedidos` (`idDetallePedido`),
  ADD CONSTRAINT `Pedidos_ibfk_2` FOREIGN KEY (`idProvedor`) REFERENCES `Provedores` (`idProvedor`),
  ADD CONSTRAINT `Pedidos_ibfk_3` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`id_Sucursal`);

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`idDetalleVenta`) REFERENCES `DetalleVentas` (`idDetalleVenta`),
  ADD CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursal` (`id_Sucursal`),
  ADD CONSTRAINT `Ventas_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleados` (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
