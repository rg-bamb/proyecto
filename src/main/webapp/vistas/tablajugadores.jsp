<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Timestamp"%>

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
			Lista de Jugadores</div>

		<%
		ResultSet conjuntoJugadores = (ResultSet) request.getAttribute("conjuntoJugadores");
		int contador = 1;

		if (conjuntoJugadores != null && conjuntoJugadores.next()) {
			do {
				String id = conjuntoJugadores.getString("id");
				String nombre = conjuntoJugadores.getString("nombre");
				String apellido = conjuntoJugadores.getString("apellido");
				String curso = conjuntoJugadores.getString("curso");
				int equipo = conjuntoJugadores.getInt("id_equipo");
		%>

		<!-- CONTADOR -->
		<div class="dato">
			<%="Jugador " + contador%>
		</div>

		<!-- DATOS -->
		<div class="dato">
			<strong>Nombre:</strong>
			<%=nombre%>
			<strong>Apellido:</strong>
			<%=apellido%>
			<strong>Curso:</strong>
			<%=curso%>
			<strong>ID de Equipo:</strong>
			<%=equipo%>
		</div>

		<!-- BOTÓN ELIMINAR -->
		<form action="${pageContext.request.contextPath}/eliminarJugador"
			method="post" style="display: inline-block; margin-top: 10px;">

			<input type="hidden" name="idUnico" value="<%=id%>">

			<button type="submit"
				onclick="return confirm('¿Seguro que quieres eliminar este jugador?');"
				style="background-color: red; color: white; border: none; padding: 6px 12px; cursor: pointer;">
				Eliminar</button>
		</form>

		<!-- BOTÓN EDITAR -->


		<button type="button"
			onclick="window.location.href='${pageContext.request.contextPath}/vistas/editarJugadores.jsp?id=<%=id%>'"
			style="background-color: orange; color: white; border: none; padding: 6px 12px; cursor: pointer;">
			Editar</button>



		<%
		contador++;
		} while (conjuntoJugadores.next());
		} else {
		%>

		<div class="dato">No hay jugadores todavía.</div>

		<%
		}
		%>

		<a href="${pageContext.request.contextPath}/vistas/curso.jsp"
			class="boton"> Volver al inicio </a>

	</div>

</body>
</html>