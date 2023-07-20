/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thainh.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class MainController extends HttpServlet {

    private final String LOGINCONTROLLER = "LoginController";
    private final String LOGOUTCONTROLLER = "LogoutController";
    private final String LOGINPAGE = "login.jsp";
    private final String ADMINMANAGECONTROLLER = "AdminManageController";
    private final String SEARCHCONTROLLER = "SearchController";
    private final String USERORDERPAGE = "userOrders.jsp";
    private final String VIEWUSERORDERDETAILSCONTROLLER = "ViewUserOrderDetailsController";
    private final String ORDERCONTROLLER = "OrderController";
    private final String CANCELORDERCONTROLLER = "CancelOrderController";
    private final String UPDATEORDERCONTROLLER = "UpdateOrderController";
    private final String DELETEORDERCONTROLLER = "DeleteOrderController";
    private final String VIEWORDERDETAILCONTROLLER = "ViewOrderDetailController";
    private final String CREATECATEGORYCONTROLLER = "CreateCategoryController";
    private final String DELETECATEGORYCONTROLLER = "DeleteCategoryController";
    private final String UPDATECATEGORYCONTROLLER = "UpdateCategoryController";
    private final String CREATEUSERCONTROLLER = "CreateUserController";
    private final String DELETEUSERCONTROLLER = "DeleteUserController";
    private final String UPDATEUSERCONTROLLER = "UpdateUserController";
    private final String CREATEBOOKCONTROLLER = "CreateBookController";
    private final String DELETEBOOKCONTROLLER = "DeleteBookController";
    private final String UPDATEBOOKCONTROLLER = "UpdateBookController";
    private final String SHOPPINGCONTROLLER = "ShoppingController";
    private final String CREATEACCOUNTCONTROLLER = "CreateAccountController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /* TODO output your page here. You may use following sample code. */
        String url = LOGINPAGE;
        String button = request.getParameter("button");
        if (null == button) {
        } else {
            switch (button) {
                case "Login":
                    url = LOGINCONTROLLER;
                    break;
                case "LoginPage":
                    url = LOGINPAGE;
                    break;
                case "Logout":
                    url = LOGOUTCONTROLLER;
                    break;
                case "Search":
                    url = SEARCHCONTROLLER;
                    break;
                case "CreateBook":
                    url = CREATEBOOKCONTROLLER;
                    break;
                case "DeleteBook":
                    url = DELETEBOOKCONTROLLER;
                    break;
                case "UpdateBook":
                    url = UPDATEBOOKCONTROLLER;
                    break;
                case "CreateCategory":
                    url = CREATECATEGORYCONTROLLER;
                    break;
                case "DeleteCategory":
                    url = DELETECATEGORYCONTROLLER;
                    break;
                case "UpdateCategory":
                    url = UPDATECATEGORYCONTROLLER;
                    break;
                case "CreateUser":
                    url = CREATEUSERCONTROLLER;
                    break;
                case "DeleteUser":
                    url = DELETEUSERCONTROLLER;
                    break;
                case "UpdateUser":
                    url = UPDATEUSERCONTROLLER;
                    break;
                case "Create New Account":
                    url = CREATEACCOUNTCONTROLLER;
                    break;
                case "MyOrders":
                    url = USERORDERPAGE;
                    break;
                case "UserOrderDetails":
                    url = VIEWUSERORDERDETAILSCONTROLLER;
                    break;
                case "Order":
                    url = ORDERCONTROLLER;
                    break;
                case "Order Details":
                    url = VIEWORDERDETAILCONTROLLER;
                    break;
                case "CancelOrder":
                    url = CANCELORDERCONTROLLER;
                    break;
                case "DeleteOrder":
                    url = DELETEORDERCONTROLLER;
                    break;
                case "Update Order":
                    url = UPDATEORDERCONTROLLER;
                    break;
                case "Manage":
                    url = ADMINMANAGECONTROLLER;
                    break;
                case "Add to Cart":
                case "View Cart":
                case "Remove from Cart":
                    url = SHOPPINGCONTROLLER;
                    break;
                default:
                    break;
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
