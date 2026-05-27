<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id_deporte = request.getParameter("id_deporte");
String curso = request.getParameter("curso");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir Partido - Carpetazo</title>

<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilo/editar.css">

<style>
.logo {
	position: absolute;
	top: 20px;
	left: 20px;
	width: 120px;
}
</style>


</head>
<body>

	<a href="${pageContext.request.contextPath}/vistas/curso.jsp"> <img
		src="${pageContext.request.contextPath}/estilo/logo colores.png"
		alt="Logo" class="logo">
	</a>



	<div class="form-container">
		<h1 class="form-title">Añadir Jugador</h1>

		<form action="${pageContext.request.contextPath}/altaFutbol?id_deporte=1&curso=<%= curso %>"
			method="post">

			
			<div class="form-group">
				<label>Equipo 1:</label> <select name="id_equipo_local" required class="form-input">

					<!-- 🔴 CLAVE: no permite enviar vacío -->
					<option value="" disabled>Seleccione equipo</option>

					<option value="1" ${id_equipo==1?'selected':''}>ROJO</option>
					<option value="2" ${id_equipo==2?'selected':''}>VERDE</option>
					<option value="3" ${id_equipo==3?'selected':''}>AMARILLO</option>
					<option value="4" ${id_equipo==4?'selected':''}>AZUL</option>
				</select>
			</div>
			
			
			

			<div class="form-group">
				<label></label> <input type="text" name="puntos_local"
					value="${puntos_local}" required class="form-input">
			</div>
			
			<div class="form-group">
				<label></label> <input type="text" name="puntos_visitante"
					value="${puntos_visitante}" required class="form-input">
			</div>

			

			<div class="form-group">
				<label>Equipo 2:</label> <select name="id_equipo_visitante" required class="form-input">

					<!-- 🔴 CLAVE: no permite enviar vacío -->
					<option value="" disabled>Seleccione equipo</option>

					<option value="1" ${id_equipo==1?'selected':''}>ROJO</option>
					<option value="2" ${id_equipo==2?'selected':''}>VERDE</option>
					<option value="3" ${id_equipo==3?'selected':''}>AMARILLO</option>
					<option value="4" ${id_equipo==4?'selected':''}>AZUL</option>
				</select>
			</div>






			<div class="button-container">
				<input type="submit" value="Guardar Cambios" class="submit-button">
			</div>


			<div class="button-container">
				<a href="${pageContext.request.contextPath}/Leer"
					class="submit-button link-button">Volver</a>
			</div>

		</form>
	</div>

</body>
</html>