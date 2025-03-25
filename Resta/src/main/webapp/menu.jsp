<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.dto.Products, java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }

        .background-blur {
            background-image: url('<%= request.getContextPath() %>/Images/Biryani.webp');
            background-size: cover;
            filter: blur(5px);
            height: 300px;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            border-radius: 5px;
            border: 2px solid green;
        }

        .content-overlay {
            position: relative;
            z-index: 2;
            color: black;
            padding: 20px;
        }

        .name { color: orange; }

        /* Navbar Styling */
        .navbar .nav-link {
            color: white;
            transition: border-bottom 0.3s ease;
        }

        .navbar .nav-link:hover, .navbar .nav-link.active {
            border-bottom: 2px solid orange;
            color: orange;
            font-weight: bold;
        }
        /* Product Card */
        .product-card {
            display: flex;
            align-items: center;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: scale(1.02);
           }

		  .product-image {
			    width: 150px; /* Increased width */
			    height: 150px; /* Increased height */
			    object-fit: cover;
			    border-radius: 10px;
			    margin-right: 15px;
			    transition: transform 0.3s;
			}

        .btn-cart {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s;
        }

         .product-image:hover {
              transform: scale(1.1);
            }
            
            
        .fas{
           color:white;
        
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .product-card {
                flex-direction: column;
                text-align: center;
            }

		    .product-image {
		        width: 120px; /* Adjusted for mobile */
		        height: 120px;
		        margin-bottom: 10px;
		    }
        }
    </style>
</head>
<body>

    <div class="background-blur"></div>
    <div class="container-fluid content-overlay">
        <div class="row">
            <div class="col-md-4 text-center text-md-left">
                <h1 class="name">Taste <span style="color:green">On</span></h1>
            </div>
            <div class="col-md-8">
                <nav class="navbar navbar-expand-lg">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#CollapseNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="CollapseNavbar">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item mx-3"><a href="restau.jsp" class="nav-link">Home</a></li>
                            <li class="nav-item mx-3"><a href="profile.jsp" class="nav-link" >Profile</a></li>
                            <li class="nav-item mx-3"><a href="#services" class="nav-link active">Menu</a></li>
                            <li class="nav-item mx-3"><a href="cartItems" class="nav-link">Cart</a></li>
                            
                        </ul>
                    </div>
                </nav>
            </div>
        </div>


    <div class="container mt-4">
        <h2 class="text-center mb-4">MENU</h2>
        <div class="row">
            <% List<Products> productList = (List<Products>) request.getAttribute("list");
               if (productList != null && !productList.isEmpty()) {
                   for (Products p : productList) {
                       String base64Image = (p.getImage() != null) ? Base64.getEncoder().encodeToString(p.getImage()) : "";
                       String imageSrc = (base64Image.isEmpty()) ? "default-image.jpg" : "data:image/jpeg;base64," + base64Image;
            %>
            <div class="col-md-4 mb-4">
                <div class="product-card">
                    <img src="<%= imageSrc %>" class="product-image" alt="Product Image">
                    <div>
                        <h5><%= p.getName() %></h5>
                        <p class="text-muted"><%= p.getDescription() %></p>
                        <h6 class="text-primary">Price: ₹<%= p.getPrice() %></h6>
                        <form action="addCartItem" method="post">
                            <input type="hidden" name="productId" value="<%= p.getId() %>">
                            <button type="submit" class="btn btn-cart btn-block">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <% } } else { %>
            <p class="text-danger text-center w-100">No products available.</p>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
