package com.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.JDBC.Restaurent;
import com.model.dto.Products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addProductServlet")
@MultipartConfig(maxFileSize = 16177215) // Handle large file uploads
public class AddProducts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");

        if (name == null || description == null || priceStr == null || category == null) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("newproducts.jsp").forward(request, response);
            return;
        }

        name = name.trim();
        description = description.trim();
        category = category.trim();

        double price;
        try {
            price = Double.parseDouble(priceStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price format.");
            request.getRequestDispatcher("newproducts.jsp").forward(request, response);
            return;
        }

        Part filePart = request.getPart("image");
        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("error", "Product image is required.");
            request.getRequestDispatcher("newproducts.jsp").forward(request, response);
            return;
        }

        InputStream inputStream = filePart.getInputStream();
        byte[] imageBytes = convertInputStreamToByteArray(inputStream);

        Products p = new Products();
        p.setName(name);
        p.setDescription(description);
        p.setPrice(price);
        p.setCategory(category);
        p.setImage(imageBytes);
          
        Restaurent r = new Restaurent();
        boolean isSuccess = r.addProduct(p);

        if (isSuccess) {
            response.sendRedirect("adminLoginServlet");
        } else {
            request.setAttribute("error", "Database error occurred.");
            request.getRequestDispatcher("newproducts.jsp").forward(request, response);
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
