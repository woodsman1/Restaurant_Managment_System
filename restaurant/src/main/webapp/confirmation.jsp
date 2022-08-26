<%-- 
    Document   : confirmation
    Created on : Nov 12, 2020, 11:38:17 AM
    Author     : Mohit
--%>

<%@page import="java.util.Vector"%>
<%@page import="com.restaurant.restaurant.module.Order"%>
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
    <link href='https://fonts.googleapis.com/css?family=Bevan' rel='stylesheet'>
    <link href="menu/css/bootstrap.min.css" rel="stylesheet">
    <link href="menu/css/font-awesome.min.css" rel="stylesheet">
    <link href="menu/css/templatemo-style.css" rel="stylesheet">

</head>


<body>
    
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
        #total-custom{
            font-family: 'Bevan';
        }
        
    </style>
    
    
    <%! String username; %>
    
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Progma", "no-cache");
        response.setHeader("Expires", "0");
        
        username = (String) session.getAttribute("username");
        if(username == null){
            response.sendRedirect("login.jsp");
        }
    %>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<li class="nav-item"><p id="welcom-custom">Hello, <%=username%></p></li>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item active"><a class="nav-link" href="customer.jsp">Menu</a></li>
						<li class="nav-item"><a class="nav-link" href="Reservation.jsp">Reservation</a></li>
                                                <li class="nav-item"><a class="nav-link" href="LogOut">Logout</a></li>
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
					<h1>Confirm Your Order</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->
	
	
        <!-- menu -->
        
        <%
            Order order = (Order) session.getAttribute("order");
            Integer order_id = (Integer) session.getAttribute("order_id");
            double total = (Double)session.getAttribute("total");
            Vector<String> Item_name = order.getList_of_itemsID();
            Vector<Double> Item_price = order.getPrice_of_items();
            Vector<Integer> Item_qunt = order.getQuantity();
            int total_qunt=0;
        %>
        
        <form action="customer.jsp" method="post">
        <table class="table" id="table-custom">
            <thead class="thead-dark" id="thead-custom">
              <tr>
                  <th scope="col"></th>
                  <th scope="col"></th>
                <th scope="col">Items</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
              </tr>
            </thead>
            <tbody>
                
                <%
                   for (int i = 0; i < Item_name.size(); i++){
                       String name = Item_name.get(i);
                       double price = Item_price.get(i);
                       int qunt = Item_qunt.get(i);
                       total_qunt += qunt;
                    
                    %>
                    <tr>
                        <th scope="row"></th>
                        <th scope="row"><%=i+1%></th>
                        <td><%=name%></td>
                        <td>$<%=price%></td>
                        <td><%=qunt%></td>
                     </tr>
                <%    
                  } 
                %>
                    <tr>
                        <th scope="row"></th>
                        <th scope="row" id="total-custom">#</th>
                        <td id="total-custom">Total</td>
                        <td id="total-custom">$<%=total%></td>
                        <td id="total-custom"><%=total_qunt%></td>
                     </tr>
                </tbody>
                </table>
                    
                
                    <div class="submit-button text-center" id="button-custom">
			<button class="btn btn-common"  type="submit">Order ID : <%=order_id%></button>
                            <div  class="h3 text-center hidden"></div> 
				<div class="clearfix"></div> 
                    </div>
                </form>
            

        </div>
        

        <!--End menu-->


        
        
       

	
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