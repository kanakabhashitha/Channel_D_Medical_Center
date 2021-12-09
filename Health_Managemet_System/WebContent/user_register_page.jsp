<%@page import="com.medical.entities.myMassage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>User Register Page</title>
	
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
	
	
	
	<main class="primary-background p-5 banner-background2" style="height: 165vh">
	
		<div class="container">
		
			<div class="col-md-6 offset-md-3">
			
			<div class="card  border-light">
			
					<div class="card-header text-center primary-background text-white">
						<span> <i class="fas fa-user-plus fa-3x"></i> </span> <br>
						Register Here
					</div>
							
					<div class="card-body">
					
						<form action="patientRegisterServlet" method="post">
						
							<!-- alert massage -->
						<%
							//create the object from myMassage class and assing the session it
							myMassage myMsg = (myMassage)session.getAttribute("msg");
						
							//if the session is not null, display the msg 
							if(myMsg != null){
								
								%>
								<div class="alert alert-danger" role="alert">
	  								 <%= myMsg.getContent() %>
								</div>
								<%
								
								//after the displaing the msg remove session
								session.removeAttribute("msg");
							}
								
						%>
						
							 <div class="form-group">
							    <label for="userName">Full Name</label>
							    <input name="userName" type="text" class="form-control" id="userName"  placeholder="Enter Full Name">
							    <small id="emailHelp" class="form-text text-muted">Possible to enter name with initials</small>
							  </div>
	
							 <div class="form-group">
							    <label for="userAge">Age</label>
							    <input name="userAge" type="number" class="form-control" id="userAge"  placeholder="Enter Age" required="required">
							  </div>		
							  
							  <div class="form-group">
							    <label for="userAddress">Address</label>
							    <textarea name="userAddress" rows="3" cols="5" class="form-control" id="userAddress"  placeholder="Enter Address" required="required"></textarea>
							    <small id="userAddress" class="form-text text-muted">We'll never share your address with anyone else.</small>
							  </div>
							  					  				  
			
							  <div class="form-group">
							    <label for="userGender">Gender</label> <br>
							    <input type="radio"  id="userGenderMale" value="male" name="userGender"> Male
							    <input type="radio"  id="userGenderFemale" value="female" name="userGender"> Female
							   
							  </div>	
							  
							  <div class="form-group">
							    <label for="userEmail">Email address</label>
							    <input name="userEmail" type="email" class="form-control" id="userEmail" aria-describedby="emailHelp" placeholder="Enter email" required="required">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  
							  <div class="form-group">
							    <label for="userPassword">Password</label>
							    <input name="userPassword" type="password" class="form-control" id="userPassword" placeholder="Enter Password" required="required">
							  </div>
							  
							  <div class="form-group">
							    <label for="userPasswordConfirm">Re-Enter Password</label>
							    <input name="userPasswordConfirm" type="password" class="form-control" id="userPasswordConfirm" placeholder="Re-Enter Password" required="required">
							  </div>
							  
							  <div>
					                <ul style="list-style: none; margin-left: -20px; margin-top: 10px">
					                    <li><a href="temsAndCondition.jsp">Terms and Conditions</a></li>
					                </ul>
					           </div>
							  
							  
							  <div class="form-check">
							    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
							  </div>
							  <br>
							  	<div class="container text-center" id="loader" style="display: none;">
							  	
							  		<span><i class="fas fa-sync fa-3x fa-spin"></i></span>
							  		<h3>Processing your data...</h3>
							  	
							  	</div>
							  <button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
						</form>
					
					</div>
										
					<div class="card-footer">
					
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/myjs.js"></script>
	
	
  	
	<script>
	
		

	</script>
	
	
	


</body>
</html>