/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thainh.controller;

import com.thainh.order.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Windows
 */
public class UpdateOrderController extends HttpServlet {
    private final String UPDATEERRPAGE = "updateErr.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlRewrite = UPDATEERRPAGE;
        try {
            int id = Integer.parseInt(request.getParameter("txtId"));
            Integer total = null;
            if(!request.getParameter("txtTotal").isBlank())
            {
                total = Integer.valueOf(request.getParameter("txtTotal"));
            }
            String done = request.getParameter("chkDone");
            boolean isDone = false;
            if (done != null) {
                isDone = true;
            }
            OrderDAO dao = new OrderDAO();
            boolean result = true;
            if(total!=null)
            {
                result = dao.updateRecord(id, total, isDone);
                if(result)
                {
                    HttpSession session = request.getSession(false);
                    session.setAttribute("success", "Successfully updated order!");
                }
            }
            if (result) {
                urlRewrite = "Admin/orderManage.jsp";
            }
        } catch (NamingException | SQLException ex) {
            ex.printStackTrace();
        } finally {
            response.sendRedirect(urlRewrite);
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
