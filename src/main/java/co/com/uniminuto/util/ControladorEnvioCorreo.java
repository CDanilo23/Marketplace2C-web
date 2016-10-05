/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.util;

import co.com.uniminuto.entities.Usuario;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author pc
 */
public class ControladorEnvioCorreo {

    public static void envioCorreo(Usuario usuario) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", 587);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Session session;
        session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("thebigdani@gmail.com", "187983cdo");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("thebigdani@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(usuario.getCorreo()));
            message.setSubject("Registro de usuario en Marketplace " + new Date());
            message.setSentDate(new Date());
            final List<MimeBodyPart> parteMensaje = new ArrayList<MimeBodyPart>();
            MimeBodyPart mbp = new MimeBodyPart();
            //genera clave random pass
            StringBuilder sb = new StringBuilder(50);
            for (int x = 0; x < 6; x++) {
                sb.append((char) ((int) (Math.random() * 26) + 97));
            }
            mbp.setContent("Señor Cliente.  \n\n Sus credenciales son las siguientes: \n\n Usuario: " + usuario.getUsuario() + " \n\n Contraseña: " + usuario.getContrasena(), "text/plain");
            parteMensaje.add(mbp);
            final Multipart mp = new MimeMultipart();
            for (MimeBodyPart mbpEnC : parteMensaje) {
                mp.addBodyPart(mbpEnC);
            }
            message.setContent(mp);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
