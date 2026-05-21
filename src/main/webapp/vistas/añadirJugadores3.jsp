<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir - Carpetazo</title>

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

		<form action="${pageContext.request.contextPath}/altaJugador3"
			method="post">

			<div class="form-group">
				<label>Nombre:</label> <input type="text" name="nombre"
					value="${nombre}" required class="form-input">
			</div>

			<div class="form-group">
				<label>Apellido:</label> <input type="text" name="apellido"
					value="${apellido}" required class="form-input">
			</div>

			<div class="form-group">
				<label>Curso:</label> <select name="curso" required
					class="form-input">
					<option value="" disabled>Seleccione curso</option>

					<option value="5TGAO" ${curso=='5TGAO'?'selected':''}>5TGAO</option>
					<option value="5TME" ${curso=='5TME'?'selected':''}>5TME</option>
					<option value="5TC" ${curso=='5TC'?'selected':''}>5TC</option>
					<option value="5BACHI" ${curso=='5BACHI'?'selected':''}>5BACHI</option>

					<option value="6TGAO" ${curso=='6TGAO'?'selected':''}>6TGAO</option>
					<option value="6TME" ${curso=='6TME'?'selected':''}>6TME</option>
					<option value="6TC" ${curso=='6TC'?'selected':''}>6TC</option>
				</select>
			</div>

			<div class="form-group">
				<label>Equipo:</label> <select name="id_equipo" required
					class="form-input">

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
				<a href="${pageContext.request.contextPath}/Leer3"
					class="submit-button link-button">Volver</a>
			</div>

		</form>
	</div>

</body>
</html>