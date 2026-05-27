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

  <div>
    <a href="${pageContext.request.contextPath}/vistas/index.jsp?curso=1ro/2do">1°/2°</a>
    <a href="${pageContext.request.contextPath}/vistas/index2.jsp?curso=3ro/4to" >3°/4°</a>
    <a href="${pageContext.request.contextPath}/vistas/index3.jsp?curso=5to/6to" >5°/6°</a>
 
  </div>
  
  <br>
  
  
</body>
</html>