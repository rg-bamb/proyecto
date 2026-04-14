<!DOCTYPE html>
<html lang="es">
<head>
  <meta  charset="UTF-8">
  <title>Menú de Deportes - Carpetazo</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/estilo.css">
</head>
<body>
  <a href="${pageContext.request.contextPath}/vistas/index.jsp">
    <img src="${pageContext.request.contextPath}/estilo/Copilot_20251023_100707-removebg-preview.png" alt="Logo Carpetazo" class="logo">
  </a>

  <div class="menu">
    <a href="${pageContext.request.contextPath}/vistas/futbol.jsp" class="futbol">Fútbol</a>
    <a href="${pageContext.request.contextPath}/vistas/basquet.jsp" class="basquet">Básquet</a>
    <a href="${pageContext.request.contextPath}/vistas/handball.jsp" class="handball">Handball</a>
    <a href="${pageContext.request.contextPath}/vistas/volley.jsp" class="volley">Vólley</a>
  </div>
  
  <br>
  
  <a href="${pageContext.request.contextPath}/Leer">
  		Ver tabla
  </a>
</body>
</html>
