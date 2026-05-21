package com.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class EditarPartido2
 */
@WebServlet("/editarPartido2")
public class EditarPartido2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ===== RECIBIR DATOS =====
            String idStr = request.getParameter("id");
            String idLocalStr = request.getParameter("id_local");
            String idVisitanteStr = request.getParameter("id_visitante");
            String puntosLocalStr = request.getParameter("puntos_local");
            String puntosVisitanteStr = request.getParameter("puntos_visitante");
            String idDeporteStr = request.getParameter("id_deporte");

            // ===== DEBUG =====
            System.out.println("ID Partido: " + idStr);
            System.out.println("Local: " + idLocalStr);
            System.out.println("Visitante: " + idVisitanteStr);

            // ===== VALIDAR =====
            if (idStr == null || idStr.isEmpty() ||
                idLocalStr == null || idLocalStr.isEmpty() ||
                idVisitanteStr == null || idVisitanteStr.isEmpty() ||
                puntosLocalStr == null || puntosLocalStr.isEmpty() ||
                puntosVisitanteStr == null || puntosVisitanteStr.isEmpty() ||
                idDeporteStr == null || idDeporteStr.isEmpty()) {

                System.out.println("❌ ERROR: campos vacíos");

                response.sendRedirect(
                    request.getContextPath() + "/vistas/error.jsp"
                );
                return;
            }

            // ===== CONVERTIR =====
            int id = Integer.parseInt(idStr);
            int id_local = Integer.parseInt(idLocalStr);
            int id_visitante = Integer.parseInt(idVisitanteStr);
            int puntos_local = Integer.parseInt(puntosLocalStr);
            int puntos_visitante = Integer.parseInt(puntosVisitanteStr);
            int id_deporte = Integer.parseInt(idDeporteStr);

            // ===== SQL =====
            String sql = "UPDATE partido "
                    + "SET id_local=?, "
                    + "id_visitante=?, "
                    + "puntos_local=?, "
                    + "puntos_visitante=?, "
                    + "id_deporte=? "
                    + "WHERE id=?";

            try (
                Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement ps = conexion.prepareStatement(sql)
            ) {

                ps.setInt(1, id_local);
                ps.setInt(2, id_visitante);
                ps.setInt(3, puntos_local);
                ps.setInt(4, puntos_visitante);
                ps.setInt(5, id_deporte);
                ps.setInt(6, id);

                int filas = ps.executeUpdate();

                if (filas > 0) {

                    System.out.println("✅ Partido actualizado");

                    response.sendRedirect(
                        request.getContextPath() + "/LeerTabla2"
                    );

                } else {

                    System.out.println("❌ No se actualizó");

                    response.sendRedirect(
                        request.getContextPath() + "/vistas/error.jsp"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                request.getContextPath() + "/vistas/error.jsp"
            );
        }
    }
}
