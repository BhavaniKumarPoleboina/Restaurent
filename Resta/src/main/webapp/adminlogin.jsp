<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Delicious Bites</title>

    <!-- Bootstrap & Font Awesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- jQuery & Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background: #f8f9fa;

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
        
        .login-container {
			    width: 100%;
			    max-width: 400px;
			    background: white;
			    padding: 30px;
			    border-radius: 10px;
			    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
			    position: absolute;
			    top: 300px;
			    left: 50%;
			    transform: translate(-50%, -50%);
			}
        .form-group {
            position: relative;
        }
        .form-group i {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: gray;
        }
        .form-control {
            padding-left: 40px;
            height: 45px;
            font-size: 16px;
        }
        .btn-custom {
            background: #007bff;
            color: white;
            font-weight: bold;
            transition: 0.3s;
            border-radius: 50px;
            padding: 12px;
        }
        .btn-custom:hover {
            background: #0056b3;
        }
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
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

    <div class="login-container">
        <h3 class="text-center mb-4">Admin Login</h3>

        <!-- Display Error Message if Login Fails -->
        <% String error = (String) session.getAttribute("edit"); %>
        <% if (error != null && !error.isEmpty()) { %>
            <p class="error-message"><%= error %></p>
        <% 
        session.removeAttribute("edit");
        } %>
        <form action="adminLoginServlet" method="post">
            <p class="error-message"><%= request.getAttribute("admin") %> </p>
            <div class="form-group">
                <i class="fas fa-user"></i>
                <input type="text" class="form-control" name="username" placeholder="Enter Admin Username" required>
            </div>

            <div class="form-group">
                <i class="fas fa-lock"></i>
                <input type="password" class="form-control" name="password" placeholder="Enter Password" required>
            </div>

            <button type="submit" class="btn btn-custom btn-block">Login</button>
        </form>

        <div class="mt-3 text-center">
            <a href="restau.jsp" class="text-primary">Back to Home</a>
        </div>
    </div>

</body>
</html>
