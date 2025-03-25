<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table Reservation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .image1 {
            background-image: url('<%= request.getContextPath() %>/Images/BookBack.jpg');
            background-repeat: no-repeat;
            background-size: cover; 
            background-position: center; 
            height: 250px;
            width: 100%;
            
        }
        .book {
            background-color: rgb(12, 4, 64);
            color: white; 
            padding: 20px; 
        }

        h3 {
            margin-bottom: 10px; 
        }

        .form-control {
            margin-bottom: 10px; 
        }
        .navbar .nav-link{
            color:white;
        }
    </style>
</head>
<body>
    <div class="container image1 position-relative">
        <div class="row">
            <div class="col-md-4 col-12 text-center text-md-left">
                <h1 class="name" style="color: yellow;">Taste <span style="color:green">On</span></h1>
            </div>
            <div class="col-md-8 col-12">
                <nav class="navbar navbar-expand-lg">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#CollapseNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="CollapseNavbar">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item mx-3">
                                <a href="restau.jsp" class="nav-link">Home</a>
                            </li>
                            <li class="nav-item mx-3">
                                <a href="menu" class="nav-link">Menu</a>
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
                        </ul>
                    </div> 
                </nav>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row">
            <div class="col-6">
                <img src="<%= request.getContextPath() %>/Images/Couple.avif" height="470px" width="104%" alt="Couple Dining">
            </div>
            <div class="col-6 book">
                <h3 style="color: orange;">Reservation</h3>
                <h4>Book A Table Online</h4>
                <form>
                    <div class="row">
                        <div class="col-6">
                            <input type="text" class="form-control" placeholder="Your Name" required>
                        </div>
                        <div class="col-6">
                            <input type="email" class="form-control" placeholder="Your Email" required>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-6">
                            <input type="datetime-local" class="form-control" required>
                        </div>
                        <div class="col-6">
                            <select class="form-control" required>
                                <option value="" disabled selected>Select Number of People</option>
                                <option>1 Person</option>
                                <option>2 People</option>
                                <option>3 People</option>
                                <option>4 People</option>
                                <option>5 People</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <select class="form-control" required>
                                <option value="" disabled selected>Select Table</option>
                                <option>Table 1</option>
                                <option>Table 2</option>
                                <option>Table 3</option>
                                <option>Table 4</option>
                            </select>
                        </div>
                            <textarea class="form-control" placeholder="Special Request (optional)" rows="4"></textarea>
                    </div>
                    <button type="submit" class="btn btn-warning form-control mt-2">BOOK</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
