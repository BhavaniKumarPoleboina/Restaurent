<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.model.dto.Users" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
     Users user= (Users) session.getAttribute("user");
%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rotating Food Image</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.css" />
    <script src="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.js"></script>
   
    <style>
        .image-container {
            position: relative;
            min-height: 720px; 
            border-radius: 8px; 
            overflow: hidden; 
        }
        
        .image-container::before {
            content: '';
            position: absolute; 
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('<%= request.getContextPath() %>/Images/spicy.avif'); /* Ensure the path is correct */
            background-repeat: no-repeat;
            background-size: cover;
            filter: blur(5px); 
            z-index: 1; 
        }

        @keyframes rotateImage {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        #image-food {
            border-radius: 50%; 
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.4); 
            animation: rotateImage 8s linear infinite; 
            position: absolute;
            right: 50px; 
            top: 200px;  
            width: 300px;
            height: 300px;
            z-index: 4; 
        }

        .welcome h1 {
            font-family: Arial, sans-serif;
            color: white;
            font-weight: bold;
            position: relative; 
            top: 250px;
            z-index: 2;
        }

        .welcome a {
            font-family: Arial, sans-serif;
            position: relative;
            color: #2c3e50;
            font-weight: bold;
            padding: 15px;
            text-decoration: none;
            background-color: orange;
            border-radius: 7px;
            z-index: 3; 
            display: inline-block; 
            top:270px;
        }

        .name {
            color: yellow;
            margin-top: 20px; 
            z-index: 2; 
            position: relative; 
        }

        .navbar {
            position: absolute;
            right: 50px; 
            z-index: 2;           
        }

        .navbar-nav .nav-link {
            position: relative;
            padding: 10px 15px; 
            text-decoration: none; 
            color: white; 
        }

        .navbar-nav .nav-link::after {
            content: '';
            position: absolute;
            left: 50%; 
            bottom: 0; 
            width: 0; 
            height: 2px; 
            background:  orange; 
            transition: width 0.4s ease, left 0.4s ease; 
        }

        .navbar-nav .nav-link:hover::after,
        .navbar-nav .nav-link.active::after {
            width: 100%; 
            left: 0; 
        }
        .navbar-nav .nav-link.active{
            color:orange;
        }

        
        .card {
            height: 240px;
            box-shadow: 0 0 2px 1px rgb(241, 229, 229);
            border: none;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .card:hover {
            background-color: orange;
        }

        .card:hover i,
        .card:hover p, 
        .card:hover h4 {
            color: white;
        }
        img{
            border-radius:8px;
        }
        @media (max-width: 768px) {
        .image-container {
            min-height: 500px; /* Reduce height for smaller screens */
        }

        .image-container::before {
            filter: blur(3px); /* Reduce blur effect */
        }

        .navbar {
            position: static; /* Fix navbar for better visibility */
            text-align: center;
        }

        .navbar-nav {
            text-align: center;
        }

        .navbar-nav .nav-item {
            margin: 5px 0; /* Reduce spacing between nav items */
        }

        #image-food {
            width: 200px; /* Reduce rotating image size */
            height: 200px;
            right: auto;
            left: 50%;
            transform: translateX(-50%);
            top: 100px;
        }

        .welcome h1 {
            font-size: 24px;
            top: 180px; /* Adjust text position */
        }

        .welcome a {
            font-size: 16px;
            padding: 10px;
            top: 200px;
        }

        .name {
            text-align: center; /* Center the heading */
            font-size: 24px;
        }

        .col-md-6 img {
            max-width: 100%;
            height: auto;
        }

        .card {
            margin-bottom: 15px; /* Space between cards */
        }

        footer {
            text-align: center;
        }
    }
    </style>

    <script>
        // Initialize AOS library
        AOS.init({
            duration: 1200,
        });
    </script>
</head>

