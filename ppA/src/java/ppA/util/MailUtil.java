/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ppA.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import ppA.actions.BaseAction;

/**
 *
 * @author luis
 */
public class MailUtil extends BaseAction {

    public void sendMail(String name) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("need.for.sleeps@gmail.com", "");
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("need.for.sleeps@gmail.com", "Alexis"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse("alexisgservando@gmail.com"));
            message.setSubject("Nuevo Usuario Registrado");
            message.setText("Usuario Registrado con exito!"
                    + "\n\nNombre de usuario: " + name);

            Transport.send(message);
        } catch (Exception e) {
            e(e);
        }
    }
}
