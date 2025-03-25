<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.dto.Users , java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Get the user session
    Users user= (Users) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delicious Bites - Restaurant</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }
        .hero {
            
            background: url('<%= request.getContextPath() %>/Images/chicken1.png') no-repeat center center/cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 36px;
            font-weight: bold;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Delicious Bites</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    
                    <% if (user!= null) { 
                    	
                    
                    %>
                        <!-- Show Menu only if logged in -->
                        <li class="nav-item"><a class="nav-link" href="menu">Menu</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown">
                                <i class="fas fa-user"></i> <%= user.getName() %>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="profile.jsp"><i class="fas fa-user-circle"></i> Profile</a>
                                <a class="dropdown-item text-danger" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                            </div>
                        </li>
                    <% } 
                    else { %>
                        <!-- Show Register & Login if not logged in -->
                        <li class="nav-item"><a class="nav-link disabled">Menu</a></li>
                        <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        Welcome to Delicious Bites 🍽️
    </div>

    <!-- Content Section -->
    <div class="container my-5 text-center">
        <h2>Discover Our Best Dishes</h2>
        <p>Explore a variety of delicious cuisines, freshly prepared for you!</p>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        © 2025 Delicious Bites | All Rights Reserved
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
