/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.controlador;

import co.com.uniminuto.ejb.ArchivoFacadeLocal;
import co.com.uniminuto.entities.Archivo;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author cristian.ordonez
 */
@WebServlet("/ControladorImagenes")
@MultipartConfig(maxFileSize = 16177215)
public class ControladorImagenes extends HttpServlet {

    @EJB
    ArchivoFacadeLocal archivoFacadeLocal;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreImg = request.getParameter("nombreImg");
        InputStream inputStream = null; // input stream of the upload file
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        if (inputStream != null) {
            Archivo archivo = new Archivo();
            archivo.setNombre(nombreImg);
            archivo.setImg(convertirInputStreamAByte(inputStream));
            archivoFacadeLocal.create(archivo);
        }
    }

    public static byte[] convertirInputStreamAByte(InputStream input) throws IOException {
        byte[] buffer = new byte[8192];
        int bytesRead;
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        while ((bytesRead = input.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }
        return output.toByteArray();
    }
}
