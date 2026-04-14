<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Timestamp"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Resultados - Carpetazo</title>

  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/estilo/tabla.css">
</head>
<body>

 <a href="${pageContext.request.contextPath}/vistas/index.jsp">
    <img src="${pageContext.request.contextPath}/estilo/Copilot_20251023_100707-removebg-preview.png" alt="Logo Carpetazo" class="logo">
  </a>


<div class="contenedor">

    <div class="dato" style="font-size:1.4em; font-weight:bold; margin-bottom:20px;">
        Resultados de Partidos
    </div>

<%
    ResultSet conjuntoResultados = (ResultSet) request.getAttribute("conjuntoResultados");

    if (conjuntoResultados != null && conjuntoResultados.next()) {
        do {
            String id = conjuntoResultados.getString("id");
            String equipo1 = conjuntoResultados.getString("equipo1");
            String equipo2 = conjuntoResultados.getString("equipo2");
            int resultado1 = conjuntoResultados.getInt("resultado1");
            int resultado2 = conjuntoResultados.getInt("resultado2");
%>

    <div class="dato">Partido <%=id%></div>

    <div class="dato">
        <strong><%=equipo1%></strong>
        <span style="margin:0 10px;"><%=resultado1%> - <%=resultado2%></span>
        <strong><%=equipo2%></strong>
    </div>

<%
        } while (conjuntoResultados.next());
    } else {
%>

    <div class="dato">No hay partidos todavía.</div>

<%
    }
%>

    <a href="${pageContext.request.contextPath}/vistas/index.jsp" class="boton">
        Volver al inicio
    </a>

</div>

</body>
</html>
