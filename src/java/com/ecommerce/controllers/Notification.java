package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.ecommerce.dao.ClientDB.modifierVuMbr;
import static org.ecommerce.dao.CommandeDB.modifierVuCommande;
import static org.ecommerce.dao.EvaluationDB.modifierVuEval;
import static org.ecommerce.dao.MessageDB.modifierVuMsg;

@WebServlet("/admin_interface/Notification")
public class Notification extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String modifierQuoi = request.getParameter("modifierQuoi");
            
            if(modifierQuoi.equals("membre") == true){
                
                modifierVuMbr();
                response.sendRedirect("nouveau_membre.jsp");
            }else if(modifierQuoi.equals("message") == true){
                
                modifierVuMsg();
                response.sendRedirect("message_client.jsp");
            }else if(modifierQuoi.equals("evaluationProduit") == true){
                
                modifierVuEval();
                response.sendRedirect("avis_produit.jsp");
            }else if(modifierQuoi.equals("commande") == true){
                
                modifierVuCommande();
                response.sendRedirect("commande.jsp");
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

    private void ModifierVumbr() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
