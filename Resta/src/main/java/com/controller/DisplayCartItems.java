package com.controller;

import java.io.IOException;
import java.util.List;

import com.JDBC.Restaurent;
import com.model.dto.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCart
 */

@WebServlet("/cartItems")
public class DisplayCartItems extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); 
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        Restaurent restaurantDAO = new Restaurent();
        List<CartItem> cartItems = restaurantDAO.allCartItems(userId);

        request.setAttribute("cart_items", cartItems);
        request.getRequestDispatcher("cart.jsp").forward(request, response); // Forward the request
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

