<%-- 
    Document   : CreateNewStaff
    Created on : Nov 13, 2020, 12:31:18 PM
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
    <title>Our Resto</title>  
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
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'>
    <link href="menu/css/bootstrap.min.css" rel="stylesheet">
    <link href="menu/css/font-awesome.min.css" rel="stylesheet">
    <link href="menu/css/templatemo-style.css" rel="stylesheet">
</head>

<style>
    #welcom-custom{
            font-family: 'Bevan';
            font-size: 20px;
        }
        
        #custom-col{
            margin-top: 100px;
            margin-bottom: 50px;
        }
        
        #index-col{
            font-family: 'Bevan';
            font-size: 18px;
            /*color: #D5A736;*/
            margin-bottom: 20px;
        }
        #quantity{
            /*text-align: center;*/
        }
        
        #table-custom{
            margin-right: 50px;
            /*margin-left: 50px;*/
            
            margin-top: 60px;
            margin-bottom: 30px;
        }
        #button-custom{
            margin-bottom: 50px;
        }
        #thead-custom{
        }
        #Female{
            margin-left: 14px;
	}
        #Male{
            margin-left: 10px;
        }
</style>

<body>
    
    <%! String admin; %>
    
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Progma", "no-cache");
        response.setHeader("Expires", "0");
        
        admin = (String) session.getAttribute("admin");
        if(admin == null){
            response.sendRedirect("StaffLogin.jsp");
        }
    %>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
                            <li class="nav-item"><p id="welcom-custom">Admin, <%=admin%> </p></li>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="admin.jsp">Menu</a></li>
						<li class="nav-item"><a class="nav-link" href="createitem.jsp">New Dish</a></li>
                                                <li class="nav-item active"><a class="nav-link" href="#">New Staff</a></li>
                                                <li class="nav-item"><a class="nav-link" href="LogOutStaff">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	<!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1>Add New Staff</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->
	
	
       <div class="reservation-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-xs-12">
					<div class="contact-block">
						<form action="CreateStaff" method="post">
							
								<div class="">
									<h3>Enter Staff Details</h3>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="username" placeholder="Username" required data-error="Please enter Username">
											<div class="help-block with-errors"></div>
										</div>                                 
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" placeholder="Name" id="email" class="form-control" name="name" required data-error="Please enter Name">
											<div class="help-block with-errors"></div>
										</div> 
									</div>
									<div class="col-md-12" id="custom-col">
										<div class="form-group">
											<p style="font-weight: bold;">Select Gender</p>
											<input type="radio" id="Male" name="gender" value="M" checked>
											<label for="Male">Male</label>
											<input type="radio" id="Female" name="gender" value="F">
											<label for="Female">Female</label>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" placeholder="Address" id="email" class="form-control" name="address" required data-error="Please enter Address">
											<div class="help-block with-errors"></div>
										</div> 
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="Number" step="0" placeholder="Enter Salary" id="phone" class="form-control" name="salary" required data-error="Please Enter Salary">
											<div class="help-block with-errors"></div>
										</div> 
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="password" placeholder="Create Password" id="Password" class="form-control" name="password" required data-error="Please Enter Password">
											<div class="help-block with-errors"></div>
										</div> 
									</div>
								</div>
								<div class="col-md-12">
									<div class="submit-button text-center">
										<button class="btn btn-common" id="submit" type="submit">Add Staff</button>
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

       

	
	 <!--Start Contact info--> 
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
	<!-- End Contact info 
	
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
	<script src="main/js/form-validator.min.js"></script>
        <script src="main/js/contact-form-script.js"></script>
        <script src="main/js/custom.js"></script>
        
        <!-- JS -->
        <script type="menu/text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
        <script type="menu/text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
</body>
</html>