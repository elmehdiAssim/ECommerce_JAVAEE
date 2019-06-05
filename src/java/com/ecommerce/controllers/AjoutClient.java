package com.ecommerce.controllers;

import com.ecommerce.beans.Membre;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.ecommerce.dao.ClientDB;
import static org.ecommerce.dao.ClientDB.dejaInscrire;

@WebServlet("/login_interface/AjoutClient")
public class AjoutClient extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {            
            
            String username = request.getParameter("username");
            if(dejaInscrire(username) == false) {
                
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String dateNaissance = request.getParameter("date_naissance");
                String sexe = request.getParameter("sexe");
                String tel = request.getParameter("tel");
                String email = request.getParameter("email");                
                String password = request.getParameter("password");
                
                
                Membre client = new Membre(); // Membre peut être un client ou bien un admin
                
                client.setNom(nom);
                client.setPrenom(prenom);
                client.setDateNaissance(dateNaissance);
                client.setSexe(sexe);
                client.setTel(tel);
                client.setEmail(email);
                client.setMotUtilisateur(username);
                client.setMotPasse(password);                

                ClientDB.ajouter(client);  
                
                request.setAttribute("message", "Le compte est crée, entrez le mot d'utilisateur et le mot de passe pour vous connecter ");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                
            }else {
                
                request.setAttribute("message", "le username que vous avez saisi est déjà utilisé");                
                request.getRequestDispatcher("creer_compte.jsp").forward(request, response);
                
                
                
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
