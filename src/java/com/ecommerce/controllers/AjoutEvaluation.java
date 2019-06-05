package com.ecommerce.controllers;

import com.ecommerce.beans.Evaluation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.ecommerce.dao.ClientDB;
import org.ecommerce.dao.EvaluationDB;
import static org.ecommerce.dao.EvaluationDB.dejaEvaluer;
import static org.ecommerce.dao.EvaluationDB.modifierEvaluation;

@WebServlet("/client_interface/AjoutEvaluation")
public class AjoutEvaluation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession(false);
            String username = (String) session.getAttribute("username");
            int prixVente = Integer.parseInt(request.getParameter("prixVenteInteger"));
            int idProduit = Integer.parseInt(request.getParameter("id_produit"));
            int idMembre = ClientDB.getIdMembre(username);
            int nombreEtoile = Integer.parseInt(request.getParameter("star"));
            String commentaire = request.getParameter("commentaire"); 
            
            if (username != null && dejaEvaluer(idMembre, idProduit) == false) {          
                
                Evaluation evaluation = new Evaluation();
                
                evaluation.setNombreEtoile(nombreEtoile);
                evaluation.setCommentaire(commentaire);                
                evaluation.setIdMembre(idMembre);
                evaluation.setIdProduit(idProduit); 
                
                EvaluationDB.ajouter(evaluation); 
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('thank you for leaving a review');");                
                out.println("location='info_produit.jsp?id_produit="+idProduit+"&prixVenteInteger="+prixVente+"';");
                out.println("</script>");
                                
                
            }else if(dejaEvaluer(idMembre, idProduit) == true) {  
                modifierEvaluation(idProduit, idMembre, nombreEtoile, commentaire);
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('your review has been updated');");                
                out.println("location='info_produit.jsp?id_produit="+idProduit+"&prixVenteInteger="+prixVente+"';");
                out.println("</script>");                          
            }else if(username == null) {                
                
                response.sendRedirect("../login_interface/login.jsp");           
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