<body>
    <div class="container image-container position-relative">
        <div class="row">
		    <div class="col-md-4 col-12 text-center text-md-left">
		        <h1 class="name">Taste <span style="color:green">On</span></h1>
		    </div>
		    <div class="col-md-8 col-12">
		        <nav class="navbar navbar-expand-lg">
		            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#CollapseNavbar">
		                <span class="navbar-toggler-icon"></span>
		            </button>
		            <div class="collapse navbar-collapse" id="CollapseNavbar">
		                <ul class="navbar-nav ml-auto">
		                    <li class="nav-item mx-3">
		                        <a href="index.jsp" class="nav-link active">Home</a>
		                        
		                    </li>
		                    <li class="nav-item mx-3">
		                       <a href="#services" class="nav-link">Services</a>
		                     </li>
		                     <li class="nav-item mx-3">
		                         <a href="#about" class="nav-link">About</a>
		                     </li>
		                     <li class="nav-item mx-3">
		                         <a href="#gallery" class="nav-link">Gallery</a>
		                     </li>
		                      <li class="nav-item mx-3">
		                            <a href="#footer" class="nav-link">Contact</a>
		                     </li>
		
		                    <% if (user != null) { %>
		                        <li class="nav-item mx-3"><a href="menu" class="nav-link">Menu</a></li>
		                        
		
		                        <!-- User Dropdown -->
		                        <li class="nav-item dropdown mx-3">
		                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown">
		                                <i class="fas fa-user"></i> <%= user.getName() %>
		                            </a>
		                            <div class="dropdown-menu dropdown-menu-right">
		                                <a class="dropdown-item" href="profile.jsp"><i class="fas fa-user-circle"></i> Profile</a>
		                                <a class="dropdown-item text-danger" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
		                            </div>
		                        </li>
		                    <% } else { %>
		                        <li class="nav-item mx-3"><a class="nav-link disabled">Menu</a></li>
		                        <li class="nav-item mx-3"><a href="register.jsp" class="nav-link">Register</a></li>
		                        <li class="nav-item mx-3"><a href="login.jsp" class="nav-link">Login</a></li>
		                    <% } %>
		                </ul>
		            </div> 
		        </nav>
		    </div>
		 </div>
        <div class="row">
            <div class="col-md-5 welcome">
                <h1>Enjoy Our Delicious Meal</h1>
                <a href="BookTable.jsp" class="book">BOOK A TABLE</a>
            </div>
            <div class="col-md-7 text-center">
                <img src="<%= request.getContextPath() %>/Images/chicken1.png" id="image-food" alt="Plate of Food">
            </div>
        </div>
    </div>

    <div class="container">
        <center>
            <h1 id="about" style="padding-top:15px;color:yellow;padding-bottom: 15px;">ABOUT US</h1>
        </center>
        <div class="row">
            <div class="col-md-6">
                <img src="<%= request.getContextPath() %>/Images/GirlBiryani.avif" id="girl-hand" class="img-fluid" alt="Biryani" data-aos="fade-up">
            </div>
            <div class="col-md-6" align="justify" style="padding-left:80px;font-size:20px;">
                    <div class="item" data-aos="zoom-in">
                    <p>
                        Since opening in 2020, our restaurant has been dedicated to creating unforgettable dining experiences. Blending fresh, locally-sourced ingredients with time-honored recipes, we bring a unique taste to every dish. Our chefs combine traditional techniques with global inspirations to craft flavors that resonate.
                        Whether it’s a casual meal or a special celebration, our space is designed to make you feel at home. We believe in the joy of good food, made with love and shared with friends. Join us and experience a meal that’s as comforting as it is inspired!
                    </p> 
                </div>
               
            </div>
        </div>
    </div>

    <center>
        <h1 style="color:yellow;padding-bottom: 15px;" id="services">Services</h1>
    </center>
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="item" data-aos="fade-right">
                    <div class="card">
                        <div class="card-body">
                            
                            <h4>Master Chefs</h4>
                            <p align="justify">Diamonds shine as rare as those who stand out in skill, with just the right balance of precision and creativity.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="item" data-aos="zoom-in-up">
                    <div class="card">
                        <div class="card-body">
                            
                            <h4>Quality Food</h4>
                            <p align="justify">Diamonds shine as rare as those who stand out in skill, with just the right balance of precision and creativity.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="item" data-aos="fade-up">
                    <div class="card">
                        <div class="card-body">
                            
                            <h4>Online Order</h4>
                            <p align="justify">Diamonds shine as rare as those who stand out in skill, with just the right balance of precision and creativity.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="item" data-aos="fade-left">
                    <div class="card">
                        <div class="card-body">
                            
                            <h4>24/7 Service</h4>
                            <p align="justify">Diamonds shine as rare as those who stand out in skill, with just the right balance of precision and creativity.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <center><h1 style="color:yellow;padding-top:10px;padding-bottom:10px;" id="gallery">Gallery</h1></center>
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="item pt-3" data-aos="flip-up">
                   <img src="<%= request.getContextPath() %>/Images/picture6.jpg" height="250px" width="100%" alt="picture1">
                </div>

            </div>
            <div class="col-4">
                <div class="item pt-3" data-aos="fade-down-left">
                   <img src="<%= request.getContextPath() %>/Images/picture5.jpg" height="250px" width="100%" alt="picture1">
                </div>

            </div>
            <div class="col-4">
                <div class="item pt-3" data-aos="flip-right">
                   <img src="<%= request.getContextPath() %>/Images/picture3.webp" height="250px" width="100%" alt="picture1">
                </div>

            </div>
        </div>
        <div class="row mt-4 mb-4">
            <div class="col-4">
                <div class="item" data-aos="zoom-in-down">
                    <img src="<%= request.getContextPath() %>/Images/BoneLess.jpg" height="250px" width="100%" alt="picture1"> 
                </div>
            </div>
            <div class="col-4">
                <div class="item" data-aos="flip-down">
                    <img src="<%= request.getContextPath() %>/Images/wallpaper.jpg" height="250px" width="100%" alt="picture1">
                </div>
            </div>
            <div class="col-4">
                <div class="item" data-aos="flip-left">
                    <img src="<%= request.getContextPath() %>/Images/wallpa1.jpg" height="250px" width="100%" alt="picture1">
                </div>
            </div>
        </div>
    </div>
    <footer id="footer"style="background-color: #343a40; color: white; padding: 30px 0;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 col-12 mb-4">
                    <h1 style="font-size: 24px; font-weight: bold; border-bottom: 2px solid orange; padding-bottom: 10px;">Company</h1>
                    <ul class="list-unstyled">
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-info-circle"></i> About Us</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-phone"></i> Contact Us</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-utensils"></i> Reservation</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-shield-alt"></i> Privacy Policy</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-file-contract"></i> Terms & Conditions</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-12 mb-4">
                    <h1 style="font-size: 24px; font-weight: bold; border-bottom: 2px solid orange; padding-bottom: 10px;">Contact</h1>
                    <ul class="list-unstyled">
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-phone"></i> Phone: 8096816014</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-envelope"></i> Email:bhavani@gmail.com</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;"><i class="fa fa-location-dot"></i> Address: Taste on,Kphb road-1,Hyderabad</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-12 mb-4">
                    <h1 style="font-size: 24px; font-weight: bold; border-bottom: 2px solid orange; padding-bottom: 10px;">Follow Us</h1>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#" style="color: white; text-decoration: none;"><i class="fa fa-facebook-f"></i> Facebook</a>
                        </li>
                        <li>
                            <a href="#" style="color: white; text-decoration: none;"><i class="fa fa-twitter"></i> Twitter</a>
                        </li>
                        <li>
                            <a href="#" style="color: white; text-decoration: none;"><i class="fa fa-instagram"></i> Instagram</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="text-center" style="padding: 15px;">
            <p>&copy; 2024 Your Company Name. All Rights Reserved.</p>
        </div>
    </footer>
    
   

    <script>
        // Initialize AOS after the document is loaded
        $(document).ready(function() {
            AOS.init();
        });
    </script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   
</body>
</html>
