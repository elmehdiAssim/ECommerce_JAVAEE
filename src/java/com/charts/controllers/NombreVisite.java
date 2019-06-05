package com.charts.controllers;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.ecommerce.dao.ConnectionWithDB;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.jdbc.JDBCCategoryDataset;

@WebServlet("/admin_interface/NombreVisite")
public class NombreVisite extends HttpServlet {
    
    private Connection dbConnection = null;
    
    public NombreVisite() {
        dbConnection = ConnectionWithDB.getConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int chosenYear = 2017;
        
        String chosenYearString = request.getParameter("chosenYear");
        if(chosenYearString != null) {
            chosenYear = Integer.parseInt(chosenYearString);            
        }
        
        String sql = "select datename(month, date_visite) as mois, sum(nombre_visite) as nombre_visite"
                + " from Visite"
                + " where  year(date_visite)='"+chosenYear+"'"
                + " group by datename(month, date_visite), year(date_visite)"
                + " order by min(date_visite)";
        JDBCCategoryDataset dataset = new JDBCCategoryDataset(dbConnection);        
        try {
            dataset.executeQuery(sql);
        
            JFreeChart chart = ChartFactory.createBarChart( // Line or Bar
               "Nombre Visites", "mois", "nombre_visite",
               dataset, PlotOrientation.HORIZONTAL, false, true, false);           
               chart.setBorderVisible(true);
        
            if (chart != null) {
                int width = 700;
                int height = 400;
                response.setContentType("image/jpeg");
                OutputStream out = response.getOutputStream();
                ChartUtilities.writeChartAsJPEG(out, chart, width, height);
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }
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
