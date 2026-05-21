<!DOCTYPE html>
<html lang="es">
<head>
  <meta  charset="UTF-8">
  <title>Menú de Deportes - Carpetazo</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/estilo.css">
</head>
<body>
  <a href="${pageContext.request.contextPath}/vistas/curso.jsp">
    <img src="${pageContext.request.contextPath}/estilo/logo colores.png" alt="Logo Carpetazo" class="logo">
  </a>

  <div class="menu">
    <a href="${pageContext.request.contextPath}/vistas/futbol.jsp" class="futbol">Fútbol</a>
    <a href="${pageContext.request.contextPath}/vistas/basquet.jsp" class="basquet">Básquet</a>
    <a href="${pageContext.request.contextPath}/vistas/handball.jsp" class="handball">Handball</a>
    <a href="${pageContext.request.contextPath}/vistas/volley.jsp" class="volley">Vólley</a>
  </div>
  
  <br>
  
  <a href="${pageContext.request.contextPath}/LeerTabla2">
  		Ver tabla
  </a>
  
  <a href="${pageContext.request.contextPath}/Leer2">
  		Ver lista
  </a>
</body>
</html>
