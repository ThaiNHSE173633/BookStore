/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thainh.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.thainh.registration.RegistrationDAO;
import com.thainh.registration.RegistrationInsertError;

/**
 *
 * @author DELL
 */
public class CreateAccountController extends HttpServlet {

    private final String LOGINPAGE = "login.jsp";
    private final String ERRORPAGE = "createNewAccount.jsp";
    private final String INVALIDPAGE = "invalid.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String urlRewrite = INVALIDPAGE;
        try {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("txtUsername").trim();
            String password = request.getParameter("txtPassword").trim();
            String confirm = request.getParameter("txtConfirm".trim());
            String fullname = request.getParameter("txtFullname").trim();
            RegistrationInsertError rie = new RegistrationInsertError();
            RegistrationDAO dao = new RegistrationDAO();
            boolean flag = false;
            if (!(username.length() >= 6 && username.length() <= 20)) {
                rie.setUsernameLengthErr("Username not valid");
                flag = true;
            }
            if (!(password.length() >= 6 && password.length() <= 30)) {
                rie.setPasswordLengthErr("Password not valid");
                flag = true;
            }
            if (!(password.equals(confirm))) {
                rie.setConfirmNotMatch("Confirm password does not match");
                flag = true;
            }
            if (!(fullname.length() >= 2 && fullname.length() <= 50) && !fullname.isEmpty()) {
                rie.setFullnameLengthErr("Full name not valid");
                flag = true;
            }
            if (dao.checkDuplicate(username)) {
                rie.setUsernameIsExisted("Username already exists");
                flag = true;
            }

            if (flag) {
                request.setAttribute("INSERTER", rie);
                urlRewrite = ERRORPAGE;
            } else {
                boolean result = dao.insertRecord(username, password, fullname, false);
                if (result) {
                    urlRewrite = LOGINPAGE;
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher(urlRewrite);
            rd.forward(request, response);
        } catch (NamingException | SQLException ex) {
            ex.printStackTrace();
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
