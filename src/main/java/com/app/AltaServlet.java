package com.app;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AltaServlet")
public class AltaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	// 1. Capturar parámetros del formulario (autor, comentario).
        String equipo1 = request.getParameter("equipo1");
        String equipo2 = request.getParameter("equipo2");
        int  resultado1;
        int  resultado2;
        

        //parseo
        try {
         resultado1 = Integer.parseInt(request.getParameter("resultado1"));
         resultado2 = Integer.parseInt(request.getParameter("resultado2"));
         
        } catch (NumberFormatException e) {
            // Si no son números válidos, ir a la página de error
            request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
            return;
        }
     // 2. Validar que no estén vacíos.
        if (equipo1 == null || equipo1.isBlank() || equipo2 == null || equipo2.isBlank() || resultado1 < 0 || resultado2 < 0) {
            // Si algún campo es inválido, ir a la página de error
            request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
            return;
        }

     // 3. Subir datos a la BD.
     // Paso 1: conectar con la base de datos
        Connection conexion = null;
        PreparedStatement declaracionPreparada = null;

        try {
            conexion = ConexionBD.obtenerConexion();
            
            String sql = "INSERT INTO tabla (equipo1, resultado1, resultado2, equipo2) VALUES (?, ?, ?, ?)";
            
            // Paso 3: crear el PreparedStatement
            declaracionPreparada = conexion.prepareStatement(sql);

            // Paso 4: reemplazar los ? con los valores recibidos
            declaracionPreparada.setString(1, equipo1);
            declaracionPreparada.setInt(2, resultado1);
            declaracionPreparada.setInt(3, resultado2);
            declaracionPreparada.setString(4, equipo2);

            // Paso 5: ejecutar el INSERT.
	    	// la variable entera "filas" será igual a 1 si se creó un dato, o 0 si no se creó nada.
            int filas = declaracionPreparada.executeUpdate();

            // Paso 6: verificar si se insertó correctamente
            if (filas > 0) {
                request.setAttribute("mensajeExito", "¡Datos guardados correctamente!");
                System.out.println("Datos guardados correctamente!");
                request.getRequestDispatcher("/vistas/index.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            // Paso 7: manejo de errores
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/error.jsp").forward(request, response);
        } finally {
            try {
                if (declaracionPreparada != null) declaracionPreparada.close();
                if (conexion != null) conexion.close();
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
