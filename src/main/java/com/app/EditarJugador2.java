package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editarJugador2")
public class EditarJugador2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // 🔹 DEBUG (ver qué llega)
            System.out.println("ID raw: " + request.getParameter("id"));
            System.out.println("Equipo raw: " + request.getParameter("id_equipo"));

            // 🔹 Obtener como String primero
            String idStr = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String curso = request.getParameter("curso");
            String equipoStr = request.getParameter("id_equipo");

            // 🔹 Validar vacíos
            if (idStr == null || idStr.isEmpty() ||
                equipoStr == null || equipoStr.isEmpty()) {

                System.out.println("❌ ERROR: datos vacíos");
                response.sendRedirect(request.getContextPath() + "/vistas/error.jsp");
                return;
            }

            // 🔹 Convertir
            int id = Integer.parseInt(idStr);
            int id_equipo = Integer.parseInt(equipoStr);

            // 🔹 SQL
            String sql = "UPDATE persona SET nombre=?, apellido=?, curso=?, id_equipo=? WHERE id=?";

            try (Connection conexion = ConexionBD.obtenerConexion();
                 PreparedStatement ps = conexion.prepareStatement(sql)) {

                ps.setString(1, nombre);
                ps.setString(2, apellido);
                ps.setString(3, curso);
                ps.setInt(4, id_equipo);
                ps.setInt(5, id);

                int filas = ps.executeUpdate();

                if (filas > 0) {
                    System.out.println("✅ UPDATE exitoso");
                    response.sendRedirect(request.getContextPath() + "/Leer2");
                } else {
                    System.out.println("❌ No se actualizó nada");
                    response.sendRedirect(request.getContextPath() + "/vistas/error.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/vistas/error.jsp");
        }
    }
}