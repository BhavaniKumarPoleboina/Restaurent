<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">  <!-- Correct Font Awesome Link -->

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
        .container-form {
            position: relative;
            z-index: 2;
            margin-top: 100px;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
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

        .footer-link {
            text-align: center;
            margin-top: 10px;
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

                            <li class="nav-item mx-3"><a href="#services" class="nav-link active">Login</a></li>
                            <li class="nav-item mx-3"><a href="#about" class="nav-link">About</a></li>
                            <li class="nav-item mx-3"><a href="#gallery" class="nav-link">Gallery</a></li>
                            <li class="nav-item mx-3"><a href="#footer" class="nav-link">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

    <div class="container d-flex justify-content-center">
        <div class="container-form">
            <h2 class="text-center">Login</h2>
            
            <% String loginMessage = (String) session.getAttribute("loginMessage"); %>
            <% if (loginMessage != null) { %>
                <p class="text-danger text-center"><%= loginMessage %></p>
                <% session.removeAttribute("loginMessage"); %>
            <% } %>

            <form action="loginServlet" method="post">
                <div class="form-group position-relative">
                    <i class="fas fa-envelope"></i>
                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group position-relative">
                    <i class="fas fa-lock"></i>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-custom btn-block">Login</button>
            </form>
            
            <div class="footer-link">
                <p>Don't have an account? <a href="register.jsp">Register here</a></p>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
