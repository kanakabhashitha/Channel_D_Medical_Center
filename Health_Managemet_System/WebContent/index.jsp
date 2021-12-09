<%@page import="com.medical.helper.connectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

	<!-- boostrap cdn -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	<link rel="stylesheet" href="css/articalCss.css" type="text/css"/>
	
	<!-- font awasome icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!--font awesom CDN-->
    <script src="https://kit.fontawesome.com/2a0f6dfc30.js" crossorigin="anonymous"></script>
    
	
</head>
<body>

	
	<!-- include header -->
 	<%@ include file = "header.jsp" %>
	<!-- include navbar -->
	<%@ include file = "userNavBar.jsp"  %>
	
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0">
	
		<div class="jumbotron primary-background text-white banner-background">
		
			<div class="container">
				  <h1 class="display-4">Hello, Dear!</h1>
				  <p class="lead">Welcome to the Chanel D Medical Center</p>
				  <hr class="my-4 "  >
				  <p>Please register with us to access all the service. To do so, click on the Register button below.</p>
				  <p class="lead">
				    <a class="btn btn-outline-light btn-lg" href="user_register_page.jsp" role="button"> <span> <i class="fas fa-sign-in-alt"></i> </span> Registre ! it's free</a>
				    <a class="btn btn-outline-light btn-lg" href="login_page.jsp" role="button"> <span> <i class="far fa-user-circle fa-spin"></i> </span> Login</a>
				  </p>
			</div>
		
		</div>
	
	</div>
	
	
	
	
	<!-- cards -->
	
	<div class="container">

		<div class="row h-titel">
			<h2 class="h1-titel">Health </h2> <h2 class="h2-titel"> Hub</h2>
		</div>
		
		<div class="row h-sub-titel">
			<p>Read from our newsletters, articles, press releases and highlights from our social media channels</p>
		</div>
		
	
		<div class="row ">
		
		
			<div class="col-md-4">
			
				<div class="card">
					<img src="./img/n1.jpg" alt="n1" style="width:100%">
						  <div class="card-body">
						    <h5 class="card-title">Navigating the <br>pandemic</h5>
						    <p class="card-text">What can we do to bring a better state of health and wellness, and quickly recover to withstand the pandemic?</p>
						    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#articleModal1">View Article</a>
						  </div>
				</div>
			
			</div>
			
			<div class="col-md-4">
			
				<div class="card">
					<img src="./img/n2.jpg" alt="n2" style="width:100%">
						  <div class="card-body">
						    <h5 class="card-title">Keeping a Lockdown On Your Weight</h5>
						    <p class="card-text">Being confined indoors, how many of us are struggling with weight changes, stress and an uncertain predicament?</p>
						    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#articleModal2">View Article</a>
						  </div>
				</div>
			
			</div>


			<div class="col-md-4">
			
				<div class="card">
					<img src="./img/n3.jpg" alt="n3" style="width:100%">
						  <div class="card-body">
						    <h5 class="card-title">What we can do, in lockdown</h5>
						    <p class="card-text">One of the important aspects to understand is that being in lockdown is not normal for our wellbeing. So what can we do?</p>
						    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#articleModal3">View Article</a>
						  </div>
				</div>
			
			</div>
			
			
			
		
			
			
		</div>



		<div class="row mt-4 " style="margin-bottom: 100px;">
		
		
			<div class="col-md-4">
			
				<div class="card">
					<img src="./img/n4.jpg" alt="n4" style="width:100%">
						  <div class="card-body">
						    <h5 class="card-title">You Can Ward  <br>Off Flu</h5>
						    <p class="card-text">Fever, body aches, a runny nose, cough and generalised weakness are all symptoms of flu.</p>
						    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#articleModal4">View Article</a>
						  </div>
				</div>
			
			</div>
			
			<div class="col-md-4">
			
				<div class="card">
					<img src="./img/n5.jpg" alt="n5" style="width:100%">
						  <div class="card-body">
						    <h5 class="card-title">You Can Conceive Despite PCOS</h5>
						    <p class="card-text">Early intervention can help in preventing the development of infertility from Polycystic Ovary Syndrome (PCOS)</p>
						    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#articleModal5">View Article</a>
						  </div>
				</div>
			
			</div>


			<div class="col-md-4">
			
				<div class="card">
					<img src="./img/n6.jpg" alt="n6" style="width:100%">
						  <div class="card-body">
						    <h5 class="card-title">Hand Hygiene <br> 101</h5>
						    <p class="card-text">Clean hands save lives. Here’s what you need to know about the soaps to use and how to keep your hands clean, safely.</p>
						    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#articleModal6">View Article</a>
						  </div>
				</div>
			
			</div>
			
			
			
		
			
			
		</div>
	
	
	</div>
	
	<!-- //cards -->
	
	
	
	<!-- article modal -->
	
		<!-- article 1 -->
			<div class="modal fade bd-example-modal-lg" id="articleModal1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">ARTICLE</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        	<!-- include article 1 -->
 						<%@ include file = "article/article1.jsp" %>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- //article 1 -->


		<!-- article 2 -->
			<div class="modal fade bd-example-modal-lg" id="articleModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">ARTICLE</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        	<!-- include article 1 -->
 						<%@ include file = "article/article2.jsp" %>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- //article 2 -->
	
		<!-- article 3 -->
			<div class="modal fade bd-example-modal-lg" id="articleModal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">ARTICLE</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        	<!-- include article 1 -->
 						<%@ include file = "article/article3.jsp" %>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- //article 3 -->

		<!-- article 4 -->
			<div class="modal fade bd-example-modal-lg" id="articleModal4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">ARTICLE</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        	<!-- include article 1 -->
 						<%@ include file = "article/article4.jsp" %>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- //article 4 -->
	
		<!-- article 5 -->
			<div class="modal fade bd-example-modal-lg" id="articleModal5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">ARTICLE</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        	<!-- include article 1 -->
 						<%@ include file = "article/article5.jsp" %>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- //article 5 -->

		<!-- article 6 -->
			<div class="modal fade bd-example-modal-lg" id="articleModal6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">ARTICLE</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        	<!-- include article 1 -->
 						<%@ include file = "article/article6.jsp" %>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- //article 6 -->
	
	<!-- //article modal -->
	
	
	<!-- include footer -->
	<%@ include file = "footer.jsp"  %>
	
	
	
	<!-- jquery script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjs.js"></script>
	
	<script>

	</script>
	
	
</body>
</html>