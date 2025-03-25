package com.controller;

import java.io.IOException;

import com.JDBC.Restaurent;
import com.model.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
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
		  String name=request.getParameter("name");
		  String email=request.getParameter("email");
		  String password=request.getParameter("password");
		  String phone=request.getParameter("phone");
		  Users u=new Users(name,email,password,phone);
		  Restaurent r=new Restaurent();
		  String status=r.registerUser(u);
		  HttpSession session=request.getSession();
		  if(status.equals("success")) {
			
			  session.setAttribute("success","Register Successful !!!!");
			  response.sendRedirect("restau.jsp");
		  }
		  else {
			  session.setAttribute("failure", "Something went wrong !!!");
			  response.sendRedirect("register.jsp");
		  }
	}

}
