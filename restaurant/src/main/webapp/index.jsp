<%-- 
    Document   : index
    Created on : Nov 5, 2020, 4:55:26 PM
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en"><!-- Basic -->
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
     <!-- Site Metas -->
    <title>Yummytéria</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="icon" type="image/png" href="login_f/images/icons/favicon.ico"/>
    <link rel="apple-touch-icon" href="main/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="main/css/bootstrap.min.css">    
	<!-- Site CSS -->
    <link rel="stylesheet" href="main/css/style.css">    
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="main/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="main/css/custom.css">


</head>

<body>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				
				 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button> 
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                                <li class="nav-item"><a class="nav-link" href="SignUp.jsp">Sign Up</a></li>
                                                <li class="nav-item"><a class="nav-link" href="StaffLogin.jsp">Staff Login</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	<!-- Start slides -->
	<div id="slides" class="cover-slides">
		<ul class="slides-container">
			<li class="text-center">
				<img src="main/images/slider-01.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20"><strong>Welcome To Yummytéria</strong></h1>
							<p class="m-b-40"><br>Today's Special<br>Nothing....<br>Nothing is Special<br>You<br>Are Special</p>
							<p><a class="btn btn-lg btn-circle btn-outline-new-white" href="login.jsp">Reservation</a></p>
						</div>
					</div>
				</div>
			</li>
			<li class="text-center">
				<img src="main/images/slider-02.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20"><strong>Welcome To Yummytéria</strong></h1>
							<p class="m-b-40"><br>Today's Special<br>Nothing....<br>Nothing is Special<br>You<br>Are Special</p>
							<p><a class="btn btn-lg btn-circle btn-outline-new-white" href="login.jsp">Reservation</a></p>
						</div>
					</div>
				</div>
			</li>
			<li class="text-center">
				<img src="main/images/slider-03.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20"><strong>Welcome To Yummytéria</strong></h1>
							<p class="m-b-40"><br>Today's Special<br>Nothing....<br>Nothing is Special<br>You<br>Are Special</p>
							<p><a class="btn btn-lg btn-circle btn-outline-new-white" href="login.jsp">Reservation</a></p>
						</div>
					</div>
				</div>
			</li>
		</ul>
		<div class="slides-navigation">
			<a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
			<a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- End slides -->
	
	
	
	
	<!-- Start Contact info -->
	<div class="contact-imfo-box">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<i class="fa fa-volume-control-phone"></i>
					<div class="overflow-hidden">
						<h4>Phone</h4>
						<p class="lead">
							+01 123-456-4590
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-envelope"></i>
					<div class="overflow-hidden">
						<h4>Email</h4>
						<p class="lead">
							19ucc114@lnmiit.ac.in
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<i class="fa fa-map-marker"></i>
					<div class="overflow-hidden">
						<h4>Location</h4>
						<p class="lead">
							Lnmiit, Jaipur, IN
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Contact info -->
	
	<!-- Start Footer -->
	<footer class="footer-area bg-f">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h3>About Us</h3>
					<p>Group Members</p>
					<p>- Mohit Goyani</p>
					<p>- Khushi Choudhary</p>
					<p>- Karan Goyanka</p>
					<p>- Bhavya Patel</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Opening hours</h3>
					<p><span class="text-color">Monday: </span>Closed</p>
					<p><span class="text-color">Tue-Wed :</span> 9:Am - 10PM</p>
					<p><span class="text-color">Thu-Fri :</span> 9:Am - 10PM</p>
					<p><span class="text-color">Sat-Sun :</span> 5:PM - 10PM</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3>Contact information</h3>
					<p class="lead">Rupa ki Nangal, Post-Sumel, Via, Jamdoli, Jaipur, Rajasthan 302031</p>
					<p class="lead"><a href="#">+01 2000 800 9999</a></p>
					<p><a href="#"> 19ucc114@lnmiit.ac.in</a></p>
				</div>
				
		</div>
		
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p class="company-name">All Rights Reserved. &copy; 2018 <a href="#"> Yummytéria</a> Design By : 
					<a href="https://html.design/">html design</a></p>
					</div>
				</div>
			</div>
		</div>
		
	</footer>
	<!-- End Footer -->
	
	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="main/js/jquery-3.2.1.min.js"></script>
	<script src="main/js/popper.min.js"></script>
	<script src="main/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
	<script src="main/js/jquery.superslides.min.js"></script>
	<script src="main/js/images-loded.min.js"></script>
	<script src="main/js/isotope.min.js"></script>
	<script src="main/js/baguetteBox.min.js"></script>
	<script src="main/js/form-validator.min.js"></script>
    <script src="main/js/contact-form-script.js"></script>
    <script src="main/js/custom.js"></script>
</body>
</html>