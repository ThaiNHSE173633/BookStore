/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thainh.controller;

import com.thainh.book.BookDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Windows
 */
public class CreateBookController extends HttpServlet {
    private final String UPDATEERRPAGE = "updateErr.html";

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlRewrite = UPDATEERRPAGE;
        try {
            String title = request.getParameter("txtTitle").trim();
            String imgPath = request.getParameter("txtImgPath").trim();
            String author = request.getParameter("txtAuthor").trim();
            Integer price = null;
            if(!request.getParameter("txtPrice").isBlank())
            {
                price = Integer.valueOf(request.getParameter("txtPrice"));
            }
            Integer inStock = null;
            if(!request.getParameter("txtInStock").isBlank())
            {
                inStock = Integer.valueOf(request.getParameter("txtInStock"));
            }
            int categoryId = Integer.parseInt(request.getParameter("selectCategory"));
            BookDAO dao = new BookDAO();
            boolean result = true;
            if(!title.isBlank() && !imgPath.isBlank() && price!=null && inStock!=null)
            {
                result = dao.insertRecord(title, imgPath, price, inStock, categoryId, author);
            }
            if (result) {
                urlRewrite = "Admin/bookManage.jsp";
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
