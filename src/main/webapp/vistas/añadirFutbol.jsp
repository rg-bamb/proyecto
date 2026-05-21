<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String idDeporte = request.getParameter("id_deporte");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dato recibido</title>
</head>
<body>

<h1>ID DEPORTE RECIBIDO</h1>

<p>El valor recibido es: <%= idDeporte %></p>

</body>
</html>