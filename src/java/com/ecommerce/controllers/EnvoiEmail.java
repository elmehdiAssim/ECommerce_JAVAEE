package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.ecommerce.dao.MessageDB.repondreMsg;

@WebServlet("/admin_interface/EnvoiEmail")
public class EnvoiEmail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String reponse = request.getParameter("reponse");
            String emailClient = request.getParameter("email");
            int idMessage = Integer.parseInt(request.getParameter("id_message"));
                
            /* Remarque : parfois l'envoi de l'email ne fonctionne pas,
               pour remédier à ce problème il faut penser à désactiver le pare-feu Windows
            */
           
            final String username = "elmehdiensias@gmail.com";
            final String password = "ensias2019";
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            
            Session session = Session.getInstance(props,
              new javax.mail.Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                    }
              });
            try {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("elmehdiensias@gmail.com"));
                    message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(emailClient));
                    message.setSubject("de Phonix");
                    message.setText(reponse);
                    Transport.send(message);    
                    /* ici on a fini le transmet le message à l'email du client 
                       maintenant il faut enregistrer la réponse envoyer au Database et indiquer le
                       message comme répondu */
                    
                    repondreMsg(reponse, idMessage);
                    
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Le message est envoyé');");                
                    out.println("location='message_client.jsp';");
                    out.println("</script>");                    
            } catch (Exception e) {
                System.out.println(e);
            }    
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
