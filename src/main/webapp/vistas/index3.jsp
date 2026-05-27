<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Menú de Deportes - Carpetazo</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilo/estilo.css">
</head>
<body>
	<a href="${pageContext.request.contextPath}/vistas/curso.jsp"> <img
		src="${pageContext.request.contextPath}/estilo/logo colores.png"
		alt="Logo Carpetazo" class="logo">
	</a>
	<div class="menu">

		<a class="futbol"
			href="${pageContext.request.contextPath}/vistas/anadirFutbol.jsp?id_deporte=1">
			Añadir Fútbol </a> <a class="basquet"
			href="${pageContext.request.contextPath}/vistas/añadirBasquet.jsp?id_deporte=3">
			Añadir Básquet </a> <a class="volley"
			href="${pageContext.request.contextPath}/vistas/anadirVolley.jsp?id_deporte=2">
			Añadir Volley </a> <a class="handball"
			href="${pageContext.request.contextPath}/vistas/añadirHandball.jsp?id_deporte=4">
			Añadir Handball </a>

	</div>

	<br>

	<a href="${pageContext.request.contextPath}/LeerTabla3"> Ver tabla
	</a>

	<br>

	<a href="${pageContext.request.contextPath}/Leer3"> Ver lista </a>
</body>
</html>

