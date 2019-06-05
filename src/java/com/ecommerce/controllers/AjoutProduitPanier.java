package com.ecommerce.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/client_interface/AjoutProduitPanier")
public class AjoutProduitPanier extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession(false);
            String username = (String) session.getAttribute("username");
            if (username == null) {       
                
                response.sendRedirect("../login_interface/login.jsp");
            } else {
                
                Hashtable panier = (Hashtable) session.getAttribute("panier");
                int idProduit = Integer.parseInt(request.getParameter("idProduit"));
                /* tester si le produit existe dans le panier */
                boolean produitExiste = panier.containsKey(idProduit);  
                if(produitExiste == true){
                    int quantite = (int) panier.get(idProduit);
                    if(quantite < 5) {     // 5 est la quantité max d'un produit qu'on peut commander
                        quantite = (int) panier.get(idProduit) + 1;
                        panier.put(idProduit, quantite);
                    }
                }else{
                    panier.put(idProduit, 1);
                }  
                response.sendRedirect("annonce.jsp");
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
