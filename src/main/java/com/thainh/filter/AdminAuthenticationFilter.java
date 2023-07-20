/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thainh.filter;

import com.thainh.registration.RegistrationDTO;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * This Java filter demonstrates how to intercept the request and transform the
 * response to implement authentication feature. for the website's back-end.
 *
 * @author www.codejava.net
 */
public class AdminAuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        // Check if the user is authenticated
        HttpSession session = req.getSession(false);
        RegistrationDTO user=(RegistrationDTO)session.getAttribute("user");
        if (user == null || !user.isRole()) {
            // Redirect the user to the login page
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            // User is authenticated, so allow them to access the requested resource
            chain.doFilter(request, response);
        }

    }

    public AdminAuthenticationFilter() {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }

}
