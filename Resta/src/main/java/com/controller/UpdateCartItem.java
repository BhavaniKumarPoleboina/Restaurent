package com.controller;

import java.io.IOException;

import com.JDBC.Restaurent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateCartItem")
public class UpdateCartItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Validate request parameters
            String cartIdStr = request.getParameter("cart_id");
            String quantityStr = request.getParameter("quantity");

            if (cartIdStr == null || quantityStr == null || cartIdStr.isEmpty() || quantityStr.isEmpty()) {
                response.getWriter().write("error");
                return;
            }

            int cartId = Integer.parseInt(cartIdStr);
            int quantity = Integer.parseInt(quantityStr);

            // Ensure valid quantity
            if (quantity < 1) {
                response.getWriter().write("error");
                return;
            }

            // Database operations
            Restaurent r = new Restaurent();
            boolean isUpdated = r.updateCartQuantity(cartId, quantity);

            if (isUpdated) {
                double updatedPrice = r.getUpdatedPrice(cartId);
                response.getWriter().write(String.valueOf(updatedPrice));
            } else {
                response.getWriter().write("error");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log error
            response.getWriter().write("error");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}
