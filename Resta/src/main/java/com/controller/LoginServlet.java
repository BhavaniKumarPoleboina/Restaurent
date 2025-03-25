package com.controller;

import java.io.IOException;
import java.util.List;

import com.JDBC.Restaurent;
import com.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Restaurent r = new Restaurent();
        Users user = r.getUserByEmailAndPassword(email, password); // Fetch only the logged-in user
        
       
        HttpSession session = request.getSession();
        
        if (user != null) {
        	int userId=user.getId();
        	session.setAttribute("user_id", userId);
            session.setAttribute("user", user);  
            response.sendRedirect("restau.jsp");
        } else {
            session.setAttribute("loginMessage", "Invalid credentials! Please try again.");
            response.sendRedirect("login.jsp"); 
        }
    }
}

