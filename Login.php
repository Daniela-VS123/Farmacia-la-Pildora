<?php
session_start();

// Configuración de la base de datos
$server = "localhost";
$user = "root";
$pass = "clave";
$db = "Farmacia";

// Crear conexión
$conexion = mysqli_connect($server, $user, $pass, $db);

// Verificar conexión
if (!$conexion) {
    die("Conexión fallida: " . mysqli_connect_error());
}

// Obtener datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['Nombre'];
    $password = $_POST['password'];

    // Preparar la consulta SQL
    $stmt = $conexion->prepare("SELECT nuevaPassword FROM Empleados WHERE Nombre = ?");
    $stmt->bind_param("s", $nombre);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($hashedPassword);
        $stmt->fetch();

        // Verificar la contraseña
        if (password_verify($password, $hashedPassword)) {
            $_SESSION['Nombre'] = $nombre;
            header("Location: Sistema-farmacia.html"); // Redirigir al sistema
            exit();
        } else {
            echo "Contraseña incorrecta.";
        }
    } else {
        echo "Usuario no encontrado.";
    }
    $stmt->close();
}

// Cerrar la conexión
mysqli_close($conexion);
?>
