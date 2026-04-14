package com.app;

import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import java.util.Scanner;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

/**

* Clase encargada de manejar la conexión con la base de datos MySQL y realizar

* operaciones básicas como alta y lectura de registros.

*/

public class ConexionBD {

// Conexión estática para que pueda ser reutilizada

static Connection conexion = null;

static Scanner entrada = new Scanner(System.in);

/**

* Método que establece la conexión con la base de datos.

*

* @return objeto Connection que representa la conexión abierta.

* @throws SQLException si ocurre un error en la conexión.

*/

public static Connection obtenerConexion() throws SQLException {

// Parámetros de conexión


String url = "jdbc:mysql://localhost:3306/tabla";

String user = "root";

String password = "";

try {

// 1️⃣ Cargar el driver JDBC de MySQL

Class.forName("com.mysql.cj.jdbc.Driver");

// 2️⃣ Establecer la conexión con la base

conexion = DriverManager.getConnection(url, user, password);

System.out.println("✅ Conexión exitosa a MySQL");

} catch (ClassNotFoundException e) {

// Error si el driver JDBC no está disponible

throw new SQLException("❌ Driver JDBC de MySQL no encontrado", e);

} catch (SQLException e) {

// Error si no se puede conectar

throw new SQLException("❌ Error al conectar a la base de datos", e);

}

return conexion;


}

}