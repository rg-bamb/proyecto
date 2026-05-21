<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Lista - Carpetazo</title>

<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilo/tablajudores.css">

</head>
<body>

	<a href="${pageContext.request.contextPath}/vistas/curso.jsp"> <img
		src="${pageContext.request.contextPath}/estilo/logo colores.png"
		alt="Logo Carpetazo" class="logo">
	</a>

	<div class="contenedor">

		<div class="dato"
			style="font-size: 1.4em; font-weight: bold; margin-bottom: 20px;">
			Lista de Partidos</div>

		<%
		ResultSet conjuntoPartidos = (ResultSet) request.getAttribute("conjuntoPartidos");

		int contador = 1;

		if (conjuntoPartidos != null && conjuntoPartidos.next()) {

			do {

				int id = conjuntoPartidos.getInt("id");
				int id_local = conjuntoPartidos.getInt("id_local");
				int id_visitante = conjuntoPartidos.getInt("id_visitante");

				int puntos_local = conjuntoPartidos.getInt("puntos_local");

				int puntos_visitante = conjuntoPartidos.getInt("puntos_visitante");

				int id_deporte = conjuntoPartidos.getInt("id_deporte");

				String curso = conjuntoPartidos.getString("curso");
		%>

		<!-- CONTADOR -->
		<div class="dato">
			<%="Partido " + contador%>
		</div>

		<!-- DATOS -->
		<div class="dato">

			<strong>ID Partido:</strong>
			<%=id%>

			<strong>ID Local:</strong>
			<%=id_local%>

			<strong>ID Visitante:</strong>
			<%=id_visitante%>

			<strong>Puntos Local:</strong>
			<%=puntos_local%>

			<strong>Puntos Visitante:</strong>
			<%=puntos_visitante%>

			<strong>ID Deporte:</strong>
			<%=id_deporte%>

			<strong>Curso:</strong>
			<%=curso%>

		</div>
		<!-- BOTÓN ELIMINAR -->
		<form action="${pageContext.request.contextPath}/eliminarPartido"
			method="post" style="display: inline-block; margin-top: 10px;">

			<input type="hidden" name="idUnico" value="<%=id%>">

			<button type="submit"
				onclick="return confirm('¿Seguro que quieres eliminar este partido?');"
				style="background-color: red; color: white; border: none; padding: 6px 12px; cursor: pointer;">
				Eliminar</button>
		</form>

		<!-- BOTÓN EDITAR -->


		<button type="button"
			onclick="window.location.href='${pageContext.request.contextPath}/vistas/editarPartido.jsp?id=<%=id%>'"
			style="background-color: orange; color: white; border: none; padding: 6px 12px; cursor: pointer;">
			Editar</button>


		<%
		contador++;

		} while (conjuntoPartidos.next());

		} else {
		%>

		<div class="dato">No hay partidos todavía.</div>

		<%
		}
		%>


		<a href="${pageContext.request.contextPath}/vistas/curso.jsp"
			class="boton"> Volver al inicio </a>

	</div>

</body>
</html>