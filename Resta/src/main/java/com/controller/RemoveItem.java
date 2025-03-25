package com.controller;

import java.io.IOException;

import com.JDBC.Restaurent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveItem
 */

@WebServlet("/removeItem")
public class RemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemid=Integer.parseInt(request.getParameter("cart_id"));
		Restaurent r=new Restaurent();
		boolean status=r.removeCartItem(itemid);
		if(status) {
			request.getRequestDispatcher("cartItems").forward(request, response);
		}
		else {
			request.getRequestDispatcher("menu").forward(request, response);
		}
		
	}

}
