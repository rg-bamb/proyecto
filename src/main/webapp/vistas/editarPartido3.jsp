<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar Partido - Carpetazo</title>

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

		<h1 class="form-title">Editar Partido</h1>

		<form action="${pageContext.request.contextPath}/editarPartido3"
			method="post">

			<!-- ID DEL PARTIDO -->
			<input type="hidden" name="id" value="${param.id}">

			<div class="form-group">
				<label>ID Local:</label> <input type="number" name="id_local"
					value="${id_local}" required class="form-input">
			</div>

			<div class="form-group">
				<label>ID Visitante:</label> <input type="number"
					name="id_visitante" value="${id_visitante}" required
					class="form-input">
			</div>

			<div class="form-group">
				<label>Puntos Local:</label> <input type="number"
					name="puntos_local" value="${puntos_local}" required
					class="form-input">
			</div>

			<div class="form-group">
				<label>Puntos Visitante:</label> <input type="number"
					name="puntos_visitante" value="${puntos_visitante}" required
					class="form-input">
			</div>

			<div class="form-group">
				<label>Deporte:</label> <select name="id_deporte" required
					class="form-input">

					<option value="" disabled>Seleccione deporte</option>

					<option value="1" ${id_deporte==1?'selected':''}>Fútbol</option>
					<option value="2" ${id_deporte==2?'selected':''}>Vóley</option>
					<option value="3" ${id_deporte==3?'selected':''}>Básquet</option>
					<option value="4" ${id_deporte==4?'selected':''}>Handball</option>

				</select>
			</div>



			<div class="button-container">
				<input type="submit" value="Guardar Cambios" class="submit-button">
			</div>

			<div class="button-container">
				<a href="${pageContext.request.contextPath}/LeerTabla3"
					class="submit-button link-button"> Volver </a>
			</div>

		</form>

	</div>

</body>
</html>