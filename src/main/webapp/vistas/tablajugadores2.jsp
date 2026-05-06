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

  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/tablajudores.css">
</head>
<body>

 <a href="${pageContext.request.contextPath}/vistas/curso.jsp">
    <img src="${pageContext.request.contextPath}/estilo/logo colores.png" alt="Logo Carpetazo" class="logo">
      </a>


<div class="contenedor">

    <div class="dato" style="font-size:1.4em; font-weight:bold; margin-bottom:20px;">
        Resultados de Partidos
    </div>

<%
    ResultSet conjuntoJugadores2 = (ResultSet) request.getAttribute("conjuntoJugadores2");

int contador = 1;

    if (conjuntoJugadores2 != null && conjuntoJugadores2.next()) {
        do {
            String id = conjuntoJugadores2.getString("id");
            String nombre = conjuntoJugadores2.getString("nombre");
            String apellido = conjuntoJugadores2.getString("apellido");
            String curso = conjuntoJugadores2.getString("curso");
            int id_equipo = conjuntoJugadores2.getInt("id_equipo");
%>




    <!-- CONTADOR VISUAL -->
    <div class="dato">
<%
    out.print("Jugador " + contador);
%>
</div>

   <div class="dato">
  
    <strong>Nombre:</strong> <%=nombre%> 
    <strong>Apellido:</strong> <%=apellido%> 
    <strong>Curso:</strong> <%=curso%> 
    <strong>ID Equipo:</strong> <%=id_equipo%>
</div>

    <form action="${pageContext.request.contextPath}/eliminarJugador2" method="post"
          style="display:inline-block; margin-top:10px;">

        <input type="hidden" name="idUnico" value="<%=id%>">

        <button type="submit"
                onclick="return confirm('¿Seguro que quieres eliminar este jugador?');"
                style="background-color:red; color:white; border:none; padding:6px 12px; cursor:pointer;">
            Eliminar
        </button>
    </form>
    
    <form action="${pageContext.request.contextPath}/vistas/editar.jsp" method="get"
      style="display:inline-block; margin-left:10px;">

    <input type="hidden" name="id" value="<%=id%>">

    <button type="submit"
            style="background-color:orange; color:white; border:none; padding:6px 12px; cursor:pointer;">
        Editar
    </button>
</form>


 <%
            contador++;
        } while (conjuntoJugadores2.next());
    } else {
%>

    <div class="dato">No hay partidos todavía.</div>

<%
    }
%>

    <a href="${pageContext.request.contextPath}/vistas/curso.jsp" class="boton">
        Volver al inicio
    </a>

</div>

</body>
</html>
