package com.controller;

import java.io.IOException;

import com.JDBC.Restaurent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCartItem
 */

@WebServlet("/addCartItem")
public class AddCartItem extends HttpServlet {
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
		HttpSession session=request.getSession();
		int uid=(int) session.getAttribute("user_id");
		int pid=Integer.parseInt(request.getParameter("productId"));
		Restaurent r=new Restaurent();
		boolean a=r.addToCart(uid, pid);
		if(a) {
			request.getRequestDispatcher("cartItems").forward(request, response);
		}
		else {
			response.sendRedirect("menu");
		}
		
		
	}

}
