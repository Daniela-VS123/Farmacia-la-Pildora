<?php
// Conectar a la base de datos
$servername = "localhost";
$username = "root";  // Cambia esto por tu usuario de base de datos
$password = "";      // Cambia esto por tu contraseña de base de datos
$dbname = "Farmacia"; // Asegúrate de que este es el nombre de tu base de datos

// Crea la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener el idProducto desde la solicitud GET
$idProducto = $_GET['idProducto'] ?? '';  // Si no se pasa idProducto, será un string vacío

if (!empty($idProducto)) {
    // Consulta para obtener los detalles del producto
    $sql = "SELECT Nombre, PrecioVenta FROM Medicamentos WHERE idProducto = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $idProducto); // "i" significa entero
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Obtener el producto
        $product = $result->fetch_assoc();
        // Retornar los detalles del producto como un JSON
        echo json_encode($product);
    } else {
        // Producto no encontrado
        echo json_encode([]);
    }

    $stmt->close();
} else {
    // Si no se proporciona idProducto, retornar un array vacío
    echo json_encode([]);
}

$conn->close();
?>

