package com.ecommerce.controllers;

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

@WebServlet("/admin_interface/ChartServlet")
public class ChartServlet extends HttpServlet {
    
    private Connection dbConnection = null;
    
    public ChartServlet() {
        dbConnection = ConnectionWithDB.getConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {            
            
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
        
        JDBCCategoryDataset dataset = new JDBCCategoryDataset(dbConnection);        
        try {
            dataset.executeQuery("SELECT SOURCE,PERCENTAGE FROM AIR_POLLUTION ORDER BY PERCENTAGE");
        
            JFreeChart chart = ChartFactory.createLineChart( // Line or Bar
               "quelque chose", "s", "p",
               dataset, PlotOrientation.VERTICAL, false, true, false);           
               chart.setBorderVisible(true);
        
            if (chart != null) {
                int width = 600;
                int height = 400;
                response.setContentType("image/jpeg");
                OutputStream out = response.getOutputStream();
                ChartUtilities.writeChartAsJPEG(out, chart, width, height);
            }
        }catch (SQLException e) {
            System.err.println(e.getMessage());
        }        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
