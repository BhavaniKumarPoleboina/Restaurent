<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.dto.CartItem, java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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

        .name { color: orange;
        position:absolute;
         left:0px; }
         
         .navbar{
         position:absolute;
             right:0px;
         }

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
        
        .container {
            margin-top: 270px;
        }
        .cart-card {
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .cart-card:hover {
            transform: scale(1.02);
        }
        .cart-item-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
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
                            <li class="nav-item mx-3"><a href="cartItems" class="nav-link active">Cart</a></li>
                            <li class="nav-item mx-3"><a href="menu" class="nav-link">Menu</a></li>
>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
     </div>

    <div class="container">
     
        <div class="row">
               <h2 class="text-center mb-4">🛒 Your Shopping Cart</h2>
            <!-- Carousel on the Left -->
            <div class="col-md-6">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%= request.getContextPath() %>/Images/maa.jpg" class="d-block w-100" alt="Featured Item 1">
                        </div>
                        <div class="carousel-item">
                            <img src="<%= request.getContextPath() %>/Images/spicy.webp" class="d-block w-100" alt="Featured Item 2">
                        </div>
                        <div class="carousel-item">
                            <img src="<%= request.getContextPath() %>/Images/si.jpg" class="d-block w-100" alt="Featured Item 3">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
            </div>
            
            <!-- Cart Items on the Right -->
            <div class="col-md-6">
                
                <div class="cart-items">
                    <% List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cart_items"); %>
                    <% if (cartItems == null || cartItems.isEmpty()) { %>
                        <div class="alert alert-warning text-center">Your cart is empty! <a href="menu.jsp">Go to Menu</a></div>
                    <% } else { %>
                        <% for (CartItem item : cartItems) { %>
                            <div class="card cart-card p-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(item.getImage()) %>" class="cart-item-img me-3">
                                    <div>
                                        <h5><%= item.getName() %></h5>
                                        <p>Price: ₹<%= item.getPrice() * item.getQuantity() %></p>
                                        <form action="removeItem" method="post">
                                            <input type="hidden" name="cart_id" value="<%= item.getId() %>">
                                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                        <div class="text-center">
                            <a href="checkout.jsp" class="btn btn-success btn-lg">Proceed to Checkout</a>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

