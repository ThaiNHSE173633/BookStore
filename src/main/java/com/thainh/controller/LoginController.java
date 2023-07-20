/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thainh.controller;

import com.thainh.cart.CartDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class LoginController extends HttpServlet {

    private final String SEARCHPAGE = "index.jsp";
    private final String INVALIDPAGE = "invalid.html";
    private final String LOGINPAGE = "login.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /* TODO output your page here. You may use following sample code. */
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        var rememberMe = Boolean.parseBoolean(request.getParameter("chkRememberMe"));
        RegistrationDAO reg = new RegistrationDAO();
        String url = INVALIDPAGE;
        try {
            HttpSession session = request.getSession(false);
            var user = reg.checkLogin(username, password);
            if (user != null) {
                if (rememberMe) {
                    Cookie cookie = new Cookie(username, password);
                    cookie.setAttribute(username, password);
                    cookie.setMaxAge(60 * 60 * 2); //2 hours
                    response.addCookie(cookie);
                }
                session.setAttribute("user", user);
                CartDTO cart = new CartDTO();
                cart.setCustomerId(user.getId());
                session.setAttribute("CART", cart);
                url = SEARCHPAGE;
            } else {
                request.setAttribute("loginError", "Invalid username or password");
                url = LOGINPAGE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
