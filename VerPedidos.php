<?php
// Conectar a la base de datos
$server = "localhost";
$user = "root";
$pass = "clave";  // Cambia esta clave por la correcta
$db = "Farmacia";

// Crear la conexión
$conexion = mysqli_connect($server, $user, $pass, $db);

// Verificar la conexión
if (!$conexion) {
    die("Conexión fallida: " . mysqli_connect_error());
}

// Obtener los pedidos
$sqlPedidos = "SELECT p.idPedido, p.FechaPedido, p.Estado, p.idDetallePedido 
               FROM Pedidos p
               ORDER BY p.FechaPedido DESC";
$resultPedidos = mysqli_query($conexion, $sqlPedidos);

// Verificar si hay pedidos
if (mysqli_num_rows($resultPedidos) > 0) {
    // Almacenar los pedidos en un arreglo
    $pedidos = [];
    while ($pedido = mysqli_fetch_assoc($resultPedidos)) {
        // Para cada pedido, obtener sus detalles
        $idDetallePedido = $pedido['idDetallePedido'];  // Usamos idDetallePedido

        // Obtener los detalles del pedido usando idDetallePedido
        $sqlDetalles = "SELECT dp.idProducto, dp.Cantidad, dp.Precio, m.Nombre AS ProductoNombre
                        FROM DetallePedidos dp
                        JOIN Medicamentos m ON dp.idProducto = m.idProducto
                        WHERE dp.idDetallePedido = '$idDetallePedido'";  // Relacionamos con idDetallePedido
        $resultDetalles = mysqli_query($conexion, $sqlDetalles);

        $detalles = [];
        if (mysqli_num_rows($resultDetalles) > 0) {
            while ($detalle = mysqli_fetch_assoc($resultDetalles)) {
                $detalles[] = $detalle;  // Almacena los detalles de este pedido
            }
        }

        // Guardar el pedido con sus detalles
        $pedido['detalles'] = $detalles;
        $pedidos[] = $pedido;
    }
} else {
    $pedidos = [];
}

// Cerrar la conexión
mysqli_close($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Pedidos - Sistema de Farmacia</title>
    <link rel="stylesheet" href="MosPedidos.css"> <!-- Archivo CSS para estilos -->
</head>
<body>
    <header class="header">
        <div class="header-box">
            <img src="Logo farmacia.png" alt="Logo de la Farmacia" class="header-logo">
            <h1>Ver Pedidos</h1>
        </div>
    </header>

    <main class="main-container">
        <table class="order-table">
            <thead>
                <tr>
                    <th>ID Pedido</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Producto(s)</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <?php if (count($pedidos) > 0): ?>
                    <?php foreach ($pedidos as $pedido): ?>
                        <?php
                        $totalPedido = 0; // Inicializamos el total del pedido
                        $productos = '';
                        $cantidades = '';
                        $precios = '';
                        $totalProductos = '';

                        // Iteramos sobre los detalles del pedido
                        foreach ($pedido['detalles'] as $detalle) {
                            $productos .= $detalle['ProductoNombre'] . "<br>";
                            $cantidades .= $detalle['Cantidad'] . "<br>";
                            $precios .= number_format($detalle['Precio'], 2) . " MXN<br>";
                            $totalProductos .= number_format($detalle['Cantidad'] * $detalle['Precio'], 2) . " MXN<br>";
                            $totalPedido += $detalle['Cantidad'] * $detalle['Precio'];
                        }
                        ?>
                        <tr>
                            <td><?= $pedido['idPedido'] ?></td>
                            <td><?= $pedido['FechaPedido'] ?></td>
                            <td><?= $pedido['Estado'] ?></td>
                            <td><?= $productos ?></td>
                            <td><?= $cantidades ?></td>
                            <td><?= $precios ?></td>
                            <td><?= number_format($totalPedido, 2) ?> MXN</td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="7">No hay pedidos registrados.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </main>
</body>
</html>



