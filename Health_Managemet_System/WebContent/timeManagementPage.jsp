<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.docCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.medical.entities.myMassage"%>
<%@page import="com.medical.entities.patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
        
        <%@page errorPage="error_page.jsp" %>
    
    <%
    	
    	//create the object from the patient calss and session is assign to it
  	    patient p = (patient)session.getAttribute("curretUser");
    
    	//then if the session is null, user redirect to the login page 
    	if(p ==  null){
    		
    		response.sendRedirect("login_page.jsp");
    		
    	}
    
    %>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

	<title>timeManagementPage</title>
	
	
		<!-- boostrap cdn -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	<link rel="stylesheet" href="css/headerStyle.css" type="text/css"/>
	<link rel="stylesheet" href="css/profilecss.css" type="text/css"/>
	
	<!-- font awasome icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!--font awesom CDN-->
    <script src="https://kit.fontawesome.com/2a0f6dfc30.js" crossorigin="anonymous"></script>

</head>
<body>


			<!-- include header -->
	 	<header>
	
	        <!--contaner-->
	        <div class="container">
	
	            <div class="row">
	                <div class="col-md-4 col-sm-12 col-12">
	                    
					
					<!-- logo -->
					<div class="col-md-4 col-12 ">
						<div class="logo">
						<i class="fab fa-medrt fa-6x fa-spin"></i>
						</div>
					</div>	
						
	                </div>
	
	                <div class="col-md-4 col-12 text-center">
	                    <h2 class="my-md-3  site-titel text-white">Chanel D Medical Center</h2>
	                </div>
	
	                <div class="col-md-4 col-12 text-right">
	                    <p class="my-md-4 header-link">
	                        <a href="#" class="px-2" data-toggle="modal" data-target="#profile-model"> <span> <i class="fas fa-user-circle"></i> </span>  <%= p.getName() %> </a>
	                        <a href="logout.jsp" class="px-1"> <span><i class="fas fa-sign-out-alt"></i></span> Logout !</a>
	                    </p>
	                </div>
	
	            </div>
	
	        </div> <!--/contaner-->
	
		</header> <!-- header end -->
		
		
			<!-- include navbar -->
		<%@ include file = "userNavBar.jsp"  %>
		
		
			<!-- profile model -->
			
			<!-- Modal -->
			<div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header primary-background text-white">
					        <h5 class="modal-title" id="exampleModalLabel">My Profile</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      
					      
							<div class="container text-center">
							
								<img alt="image" src="proPics/<%= p.getImage() %>" style="max-width:150px; border-radius:50%; ">
								<br>
								<h4 class="mt-3 mb-3">Hi,<%= " "+ p.getName() %> </h4>
								
							</div>	
							
							<div id="profile_details">
							
								
								
								    <!-- get massage with session -->
			    
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
									    		
									    	}
									    	
											//after the displaing the msg remove session
											session.removeAttribute("msg");
									    
									    %>
								
								
							
								<table class="table">
				
									  <tbody>
									    <tr>
									      <th scope="row">User ID</th>
									      <td><%= p.getPid() %></td>
									      
									    </tr>
									    <tr>
									      <th scope="row">Full Name</th>
									      <td><%= p.getName() %></td>
									      
									    </tr>
									    <tr>
									      <th scope="row">Age</th>
									      <td><%= p.getAge() %></td>
									    </tr>
									    
									  	<tr>
									      <th scope="row">Address</th>
									      <td><%= p.getAddress()%></td>
									    </tr>
									    
									     <tr>
									      <th scope="row">Gender</th>
									      <td><%= p.getGender() %></td>
									    </tr>
									    
									     <tr>
									      <th scope="row">Email</th>
									      <td><%= p.getEmail() %></td>
									    </tr>
									    
									    <tr>
									      <th scope="row">Password</th>
									      <td><%= p.getPassword() %></td>
									    </tr>
									    
									    <tr>
									      <th scope="row">Registerd Date&Time</th>
									      <td><%= p.getRegDate().toGMTString() %></td>
									    </tr>
									  </tbody>
								</table>				
					      </div>
					      
					      <!-- edit details -->
					      <div id="edit_details" style="display: none;">
					      
					      	<h3 class="mt-3 text-center">Edit Your Profile</h3>
					      	
					      		<form id="editFrom" action="userEditServlet" method="post" enctype="multipart/form-data">
					      		
					      			<table class="table">
				
									  <tbody>
			
									    <tr>
									      <th scope="row">Full Name</th>
									      <td> <input name="userName" type="text" class="form-control" id="userName"  value="<%= p.getName() %>"> </td>
									      
									    </tr>
									    <tr>
									      <th scope="row">Age</th>
									      <td>  <input name="userAge" type="number" class="form-control" id="userAge"  value="<%= p.getAge() %>" ></td>
									    </tr>
									    
									  	<tr>
									      <th scope="row">Address</th>
									      <td> <textarea name="userAddress" rows="3" cols="5" class="form-control" id="userAddress"><%= p.getAddress() %></textarea></td>
									    </tr>
									    
									     <tr>
									      <th scope="row">Gender</th>
									      <td><%= p.getGender() %></td>
									    </tr>
									    
									     <tr>
									      <th scope="row">Email</th>
									      <td> <input name="userEmail" type="email" class="form-control" id="userEmail" aria-describedby="emailHelp" value="<%= p.getEmail() %>" ></td>
									    </tr>
									    
									    <tr>
									      <th scope="row">Password</th>
									      <td> <input name="userPassword" type="password" class="form-control" id="userPassword" value="<%= p.getPassword() %>" ></td>
									    </tr>
									    
									    <tr>
									      <th scope="row">Re-Enter Password</th>
									      <td> <input name="userPasswordConfirm" type="password" class="form-control" id="userPassword" value="<%= p.getPassword() %>" ></td>
									    </tr>
									  </tbody>
									  
									  <tr>
									      <th scope="row">Profile Picture</th>
									      <td> <input name="userPropic" type="file" class="form-control" ></td>
									    </tr>
									  </tbody>
								</table>
								
									<div class="container">
									
										<button id="saveBtn" type="submit" class="btn btn-outline-primary float-right">Save</button>
									
									</div>			
					      		
					      		</form>
					      
					      </div>
					      
					      
					      		     <!-- delete confirmation details -->
					     			 <div id="delete_details" style="display: none;">
						     			 	
						     			 	<div class="container text-center">
						     			 		
						     			 		<h5 style="color: red">Dear <%= " "+p.getName()+", " %> Your are trying to delete your account now!!</h5>
						     			 		<br>
						     			 		<p style="font-weight: bold">This will delete your account permanently... There for we have to confirmation from you</p>
						     			 		
						     			 		<p style="font-weight: bold">Still if your want to delete your account !, Please enter you email..</p>
						     			 		<br>
						     			 		
						     			 		<form id="delete" action="userDeleteServlet" method="post">
						     			 		
						     			 		 <div class="form-group">
												    <label for="exampleInputEmail1" class="float-left" style="font-weight: bold">Email address</label>
												    <input name="userName" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required">
												    
												 </div>
						     			 			
						     			 			<button id="deleteBtn" type="submit" class="btn btn-outline-danger float-right">Delete</button>
						     			 			
						     			 		</form>
						     			 	</div>
						     			 	
					     			 </div>
					        
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button id="delete_button" type="button" class="btn btn-danger">Deactivate</button>
					        <button id="edit_button" type="button" class="btn btn-primary">Edit</button>
					      </div>
					    </div>
					  </div>
					</div>	
					
			<!-- end of profile model -->
			
			
			
		<!-- time table content -->	
		<main>
			
			<div class="container" style="max-width: 1300px">
			
				<div class="row mt-3">
				
				
					<!-- first col -->
					<div class="col-md-3" >
						
							<!-- doc time categories -->
							
							<div class="list-group">
							
							  <a href="#" onclick="getTimeTableDetails(0, this)" class="clickThisLink list-group-item list-group-item-action active">All </a>
							  <a href="#" onclick="getTimeTableDetails(1, this)" class="clickThisLink list-group-item list-group-item-action ">Weekday</a>
							  <a href="#" onclick="getTimeTableDetails(2, this)" class="clickThisLink list-group-item list-group-item-action ">Weekend</a>
							  <a href="#" onclick="getTimeTableDetails(3, this)" class="clickThisLink list-group-item list-group-item-action ">Special Day</a>

							</div>
							
						
					</div>
					
					
					
					<!-- second col -->
				    <div class="col-md-9" >
						
						<!-- doctor list -->
							
						<div class="container text-center" id="loader">
									
							<i class="fa fa-refresh fa-4x fa-spin"></i>
							<h3 class="mt-2">Loading....</h3>
									
						</div>
									
						<div class="container-fluid " id="docDetailsPalce">
									
									
						</div>
								
					</div>
				
				
				
				</div>
			
			</div>
						
			
		</main>
		<!-- //time table content -->		
			
			
			
			
	<!-- include footer -->
	<%@ include file = "footer.jsp"  %>	
			
			
			
	<!-- jquery script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/editdata.js"></script>
		
	
	
	
		<!-- time table details -->
	
	<script>
	
		function getTimeTableDetails(tid, activeThisSelectedLink) {
			
			//dcid.preventDefault();
			
			//loder show
			$('#loader').show();
			//hide content
			$('#docDetailsPalce').hide();
			//catch the click link and remove active class
			$('.clickThisLink').removeClass('active');
			
			$.ajax({
				
				//goto jsp page
				url : "docTimeDetailsPost.jsp",
				data: {dtid: tid},
				success: function (data, textStatus, jqXHR) {
					
					//hide loading containe
					$('#loader').hide();
					//show content
					$('#docDetailsPalce').show();
					
					//showing jsp page content in given id palce
					$('#docDetailsPalce').html(data);
					//console.log(data);
					
					//active link when click
					$(activeThisSelectedLink).addClass('active');
				}
				
			});//ajax end
			
			
		}//get fun end
	
	
		
	$(document).ready(function(e) {
			
			//by default select all time catagorey 
			let allCatReg = $('.clickThisLink')[0];
			
			//call getTimeTableDetails function
			//0 mens when id is equel to 0  all today time
			getTimeTableDetails(0, allCatReg);
			
		});//main end
	
	</script>
		


</body>
</html>