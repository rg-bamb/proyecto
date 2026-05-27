package com.app;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/altaFutbol")
public class AltaFutbol extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. Obtener datos
		String curso = request.getParameter("curso");

		int idDeporte;
		int idEquipoLocal;
		int idEquipoVisitante;
		int puntosLocal;
		int puntosVisitante;

		try {

			idDeporte = Integer.parseInt(request.getParameter("id_deporte"));

			idEquipoLocal = Integer.parseInt(
					request.getParameter("id_equipo_local"));

			idEquipoVisitante = Integer.parseInt(
					request.getParameter("id_equipo_visitante"));

			puntosLocal = Integer.parseInt(
					request.getParameter("puntos_local"));

			puntosVisitante = Integer.parseInt(
					request.getParameter("puntos_visitante"));

		} catch (NumberFormatException e) {

			System.out.println("Error parseando datos");

			request.getRequestDispatcher("/vistas/error.jsp")
					.forward(request, response);

			return;
		}

		// 2. Validaciones
		if (curso == null || curso.isBlank()
				|| idDeporte <= 0
				|| idEquipoLocal <= 0
				|| idEquipoVisitante <= 0
				|| puntosLocal < 0
				|| puntosVisitante < 0) {

			request.getRequestDispatcher("/vistas/error.jsp")
					.forward(request, response);

			return;
		}

		Connection conexion = null;
		PreparedStatement declaracionPreparada = null;

		try {

			// 3. Conexión
			conexion = ConexionBD.obtenerConexion();

			// 4. SQL
			String sql = """
					INSERT INTO partido
					(id_local,
					id_visitante,
					puntos_local,
					puntos_visitante,
					id_deporte,
					curso)
					VALUES (?, ?, ?, ?, ?, ?)
					""";

			// 5. PreparedStatement
			declaracionPreparada = conexion.prepareStatement(sql);

			declaracionPreparada.setInt(1, idEquipoLocal);
			declaracionPreparada.setInt(2, idEquipoVisitante);
			declaracionPreparada.setInt(3, puntosLocal);
			declaracionPreparada.setInt(4, puntosVisitante);
			declaracionPreparada.setInt(5, idDeporte);
			declaracionPreparada.setString(6, curso);

			// 6. Ejecutar
			int filas = declaracionPreparada.executeUpdate();

			// 7. Verificar
			if (filas > 0) {

				System.out.println("Partido agregado correctamente");

				response.sendRedirect(
						request.getContextPath() + "/LeerTabla");

			} else {

				System.out.println("Error al insertar");

				request.getRequestDispatcher("/vistas/error.jsp")
						.forward(request, response);
			}

		} catch (SQLException e) {

			e.printStackTrace();

			request.setAttribute("error", e.getMessage());

			request.getRequestDispatcher("/vistas/error.jsp")
					.forward(request, response);

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
}