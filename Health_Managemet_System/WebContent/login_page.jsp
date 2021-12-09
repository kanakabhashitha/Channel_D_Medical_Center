<%@page import="com.medical.entities.myMassage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Login Page</title>

	<!-- boostrap cdn -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	
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
	
	
	
	
	<main class="d-flex align-items-center primary-background banner-background " style="height: 80vh">
	
		<div class="container login">
		
			<div class="row">
			
				<div class="col-md-4 offset-md-4">
				
					<div class="card">
					
						<div class="card-header primary-background text-white text-center">
							
							<span> <i class="fas fa-user-plus fa-3x"></i> </span>
							<h4>Login Here</h4>
						
						</div>
						
						<!-- alert massage -->
						<%
							//create the object from myMassage class and assing the session it
							myMassage myMsg = (myMassage)session.getAttribute("msg");
						
							//if the session is not null, display the msg 
							if(myMsg != null){
								
								%>
								<div class="alert <%= myMsg.getCssClass() %>" role="alert">
	  								 <%= myMsg.getContent() %>
								</div>
								<%
								
								//after the displaing the msg remove session
								session.removeAttribute("msg");
							}
								
						%>
						
						
						<div class="card-body">
						
							<form action="loginServlet" method="post">
								  <div class="form-group">
								    <label for="exampleInputEmail1">Email address</label>
								    <input name="userName" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required">
								    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Password</label>
								    <input name="userPassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required">
								  </div>
								  
								  <br>
								  <button type="submit" class="btn btn-primary">Login</button>
							</form>
						
						
						</div>	
						
						<div class="card-footer">
						
						</div>
						
					
					</div>					
				
				</div>			
			
			</div>
		
		</div>
		
	</main>



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