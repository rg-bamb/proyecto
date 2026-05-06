<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Error - Carpetazo</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/error.css">
 </head>
<body>

  <!-- Logo -->
    <img src="${pageContext.request.contextPath}/estilo/logo colores.png" alt="Logo Carpetazo" class="logo">

  <!-- Mensaje de error -->
  <div class="error-container">
    <h1>hubo un error</h1>
    <p>Ha ocurrido un problema al procesar tu solicitud.</p>

    <!-- Botón para volver al inicio -->
    <a href="${pageContext.request.contextPath}/vistas/index.jsp" class="btn-volver">Volver al inicio</a>
  </div>

</body>
</html>