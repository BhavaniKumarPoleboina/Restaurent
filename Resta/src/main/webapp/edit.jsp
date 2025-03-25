<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.dto.Users" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EditForm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">  <!-- Correct Font Awesome Link -->

    <style>
        /* Background Blur */
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

        /* Profile & Form Styling */
        .profile-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
        }

        .card {
            width: 45%;
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .card-body {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
        }

        .profile-icon {
            font-size: 50px;
            color: #007bff;
        }

        .form-group {
            position: relative;
            text-align: left;
        }

        .form-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #007bff;
        }

        .form-control {
            padding-left: 35px;
            height: 45px;
            border-radius: 5px;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .success-message {
            color: green;
            font-weight: bold;
            text-align: center;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
        }

        .logout-link {
            color: red;
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
                            <li class="nav-item mx-3"><a href="profile.jsp" class="nav-link" >Profile</a></li>
                            <li class="nav-item mx-3"><a href="#services" class="nav-link active">EditProfile</a></li>
                            <li class="nav-item mx-3"><a href="#about" class="nav-link">About</a></li>
                            <li class="nav-item mx-3"><a href="#gallery" class="nav-link">Gallery</a></li>
                            <li class="nav-item mx-3"><a href="#footer" class="nav-link">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Profile Section -->
        <div class="container profile-container">
            <div class="card">
                <div class="card-body">
                    <%
                        Users user = (Users) session.getAttribute("user");
                        if (user != null) {
                            String message = (String) request.getAttribute("edit");
                    %>

                    <h3 class="text-center mb-4">Edit Profile</h3>

                    <% if (message != null) { %>
                        <p class="<%= message.contains("success") ? "success-message" : "error-message" %>">
                            <%= message %>
                        </p>
                    <% } %>

                    <form action="editServlet" method="post">
                        <input type="hidden" name="id" value="<%= user.getId() %>">

                        <div class="form-group">
                            <i class="fas fa-user"></i>
                            <input type="text" class="form-control" id="name" name="name" value="<%= user.getName() %>" required>
                        </div>

                        <div class="form-group">
                            <i class="fas fa-envelope"></i>
                            <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
                        </div>

                        <div class="form-group">
                            <i class="fas fa-lock"></i>
                            <input type="text" class="form-control" id="password" name="password" value="<%= user.getPassword() %>" required>
                        </div>

                        <div class="form-group">
                            <i class="fas fa-phone"></i>
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>" required>
                        </div>

                        <button type="submit" class="btn btn-custom btn-block">Update Details</button>
                    </form>

                    <div class="mt-3 text-center">
                        <p>Want to log out? <a href="logout.jsp" class="logout-link">Logout</a></p>
                    </div>

                    <% } else { %>
                    <div class="card text-center">
                        <p class="error-message">You are not logged in.</p>
                        <a href="login.jsp" class="btn btn-primary">Login Here</a>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
