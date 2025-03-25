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

@WebServlet("/adminLoginServlet")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLogin() {
		super();
	}

	// Handle GET request to display products
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Restaurent restaurant = new Restaurent();
		List<Products> productList = restaurant.allProducts();
		request.setAttribute("list", productList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productlist.jsp");
		dispatcher.forward(request, response);
	}

	// Handle POST request for admin login
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		if (username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin123")) {
			Restaurent restaurant = new Restaurent();
			List<Products> productList = restaurant.allProducts();
			request.setAttribute("list", productList);
			RequestDispatcher rd = request.getRequestDispatcher("productlist.jsp");
			rd.forward(request, response);
		} else {
			session.setAttribute("admin", "Invalid credentials, please try again!");
			response.sendRedirect("adminlogin.jsp");
		}
	}
}
