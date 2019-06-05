package com.ecommerce.controllers;

import com.ecommerce.beans.Commande;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.ecommerce.dao.ClientDB.getIdMembre;
import static org.ecommerce.dao.CommandeDB.ajouter;
import static org.ecommerce.dao.LigneCommandeDB.ajouterLigneCommande;

@WebServlet("/login_interface/AjoutCommande")
public class AjoutCommande extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");       
            
        /* Début : information pour la commande */            
            String adresseLivraison = request.getParameter("adresseLivraison");
            int numComptePaiement = Integer.parseInt(request.getParameter("numComptePaiement"));
            int idMembre = getIdMembre(username);
        /* Fin : information pour la commande */
            
            /* Débbut : get the usebean */
            Commande commande = new Commande();            
            commande.setAdresseLivraison(adresseLivraison);
            commande.setNumComptePaiement(numComptePaiement);
            commande.setIdMembre(idMembre);           
            /* Fin : get usebean*/
            
            
            
        /* Début : information pour les ligne de commande */
            Hashtable panier = (Hashtable) session.getAttribute("panier");
            
            ajouter(commande); // ajouter commande à la base de données                      
            ajouterLigneCommande(panier);
            panier.clear();
            
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Merci pour avoir commandé de notre site');");                
            out.println("location='../client_interface/annonce.jsp';");
            out.println("</script>");
            
        /* Début : information pour les ligne de commande */   
            
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
