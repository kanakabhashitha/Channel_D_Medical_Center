<%@page import="com.medical.dao.timeManagementDButill"%>
<%@page import="com.medical.entities.timeManagement"%>
<%@page import="java.util.List"%>
<%@page import="com.medical.entities.docCategory"%>
<%@page import="com.medical.entities.myMassage"%>
<%@page import="com.medical.entities.patient"%>
<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.Doctors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
   <!-- get user session --> 
  <%@page errorPage="error_page.jsp" %>
    
    <%
    	
    	//create the object from the patient calss and session is assign to it
  	    patient p = (patient)session.getAttribute("curretUser");
    
    	//then if the session is null, user redirect to the login page 
    	if(p ==  null){
    		
    		response.sendRedirect("login_page.jsp");
    		
    	}
    
    %>
    
    <!-- get doctor details call method -->
    
    <%
    
    	int docID = Integer.parseInt(request.getParameter("docID"));
    	
    	Doctors d = doctorDButill.getDocDetailsByDocId(docID);
    
    %>
    
    <!-- get doctor category name -->
    <%
    
    	int catID = d.getCatid();
    	docCategory dc = doctorDButill.getCategoryNameByDid(catID);
    
    
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title><%= d.getName() %></title>

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
<body style="background: #f2f2f2">


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
		
			</header>
	 	
		 	
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
	




<!-- doctor profile -->

			
		<div class="probody">
		<div class="container mt-5 mb-5 body">
		        <div class="row">
		            <div class="col-12">
		                <div class="card">
		
		                    <div class="card-body" style="  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);  transition: 0.3s;">
		                    
		                        <div class="card-title mb-4">
		                            <div class="d-flex justify-content-start">
		                                <div class="image-container">
		                                
		                               
		                                    <img class="img-thumbnail" src="proPics/<%= d.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 150px; height: 150px">
		                                    
		 
		                                </div>
		                                
		                                
		                                <div class="userData ml-3">
		                                
		                                    <h2 class="d-block mt-2" style="font-size: 1.5rem; font-weight: bold; color: #1e88e5"><%= "Dr. "+ d.getName() %></h2>
		                                    <h2 class="d-block mt-4" style="font-size: 1.1rem; color: #1e88e5"><%= dc.getName() %></h2>
		                                    <button type="button" class="btn btn-outline-primary mt-3" data-toggle="modal" data-target="#bookingModal" >Make Appointment</button>
		                                </div>
		                    
		                            </div>
		                        </div>
		
		
		                        <div class="row">
		                        
		                            <div class="col-12">
		                            
		                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
		                                
		                                    <li class="nav-item">
		                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
		                                    </li>
		                                    <li class="nav-item">
		                                        <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Time Schedule</a>
		                                    </li>
		                                    
		                                </ul>
		                                
		                                
		                                <div class="tab-content ml-1" id="myTabContent">
		                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
		                                        
		                                        
		                                        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Register No</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getDid() %>
		                                            </div>
		                                        </div>
		                                        <hr />
		
		                                        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Doctor Name</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getName() %>
		                                            </div>
		                                        </div>
		                                        <hr />
		
		                                        
		                                        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Description</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getDescription() %>
		                                            </div>
		                                        </div>
		                                        <hr />
		                                        
		                                        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Work Place</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getHospital() %>
		                                            </div>
		                                        </div>
		                                        <hr />
		                                        
		                                        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Email</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getEmail() %>
		                                            </div>
		                                        </div>
		                                        <hr />
		                                        
		                                        
		                                        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Contact No</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getPhone() %>
		                                            </div>
		                                        </div>
		                                        <hr />
		                                        
		                                        
	                             		        <div class="row">
		                                            <div class="col-sm-3 col-md-2 col-5">
		                                                <label style="font-weight:bold;">Registered Date</label>
		                                            </div>
		                                            <div class="col-md-8 col-6">
		                                                <%= d.getRegDate() %>
		                                            </div>
		                                        </div>

						                     </div>

												<!-- timetable content -->
				                                 <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
				                                      
				                                      
				                                   	   	<table class="table">
				
															<thead class="primary-background text-white " style="font-weight: bold;">
																<tr>
																	<th scope="col">TID</th>
																	<th scope="col">Doctor Name</th>
																	<th scope="col">Available Date</th>
																	<th scope="col"> From</th>
																	<th scope="col">To </th>
																	<th scope="col">Day Type </th>
																	      
																</tr>
															</thead>
															
															<tbody>
																						
																<%
																	
																List<timeManagement> time = timeManagementDButill.getTimeDetailsByDocId(docID);
																		
																	for(timeManagement td:time){
																			
																		%>
																			<tr style="font-weight: bold;">
																			
																				<%	
																					int did = td.getDocId();
																					Doctors doc = timeManagementDButill.getDocDetailsByDocId(did);
																				%>
																				
																				<td><%= td.getTid() %></td>									
																				<td><%= doc.getName() %></td>
																				<td><%= td.getDate() %></td>
																				<td><%= td.getStartTime() %></td>
																				<td><%= td.getEndTime() %></td>
																				<td><%= td.getDayType() %></td>
																				
														
																												
																			</tr>
																		<% 
																		}
																	
																	%>
															
															</tbody>	
														
														</table>       
														
														<% 
																if(time.size()==0){
			
																	//if list array is emplty, then show this
																	out.println("<h3 class='display-3 text-center mt-4'>Not yet date has been allocated for this doctor...</h3>");
																	
																}                         
													                                   		
														%>
				                                    </div> <!-- ///timetable content -->
				                                    
				                                    
				                                    
				                                    
				                                </div>
		                               
		
		                                    </div>
		                                 
		                                </div>
		                                
		                                	<!-- button grop -->
						                    <div class="card-footer" style="background: #ffff">
						                    	<a href="userHome.jsp" class="btn btn-outline-primary float-left m-0">Back</a>
						                    </div>
						                    
						                    
		                            </div>
		                        </div>
		
		
		                    </div>
		                    
		                </div>
		            </div>
		        </div>
		    </div>
		</div>	

