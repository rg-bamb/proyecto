<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Fútbol - Carpetazo</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/opciones.css">
</head>
<body>
  <a href="${pageContext.request.contextPath}/vistas/index.jsp">
    <img src="${pageContext.request.contextPath}/estilo/Copilot_20251023_100707-removebg-preview.png" alt="Logo Carpetazo" class="logo">
  </a>



  <div class="form-container">
    <h1>Registrar Resultado</h1>
    <form action="${pageContext.request.contextPath}/AltaServlet" method="post">
      <label for="equipo1">Equipo 1:</label>
      <input type="text" id="equipo1" name="equipo1" required>

      <label for="resultado1">Resultado 1:</label>
      <input type="number" id="resultado1" name="resultado1" min="0" required>

      <label for="resultado2">Resultado 2:</label>
      <input type="number" id="resultado2" name="resultado2" min="0" required>

      <label for="equipo2">Equipo 2:</label>
      <input type="text" id="equipo2" name="equipo2" required>

      <button type="submit">Enviar</button>
    </form>
  </div>
  
  
  
  
</body>

</html>
