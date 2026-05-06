<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar - Carpetazo</title>

<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/editar.css">

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

<a href="${pageContext.request.contextPath}/vistas/curso.jsp">
    <img src="${pageContext.request.contextPath}/estilo/logo colores.png"
         alt="Logo" class="logo">
</a>

<div class="form-container">
    <h1 class="form-title">Editar Jugador</h1>

    <form action="${pageContext.request.contextPath}/editarJugador"
          method="post">

        <!-- 🔹 IMPORTANTE: id oculto -->
       <input type="hidden" name="id" value="${param.id}">
        
        <%
            System.out.println("ID en jsp: " + request.getParameter("id"));
            %>
        <div class="form-group">
            <label>Nombre:</label>
            <input type="text" name="nombre"
                   value="${nombre}" required class="form-input">
        </div>

        <div class="form-group">
            <label>Apellido:</label>
            <input type="text" name="apellido"
                   value="${apellido}" required class="form-input">
        </div>

        <div class="form-group">
            <label>Curso:</label>
            <select name="curso" required class="form-input">
                <option value="" disabled>Seleccione curso</option>

                <option value="1A" ${curso=='1A'?'selected':''}>1A</option>
                <option value="1B" ${curso=='1B'?'selected':''}>1B</option>
                <option value="1C" ${curso=='1C'?'selected':''}>1C</option>
                <option value="1D" ${curso=='1D'?'selected':''}>1D</option>

                <option value="2A" ${curso=='2A'?'selected':''}>2A</option>
                <option value="2B" ${curso=='2B'?'selected':''}>2B</option>
                <option value="2C" ${curso=='2C'?'selected':''}>2C</option>
                <option value="2D" ${curso=='2D'?'selected':''}>2D</option>
            </select>
        </div>

        <div class="form-group">
            <label>Equipo:</label>
            <select name="id_equipo" required class="form-input">

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