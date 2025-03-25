<%@ page import="com.model.dto.Users" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

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
                            <li class="nav-item mx-3"><a href="#" class="nav-link active">Profile</a></li>
                            <li class="nav-item mx-3"><a href="#services" class="nav-link">Services</a></li>
                            <li class="nav-item">
                        <a class="nav-link" href="cartItems">
                            <i class="fas fa-shopping-cart"></i> Cart
                        </a>
                    </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-container">
                    <h2>Login</h2>

                    <!-- Display error message -->
                    <% 
                        String loginMessage = (String) session.getAttribute("loginMessage");
                        if (loginMessage != null) { 
                    %>
                        <p class="error-message"><%= loginMessage %></p>
                    <% 
                        session.removeAttribute("loginMessage"); // Clear message after displaying
                        }
                    %>

                    <!-- Login Form -->
                    <form action="loginServlet" method="post">
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                </div>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>

                <div class="footer-link">
                    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                </div>
            </div>
        </div>
    </div>


    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
