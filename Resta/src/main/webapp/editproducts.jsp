<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.dto.Products, java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 500px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    Products p = (Products) request.getAttribute("product_edit");
    
%>
<div class="container mt-5 d-flex justify-content-center">
    <div class="form-container">
        <h4 class="text-center mb-4">Edit Product</h4>
        <form action="editProduct" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= p.getId() %>"> <!-- Hidden ID field -->
            
            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text" class="form-control" name="name" value="<%= p.getName() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" name="description" rows="3" required><%= p.getDescription() %></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Price</label>
                <input type="number" class="form-control" name="price" step="0.01" value="<%= p.getPrice() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Category</label>
                <select class="form-select" name="category" required>
                    <option value="Veg" <%= "Veg".equals(p.getCategory()) ? "selected" : "" %>>Veg</option>
                    <option value="Non-Veg" <%= "Non-Veg".equals(p.getCategory()) ? "selected" : "" %>>Non-Veg</option>
                </select>
            </div>

<%
    String base64Image = (p.getImage() != null) ? Base64.getEncoder().encodeToString(p.getImage()) : "";
%>
            <div class="mb-3">
                <label class="form-label">Product Image</label>
                <input type="file" class="form-control" name="image" accept="image/*">
                <% if (!base64Image.isEmpty()) { %>
                    <div class="mt-2">
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Product Image" style="max-width: 100px; max-height: 100px;">
                    </div>
                <% } %>
            </div>

            <button type="submit" class="btn btn-submit w-100">Update</button>
        </form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
