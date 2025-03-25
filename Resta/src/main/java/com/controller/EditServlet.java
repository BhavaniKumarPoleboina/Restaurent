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

@WebServlet("/editServlet")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Prevents creating a new session if not available
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Users currentUser = (Users) session.getAttribute("user");

        // Getting form values and handling potential null values
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            request.setAttribute("edit", "User ID is missing!");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
            return;
        }

        int id = Integer.parseInt(idParam);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        // Keep old password if new one is not provided
        if (password == null || password.trim().isEmpty()) {
            password = currentUser.getPassword();
        }

        Users updatedUser = new Users(id, name, email, password, phone);
        Restaurent r = new Restaurent();
        boolean isUpdated = r.updateUser(updatedUser);

        if (isUpdated) {
            session.setAttribute("user", updatedUser); // Update session user details
            request.setAttribute("edit", "Successfully updated your details.");
        } else {
            request.setAttribute("edit", "Something went wrong!");
        }

        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }
}
