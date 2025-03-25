<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.dto.Products, java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product List</title>

    <!-- Bootstrap 4.6 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>
        .product-card {
            display: flex;
            align-items: center;
            background: #fff;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }
        .product-image {
            width: 150px;
            height: 150px;
            border-radius: 5px;
            object-fit: cover;
        }
        .product-details {
            flex-grow: 1;
            padding-left: 15px;
        }
        .btn-edit {
            color: white;
            background-color: #28a745;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .btn-delete {
            color: white;
            background-color: #dc3545;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body class="bg-light">

    <div class="container mt-4">
        <h2 class="text-center mb-4">Product List</h2>

        <!-- Add Product Button -->
        <a href="newproducts.jsp" class="btn btn-primary mb-3">Add Product</a>

        <% 
        List<Products> productList = (List<Products>) request.getAttribute("list"); 
        if (productList != null && !productList.isEmpty()) { 
        %>
        
        <div class="row">
        <% 
            int count = 0;
            for (Products p : productList) { 
                String base64Image = Base64.getEncoder().encodeToString(p.getImage());
        %>

            <div class="col-md-4">
                <!-- Product Card -->
                <div class="product-card d-flex align-items-center">
                    <!-- Image on the Left -->
                    <img src="data:image/jpeg;base64,<%= base64Image %>" class="product-image" alt="Product Image">

                    <!-- Details on the Right -->
                    <div class="product-details">
                        <h4><%= p.getName() %></h4>
                        <p><strong>Description:</strong> <%= p.getDescription() %></p>
                        <h5 class="text-primary">Price: ₹<%= p.getPrice() %></h5>

                        <!-- Action Buttons -->
                        <a href="editProduct?id=<%= p.getId() %>" class="btn btn-edit btn-sm">Edit</a>
                        <a href="deleteProduct?id=<%= p.getId() %>" class="btn btn-delete btn-sm">Delete</a>
                    </div>
                </div>
            </div>

        <% 
            count++;
            // Close the current row and start a new one after every 3 products
            if (count % 3 == 0) { 
        %>
        </div><div class="row">
        <% 
            }
        } 
        %>
        </div>

        <% } else { %>
            <p class="text-danger text-center">No products found.</p>
        <% } %>

    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
