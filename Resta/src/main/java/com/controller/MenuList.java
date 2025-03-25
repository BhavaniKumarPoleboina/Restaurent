package com.controller;

import java.io.IOException;
import java.util.List;

import com.JDBC.Restaurent;
import com.model.dto.Products;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class MenuList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
            Restaurent restaurant = new Restaurent();
            List<Products> productList = restaurant.allProducts();
            System.out.println("Product List Size: " + (productList.size()));
            
            HttpSession session = request.getSession();
            if(productList != null) {
            request.setAttribute("list", productList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
            dispatcher.forward(request, response);
            }
            else {
            	System.out.println("error at MenuList");
            	session.setAttribute("list", "getting Null data ");
    			response.sendRedirect("index.jsp");
            }
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
