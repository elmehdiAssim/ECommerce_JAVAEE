package com.ecommerce.controllers;

import com.ecommerce.beans.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.ecommerce.dao.ClientDB;
import org.ecommerce.dao.MessageDB;

@WebServlet("/client_interface/EnvoiMsgParClient")
public class EnvoiMsgParClient extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession(false);
            String username = (String) session.getAttribute("username");
            if (username == null) {       
                
                response.sendRedirect("../login_interface/login.jsp");
            }else {
                
                String message = request.getParameter("message");                
                int idMembre = ClientDB.getIdMembre(username);
                
                Message msg = new Message();
                
                msg.setMessage(message);                
                msg.setiDMembre(idMembre);
                
                MessageDB.ajouter(msg);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Le message est envoyé, Merci pour nous avoir contacté');");                
                out.println("location='client_envoi_msg.jsp';");
                out.println("</script>");                                
            }        
            
            out.close();
            
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
