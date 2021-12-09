<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.docCategory"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

		<title>add Doctors Form</title>
		
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



		<div class="container mt-5 mb-5">
		
		
			<form id="addDoctorForm" action="#" method="post" enctype="multipart/form-data">
			
				  <div class="form-group">
				    <label for="doctorName">Doctor Name</label>
				    <input name="doctorName" type="text" class="form-control" id="doctorName"  placeholder="Enter doctor Name">
				    <small id="emailHelp" class="form-text text-muted">Possible to enter name with initials</small>
				  </div>
			
				  <div class="form-group">
				    <label for="doctorDescription">Description</label>
				    <textarea name="doctorDescription" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				  </div>
				  
				  <div class="form-group">
				    <label for="doctorHospital">Work Place</label>
				    <input name="doctorHospital" type="text" class="form-control" id="doctorHospital"  placeholder="Enter doctor working hospital">
				 		
				  </div>

				  
				  <div class="form-group">
				    <label for="exampleFormControlInput1">Email address</label>
				    <input name="doctorEmail" type="email" class="form-control" id="doctorEmail" placeholder="name@example.com">
				    <small id="emailHelp" class="form-text text-muted">Enter email given format</small>	
				  </div>
				  
				  
				  <div class="form-group">
				    <label for="doctorPhone">Contact Number</label>
				    <input name="doctorPhone" type="number" class="form-control" id="doctorPhone"  placeholder="Enter doctor contact number">	
				  </div>

				  
				  <div class="form-group">
				    <label for="doctorSpecies"> Doctor species for</label>
				    <select name="doctorSpecies" class="form-control" id="doctorSpecies">
				      <option selected disabled>--select species--</option>
				      
				      <!-- get doc category details -->
				      <%
				      	
				      	//get all category details via array list
				      	ArrayList<docCategory> docCatlist =  doctorDButill.getAllDeoctorsCategory();
				      	
				    		//crate foreach loop and assign the value into option
				    		for(docCategory c:docCatlist){
				    		%>
				    			<option value="<%= c.getDcid() %>"><%= c.getName() %></option>
				    		<% 
				    		}
				      %>
				      
				    </select>
				  </div>
				  
				  
				  <div class="form-group">
				    <label for="doctorImage">Profile Picture</label>
				    <input name="doctorImage" type="file" class="form-control" >
				  </div>
				  
		
				  
				  	<div class="container">
						
						<button id="saveBtn" type="submit" class="btn btn-outline-primary float-right">Add Doctor</button>
						<a href="adminPanel.jsp" type="button" class="btn btn-outline-primary float-right mr-2">Back</a>
						
					</div>
				  
			</form>
		
		
		
		</div>








<!-- jquery script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/myjs.js"></script>
	
	
	<!-- add form data -->
	<script>
	
		$(document).ready(function() {
			
			
			console.log('loard addd doc data...');
			
			$('#addDoctorForm').on("submit", function(evenet) {
				evenet.preventDefault();
				
				
				let form = new FormData(this);
				
				//now requestiong to server
				$.ajax({
					
					url: "addDoctorsServlet",
					type: 'POST',
					data: form,
					success: function(data, textStatus, jqXHR) {
						
						//console.log(data);
						
						if(data.trim() == "done"){
							swal("Good job!", "Add Successfully!", "success");
						}else{
							swal("Error!", "Something went wrong !, Try Again..", "error");
						}
						
					},
					error: function (jqXHR, textStatus, errorThrown) {
						//console.log(data);
						swal("Good job!", "You clicked the button!", "success");
					},
						processData: false,
						contentType: false
					
				});//ajax end
				
				
			});//sumit end
			
		});//main end
	
	</script>


</body>
</html>