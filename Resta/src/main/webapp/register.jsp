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

        /* Form Card Styling */
        .card {
            margin-top: 100px;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            color: orange;
            font-weight: bold;
        }

        .input-group-text {
            background-color: #007bff;
            color: white;
            border-radius: 5px 0 0 5px;
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
                            <li class="nav-item mx-3"><a href="#services" class="nav-link active">Register</a></li>
                            <li class="nav-item mx-3"><a href="#about" class="nav-link">About</a></li>
                            <li class="nav-item mx-3"><a href="#gallery" class="nav-link">Gallery</a></li>
                            <li class="nav-item mx-3"><a href="#footer" class="nav-link">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class="container d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <h2 class="text-center">Register</h2>

                    <% 
                        String successMessage = (String) session.getAttribute("success");
                        String failureMessage = (String) session.getAttribute("failure");
    
                        if (successMessage != null && successMessage.equals("success")) {
                    %>
                        <div class="alert alert-success">
                            <%= successMessage %>
                        </div>
                    <% 
                        } else if (failureMessage != null) {
                    %>
                        <div class="alert alert-danger">
                            <%= failureMessage %>
                        </div>
                    <% 
                        }
                        session.removeAttribute("success");
                        session.removeAttribute("failure");
                    %>

                    <form action="registerServlet" method="post">
                        <div class="form-group">
                            <label for="name" class="form-label">Full Name</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                </div>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter a strong password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phone" class="form-label">Phone Number</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-custom btn-block">Register</button>
                    </form>

                    <div class="mt-3 text-center">
                        <p>Already have an account? <a href="login.jsp">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
