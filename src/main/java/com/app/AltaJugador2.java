package com.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/altaJugador2")
public class AltaJugador2 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. Obtener datos del formulario
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String curso = request.getParameter("curso");

		int idEquipo;

		// 2. Parsear id_equipo
		try {

			idEquipo = Integer.parseInt(request.getParameter("id_equipo"));

		} catch (NumberFormatException e) {
System.out.println("error 1");
			request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
			return;
		}

		// 3. Validaciones
		if (nombre == null || nombre.isBlank() || apellido == null || apellido.isBlank() || curso == null
				|| curso.isBlank() || idEquipo <= 0) {

			request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
			return;
		}

		Connection conexion = null;
		PreparedStatement declaracionPreparada = null;

		try {

			// 4. Conexión
			conexion = ConexionBD.obtenerConexion();

			// 5. SQL
			String sql = "INSERT INTO persona (nombre, apellido, curso, id_equipo) VALUES (?, ?, ?, ?)";
			// 6. PreparedStatement
			declaracionPreparada = conexion.prepareStatement(sql);

			declaracionPreparada.setString(1, nombre);
			declaracionPreparada.setString(2, apellido);
			declaracionPreparada.setString(3, curso);
			declaracionPreparada.setInt(4, idEquipo);

			// 7. Ejecutar INSERT
			int filas = declaracionPreparada.executeUpdate();

			// 8. Verificar resultado
			if (filas > 0) {

			    request.setAttribute("mensajeExito",
			            "Jugador agregado correctamente");

			    System.out.println("Jugador agregado correctamente");

			    response.sendRedirect(
			            request.getContextPath() + "/Leer2");

			} else {

				request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
				System.out.println("error 2");
			}

		} catch (SQLException e) {

			e.printStackTrace();

			request.setAttribute("error", e.getMessage());

			request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
			System.out.println("error 3");
		} finally {

			try {

				if (declaracionPreparada != null) {
					declaracionPreparada.close();
				}

				if (conexion != null) {
					conexion.close();
				}

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}