<!-- /doctor profile -->




	<!-- booking modal -->

	<!-- Modal -->
	<div class="modal fade" id="bookingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white">
	        <h5 class="modal-title" style="font-weight: bold;" id="exampleModalLabel">Make an Appointment</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="font-weight: bold;">
	    
	    
	    
	    	<form id="bookDetails" action="bookingServlet" method="post" enctype="multipart/form-data">
	    	
	    		 <div class="form-group">
				    <label for="doctorHospital">Doctor ID</label>
				    <input name="docId" type="text" class="form-control" id="docId" value="<%= d.getDid() %>" readonly="readonly">										 		
				</div>	 
				
	    		 <div class="form-group">
				    <label for="doctorHospital">Patient ID</label>
				    <input name="pId" type="text" class="form-control" id="pId" value="<%= p.getPid() %>" readonly="readonly">										 		
				</div>	    	

	    		 <div class="form-group">
				    <label for="doctorHospital">Doctor Name</label>
				    <input name="docName" type="text" class="form-control" id="docName" value="<%= d.getName() %>" readonly="readonly">										 		
				</div>	    	

	    		 <div class="form-group">
				    <label for="doctorHospital">Patient Name</label>
				    <input name="pName" type="text" class="form-control" id="pName" value="<%= p.getName() %>" readonly="readonly">										 		
				</div>	    	
				   	
	    		 <div class="form-group" >
				    <label for="doctorHospital">Patient Contact Number</label>
				    <input name="pPhone" type="text" class="form-control" id="pPhone" placeholder="Enter your Contact number" required="required">										 		
					<small  class="form-text text-muted" style="color: red !important; font-weight: bold;">Please enter your current phone number,</small>
					<small  class="form-text text-muted" style="color: red !important; font-weight: bold;">Please note that all inform is through this phone number.</small>
				</div>	  
				  	
				
				<div class="form-group">
					<label for="bDate">Booking Date & Time</label>
						<select name="bDate" class="form-control" id="bDate" required="required">
						<option selected disabled>--select available Date&Time--</option>
														      
							<!-- get doc time table details -->
							<%
														      	
							//get all time details via array list
							List<timeManagement> tdetails =  timeManagementDButill.getTimeDetailsByDocId(docID);
														      	
							//crate foreach loop and assign the value into option
								for(timeManagement tdate:tdetails){
								%>
									<option value="<%= tdate.getDate() %>"><%= "Date : " + tdate.getDate() + " " + "From : " + tdate.getStartTime() + " " + "To : " + tdate.getEndTime() %></option>
								<% 
								}
							%>
														      
						 </select>
						 
				 </div>   	
						 <small  class="form-text text-muted" style="color: red !important; font-weight: bold;">If you have any doubts about the booking, Please contact our Hotline.</small>
				   	
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary">Book Now</button>
			      </div>
	    	
	    	</form>
	    	  
	    
	      </div>
	    </div>
	  </div>
	</div>

	<!-- //booking modal -->





	<!-- include footer -->
	<%@ include file = "footer.jsp"  %>


		<!-- jquery script -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
				<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<script type="text/javascript" src="js/editdata.js"></script>
		


					
			<!-- booking -->
			<script>
			

			$(document).ready(function() {
					
			  		console.log("loading booking....");
			  		
			  		$('#bookDetails').on("submit", function(evenet) {
						
						evenet.preventDefault();
						
						let form = new FormData(this);
						
						//now requestiong to server
						$.ajax({
							
							url: "bookingServlet",
							type: 'POST',
							data: form,
							success: function(data, textStatus, jqXHR) {
								
								//console.log(data);
								
								if(data.trim() == "done"){
									
									new swal("Good job!", "Booking Successfully!", "success")
									.then((value) => {
									  window.location="userHome.jsp"
									});
									
								}else{
									new swal("Error!", data , "error");
								}
								
							},
							error: function (jqXHR, textStatus, errorThrown) {
								//console.log(data);
								new swal("Error!", "Something went wrong !, Try Again..", "error");
							},
								processData: false,
								contentType: false
							
						});//ajax end
						
			  		});//end fun	
			  		
			  		
				});//end main
			
			</script>
		



</body>
</html>