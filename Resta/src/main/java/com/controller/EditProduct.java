package com.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import com.JDBC.Restaurent;
import com.model.dto.Products;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/editProduct")
@MultipartConfig(maxFileSize = 16177215) // Limit for image upload
public class EditProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Restaurent r = new Restaurent();
        int id = Integer.parseInt(request.getParameter("id"));
        Products p = r.edit(id); // Fetch product
        if (p != null) {
            request.setAttribute("product_edit", p);
            RequestDispatcher rd = request.getRequestDispatcher("editproducts.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("adminDashboard.jsp"); // Redirect if product not found
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Restaurent r = new Restaurent();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");

        // Fetch existing product details
        Products existingProduct = r.edit(id);
        byte[] imageBytes = existingProduct.getImage(); 

        // Handle new image upload
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            InputStream inputStream = filePart.getInputStream();
            imageBytes = convertInputStreamToByteArray(inputStream);
        }

       
        Products p = new Products(id, name, description, price, category, imageBytes);
        boolean updated = r.updateProduct(p);

        if (updated) {
            response.sendRedirect("adminLoginServlet"); // Redirect to product list
        } else {
            request.setAttribute("editError", "Something went wrong!");
            request.getRequestDispatcher("editproducts.jsp").forward(request, response);
        }
    }

    private byte[] convertInputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, bytesRead);
        }
        return byteArrayOutputStream.toByteArray();
    }
}
