<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.dto.Users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
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
        .navbar .nav-link { color: white; transition: border-bottom 0.3s ease; }
        .navbar .nav-link:hover, .navbar .nav-link.active {
            border-bottom: 2px solid orange;
            color: orange;
            font-weight: bold;
        }
        .profile-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
        }
        .card {
            width: 50%;
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .card-body {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
        }
        .profile-icon {
            font-size: 50px;
            color: #007bff;
        }
        .card-title {
            font-size: 22px;
            font-weight: bold;
            margin-top: 10px;
        }
        .card-text strong {
            font-size: 16px;
            color: #333;
        }
        .btn-edit {
            width: 100%;
            font-weight: bold;
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
                            <li class="nav-item mx-3"><a href="#" class="nav-link active">Profile</a></li>
                            <li class="nav-item mx-3"><a href="menu" class="nav-link">Menu</a></li>
                            <li class="nav-item mx-3"><a href="cartItems" class="nav-link">Cart</a></li>
                            <li class="nav-item mx-3"><a href="#gallery" class="nav-link">Gallery</a></li>
                            <li class="nav-item mx-3"><a href="#footer" class="nav-link">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class="container profile-container">
            <div class="card">
                <div class="card-body">
                    <% Users user = (Users) session.getAttribute("user");
                        if (user != null) { %>
                        <i class="fas fa-user-circle profile-icon"></i>
                        <h5 class="card-title">Welcome, <%= user.getName() %>!</h5>
                        <hr>
                        <p class="card-text"><strong>ID:</strong> <%= user.getId() %></p>
                        <p class="card-text"><strong>Email:</strong> <%= user.getEmail() %></p>
                        <p class="card-text"><strong>Phone:</strong> <%= user.getPhone() %></p>
                        <a class="btn btn-primary btn-edit mt-3" href="edit.jsp?id=<%= user.getId() %>">Edit Profile</a>
                    <% } else { %>
                        <div class="alert alert-danger text-center">No user data found! Please log in.</div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
