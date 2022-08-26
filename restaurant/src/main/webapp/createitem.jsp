<%-- 
    Document   : createitem
    Created on : Nov 12, 2020, 6:37:37 PM
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
    <title>Yamifood Restaurant - Responsive HTML5 Template</title>  
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
	<!-- Pickadate CSS -->
    <link rel="stylesheet" href="main/css/classic.css">    
	<link rel="stylesheet" href="main/css/classic.date.css">    
	<link rel="stylesheet" href="main/css/classic.time.css">    
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="main/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="main/css/custom.css">
    
</head>
<style>
    body{
        /*background-color: #F8F8F8;*/
    }
    #welcom-custom{
            font-family: 'Bevan';
            font-size: 20px;
        }
</style>

<body>
    <%! String chef_username, admin; %>
    
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Progma", "no-cache");
        response.setHeader("Expires", "0");
        
        chef_username = (String) session.getAttribute("chef_username");
        admin = (String) session.getAttribute("admin");
        if(chef_username == null && admin == null){
            response.sendRedirect("StaffLogin.jsp");
        }
    %>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
                            <% if(admin == null){%>
				<li class="nav-item"><p id="welcom-custom">Hello, <%=chef_username%></p></li>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="staff0.jsp">Menu</a></li>
						<li class="nav-item active"><a class="nav-link" href="createitem.jsp">New Dish</a></li>
                                                <li class="nav-item"><a class="nav-link" href="LogOutStaff">Logout</a></li>
					</ul>
				</div>
                            <% }else{ %>
                                <li class="nav-item"><p id="welcom-custom">Admin, <%=admin%> </p></li>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="admin.jsp">Menu</a></li>
						<li class="nav-item active"><a class="nav-link" href="createitem.jsp">New Dish</a></li>
                                                <li class="nav-item"><a class="nav-link" href="CreateNewStaff.jsp">New Staff</a></li>
                                                <li class="nav-item"><a class="nav-link" href="LogOutStaff">Logout</a></li>
					</ul>
				</div>
                            <% } %>
				
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	<!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1>Create New Item</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->
	
	<!-- Start Add Items -->
	<div class="reservation-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-xs-12">
					<div class="contact-block">
						<form  action="AddItem" method="post">
							
								<div class="">
									<h3>Items Details</h3>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required data-error="Please enter your name">
											<div class="help-block with-errors"></div>
										</div>                                 
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" placeholder="Cuisine Type" id="email" class="form-control" name="cuisine" required data-error="Please enter Cuisine Type">
											<div class="help-block with-errors"></div>
										</div> 
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="Number" step="0.1" placeholder="Price" id="phone" class="form-control" name="price" required data-error="Please Price">
											<div class="help-block with-errors"></div>
										</div> 
									</div>
								</div>
								<div class="col-md-12">
									<div class="submit-button text-center">
										<button class="btn btn-common" id="submit" type="submit">Add Item</button>
										<div id="msgSubmit" class="h3 text-center hidden"></div> 
										<div class="clearfix"></div> 
									</div>
								</div>
                                                    </form>
                                            </div>            
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End -->

	
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
						<p class="company-name">All Rights Reserved. &copy; 2018 <a href="#"> Our Restro</a> Design By : 
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
	<script src="main/js/picker.js"></script>
	<script src="main/js/picker.date.js"></script>
	<script src="main/js/picker.time.js"></script>
	<script src="main/js/legacy.js"></script>
	<script src="main/js/form-validator.min.js"></script>
    <script src="main/js/contact-form-script.js"></script>
    <script src="main/js/custom.js"></script>
</body>
</html>
