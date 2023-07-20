/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thainh.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.thainh.registration.RegistrationDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class UpdateUserController extends HttpServlet {

    private final String UPDATEERRPAGE = "updateErr.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlRewrite = UPDATEERRPAGE;
        try {
            String username = request.getParameter("txtUsername").trim();
            String password = request.getParameter("txtPassword").trim();
            String admin = request.getParameter("chkRole");
            boolean role = false;
            if (admin != null) {
                role = true;
            }
            RegistrationDAO dao = new RegistrationDAO();
            boolean result = true;
            if(!username.isBlank() && !password.isBlank())
            {
                result = dao.updatePassRole(username, password, role);
                if(result)
                if(result)
                {
                    HttpSession session = request.getSession(false);
                    session.setAttribute("success", "Successfully updated user!");
                }
            }
            if (result) {
                urlRewrite = "Admin/userManage.jsp";
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
