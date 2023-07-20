/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thainh.controller;

import com.thainh.book.BookDAO;
import com.thainh.book.BookDTO;
import com.thainh.cart.CartDTO;
import com.thainh.order.OrderDAO;
import com.thainh.registration.RegistrationDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Windows
 */
public class OrderController extends HttpServlet {

    private final String UPDATEERRPAGE = "updateErr.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        CartDTO cart = (CartDTO) session.getAttribute("CART");
        OrderDAO dao = new OrderDAO();
        BookDAO bookDao = new BookDAO();
        String urlRewrite = UPDATEERRPAGE;
        try {
            boolean flag = false;
            Map<BookDTO, Integer> items = cart.getItems();
            for (Map.Entry<BookDTO, Integer> item : items.entrySet()) {
                if (item.getValue() > item.getKey().getInStock()) {
                    flag = true;
                    session.setAttribute("error", "Not Enough Stock for "+item.getKey().getTitle()+"!");
                    break;
                }
            }
            if (!flag) {
                boolean result = dao.insertRecord(cart.getCustomerId(), false, cart.getItems());
                if (result) {
                    for (Map.Entry<BookDTO, Integer> item : items.entrySet()) {
                        bookDao.updateStock(item.getKey().getId(), item.getKey().getInStock()-item.getValue());
                    }
                    RegistrationDTO user = (RegistrationDTO) session.getAttribute("user");
                    cart = new CartDTO();
                    cart.setCustomerId(user.getId());
                    session.setAttribute("CART", cart);
                    session.setAttribute("success", "Order successfully!");
                }
            }
            urlRewrite = "viewCart.jsp";
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
