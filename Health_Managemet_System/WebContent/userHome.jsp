<%@page import="com.medical.dao.bookingManagementDButill"%>
<%@page import="com.medical.entities.bookConfirm"%>
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
	<title>Home page</title>
	
	<!-- boostrap cdn -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	<link rel="stylesheet" href="css/headerStyle.css" type="text/css"/>
	<link rel="stylesheet" href="css/profilecss.css" type="text/css"/>
	<link rel="stylesheet" href="css/userHomeStyle.css" type="text/css"/>
	
	
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
		      
		      
				<div class="container text-center" id="hi_text">
				
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
						      <td><input type="password"  value="<%= p.getPassword() %>" readonly="readonly" style="border: none;"></td>
						    </tr>
						    
						    <tr>
						      <th scope="row">Registerd Date&Time</th>
						      <td><%= p.getRegDate().toGMTString() %></td>
						    </tr>
						  </tbody>
					</table>				
		      </div>
		      
		      <!-- edit details -->
		      
		      
		      
		      	  <!-- user photo -->
			      <div id="pohoto_details" style="display: none;">
					
					<div class="container text-center mb-3">
						<img class="img-thumbnail"  alt="Card image cap" src="proPics/<%= p.getImage() %>" style="width: 300px; height: 300px">
					</div>
					
					<form id="editpatientProPic" action="doctorPhotoUpdate" method="post" enctype="multipart/form-data">
						<table class="table">
							<tbody>
							
							<tr style="display: none">
						      <th scope="row">patient ID</th>
						      <td> <input name="uId" type="number" class="form-control"  value="<%= p.getPid() %>" readonly="readonly"> </td>
						      
						    </tr>
						     
						      <th scope="row">Select Photo</th>
						      <td> <input name="propic" type="file" class="form-control" ></td>
					
							</tbody>
						</table>
						
						<div class="container">
						
							<button id="savePhotoButton" type="submit" class="btn btn-outline-primary float-right">Save</button>
						
						</div>			
		      		
						
					</form>
										 
		     	</div>
		      
		      
		      
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
						  
						  </tbody>
					</table>
					
						<div class="container">
						
							<button id="saveBtnForDetails" type="submit" class="btn btn-outline-primary float-right">Save</button>
						
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
		        <button id="edit_button" type="button" class="btn btn-primary">Edit Details</button>
		        <button id="edit_photo_button" type="button" class="btn btn-primary">Edit Photo</button>
		      </div>
		    </div>
		  </div>
		</div>	<!-- end profile model -->
	
	
	
	<!-- booking log  -->
	<div>
	
		<!-- Modal -->
		<div class="modal fade bd-example-modal-lg" id="bookingLogModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content ">
		      <div class="modal-header primary-background text-white" style="font-weight: bold;">
		        <h5 class="modal-title" id="exampleModalLabel">My Booking Log</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		      	<div style="font-weight: bold;">
		      	
		      		<p>*When you make a reservation you can see it here after our staff confirms it.</p>
		      		<p>*Please wait until the confirmation.</p>
		      		<p>*Consider the number in red here as your booking number.</p>
		      		<p>*If you have any doubt about reservation, Please contact our Hotline.</p>
		      	
		      	</div>
		      
		  			<table class="table">
				  	
						  <thead class="primary-background text-white " style="font-weight: bold;">
						    <tr>
						      <th scope="col">Number</th>
						      <th scope="col">Doctor</th>
						      <th scope="col">Patient </th>
						      <th scope="col">Contact </th>
						      <th scope="col">Date&Time</th>
						      <th scope="col">Cancel Booking</th>
						    </tr>
						  </thead>
						  
						  <tbody>					    
						   
						      
						      
								<%
									int pid = p.getPid();
									ArrayList<bookConfirm> bookConf = bookingManagementDButill.getAllConfirmBookingDetailsByPid(pid);
								
									for(bookConfirm b:bookConf){
									%>	
										<tr style="font-weight: bold;">
											      
											   	  <td style="color: red"><%= b.getbId() %></td>
											      <td><%= "Dr. " + b.getDocName() %></td>
											      <td><%= b.getpName() %></td>
											      <td><%= b.getPhone() %></td>
											      <td><%= b.getBookDateTime() %></td>
											      
											      <td>
											      	<div class="container text-center">
											      					  
											      		<a href="#" onclick="getBookIDForDelete(<%= b.getbId() %>)" class="btn btn-danger " type="button"><i class="far fa-trash-alt"></i></a>
																				      	
											      	</div>
											      </td>
											      
																			      
											   </tr>
					
									<%	
									}
								%>

							 </tbody>
					</table>
					
					<%
										
						if(bookConf.size()==0){
											
							//if list array is emplty, then show this
							out.println("<h5 class='display-4 text-center mt-4'>You have no bookings are availabel here...</h5>");
									
						}
										
					%>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
	</div>
	<!--// booking log  -->

	
	
	
	
	<!-- Carousel -->
	
		<div class="container-fluid p-0">
		
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				  </ol>
				  
				  <div class="carousel-inner">
				  
				    <div class="carousel-item active">
				      <img class="d-block w-100" src="./img/1.jpg" alt="First slide">
				      
				        <div class="carousel-caption d-none d-md-block" style="transform: translateX(-40%); margin-bottom: 110px;">
					    	<h1>THE BEST DOCTORS </h1>
					    	<h1>AT YOUR SERVICE.</h1>
     					</div>
				      
				    </div>
				    
				    <div class="carousel-item">
				      <img class="d-block w-100" src="./img/2.jpg" alt="Second slide">
				      
				       <div class="carousel-caption d-none d-md-block"  style="transform: translateX(-50%); margin-bottom: 90px;">
					    	<h1>SERVING</h1>
					    	<h1>INTERNATIONAL</h1>
					    	<h1>PATIENTS</h1>
     					</div>
				      
				    </div>
				    
				    <div class="carousel-item">
				      <img class="d-block w-100" src="./img/3.jpg" alt="Third slide" >
				      
				      	<div class="carousel-caption d-none d-md-block "  style="transform: translateX(-30%); margin-bottom: 90px;">
					    	<h1>CARE.</h1>
					    	<h1>QUALITY.</h1>
							<h1>PRECISION.</h1>
     					</div>
				      
				    </div>
				    
				    <div class="carousel-item">
				      <img class="d-block w-100" src="./img/4.jpg" alt="Third slide">
				      
				      	<div class="carousel-caption d-none d-md-block" style="transform: translateX(-35%); margin-bottom: 250px;">
					    	<h1>YOUR TRUST.</h1>
							<h1>OUR LIFELINE.</h1>
     					</div>
				      
				    </div>
				    
				  </div>
				  
				  
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
			</div>
						
		
		</div>
	
	<!--// Carousel -->
	
	
	
	
	
	
	<!-- welcome note -->
	
	<div class="container text-center mt-4 mb-4" style="font-weight: bold;">
		
		<p>WELCOME TO</p>
		<h3 style="color: #1e88e5 ">CHANEL D MEDICAL CENTER</h3>
		<p>Chanel D Medical Center is the most accredited hospital in the Sri Lankan healthcare sector. Since 2002, 
		Chanel D Medical Center has revolutionized the healthcare industry through infrastructure development and 
		advancement of products and services, with a view to deliver healthcare that is on par with global 
		medical standards. </p>
	
	</div>
	
	<!-- /// welcome note -->
	
	
	
	<!-- service  tag-->
	<div class="container" style="margin-top: 100px; margin-bottom: 100px; ">
	
		<div class="row">
			
			<div class="col-4 s-content">
				
				<div class="s-minititel">
					<p>Services</p>
				</div>
				
				<div class="s-titel">
				
					<p>ensuring the best <br>
						in the industry</p>			
				
				</div>
				
				<div class="s-details">
					<p>Chanel D Medical Center is committed to provide compassionate care and excellent service that transcends conventional healthcare.</p>					
				</div>
				
				<div>
				
					<button class="button button4"><span><i class="fas fa-user-md"></i></span>  SERVICES</button>
					
				</div>
				
				
			</div>
			
			<div class="col-8 s-image">
				<img alt="service" src="./img/5.jpg" class="hover-shadow">			
			</div>
			
		</div>
	
	</div>
	<!-- //service  tag-->
	
	
	
	<!-- service tag line -->
	
		<div class="container-fluid tagline">
			
			<div class="row text-center">
			
				<div class="col-3">
					
					<img class="tagline-img"  alt="tagline" src="./img/t1.png">
					<p class="tagline-titel">More Than 7500</p>
					<p class="tagline-details">Pediatric and adult Cardiac Surgeries</p>			
				</div>	
							
				<div class="col-3" >
					<img class="tagline-img" alt="tagline" src="./img/t2.png">
					<p class="tagline-titel">Over 100</p>
					<p class="tagline-details">Cochlear Implants</p>			
				</div>	
							
				<div class="col-3" >
					<img class="tagline-img" alt="tagline" src="./img/t3.png">
					<p class="tagline-titel">Over 1250</p>
					<p class="tagline-details">IVF babies</p>				
				</div>	
							
				<div class="col-3" >
					<img class="tagline-img"  alt="tagline" src="./img/t4.png">
					<p class="tagline-titel">Over 1000</p>
					<p class="tagline-details">Kidney Transplants</p>	
				</div>				
			
			</div>
		
		</div>
	
	<!-- //service tag line -->
	
	
	
	<!-- service image slider -->
	
		<div class="container service-sider">
		
			<div class="row">
			
				<div class="col-9">
					
					<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner">
					    
					    <div class="carousel-item active">
					      <img class="d-block w-100" src="./img/s1.jpg" alt="First slide">
					    	  
					    	  <div class="carousel-caption d-none d-md-block cCaption ">
					    	  	<p class="st">Welcome to Healthy Life Clinic</p>
							   <p>We are a team of leading GPs and specialists who have come together to provide patient-centred,
									 family-oriented medical services for Sri Lanka. Our team also includes nurse practitioners, 
									nutritionists, physiotherapists and other healthcare staff so that you can treat many health concerns at a single destination</p>
							  </div>
							  
					    </div>
					    
					    <div class="carousel-item">
					      <img class="d-block w-100" src="./img/s2.jpg" alt="Second slide">
					    
					    	<div class="carousel-caption d-none d-md-block cCaption ">
					    	  	<p class="st">Diabetes Care</p>
							    <p>
									Healthy Life Clinic has been helping patients fight and manage diabetes since 2005. 
									Whether you are newly diagnosed or have had diabetes for some time, you have come to the right place. Our multi-disciplinary
									 approach educates and empowers you to manage diabetes.</p>
							  </div>
					    
					    </div>
					    
					    <div class="carousel-item">
					      <img class="d-block w-100" src="./img/s3.jpg" alt="Third slide">
					  
					    	  <div class="carousel-caption d-none d-md-block cCaption ">
					    	  	<p class="st">Corporate Health</p>
							    <p>We work with companies to provide employee healthcare, and we also educate employees on how to take care of their health at work. 
									Think of us as the polar opposite of an insurance company or a hospital – rather than coming to us when someone falls sick, we come and visit you!</p>
							  </div>
					  
					    </div>
					  
					  </div>
					</div>
					
				</div>
			
			
				<div class="col-3 sBtn">
					<div class="row sBtn1">
						<a class="nav-link" href="./findDoctorsPage.jsp"> <span><i class="fas fa-stethoscope fa-3x"></i></span> Find Doctors</a>
					</div>

					<div class="row sBtn2">
						 <a class="nav-link" href="timeManagementPage.jsp"> <span><i class="fas fa-calendar-plus fa-3x"></i></span> Time Schedule</a>
					</div>
				</div>
			
			</div>
		
		</div>
	
	<!-- //service image slider -->
	
	
	<!-- other Service -->
	
		<div class="container-fluid otherServicConainer">
		
			<div class="row">
			
			
				<div class="col-3 otherSevice">
				
					  <img src="./img/o1.jpg" alt="Avatar" class="image">
					  <div class="overlay">
					    <div class="text">best cafeteria</div>
					  </div>
				
				</div>
			
				<div class="col-3 otherSevice">
				
					<img src="./img/o2.jpg" alt="Avatar" class="image">
					  <div class="overlay2">
					    <div class="text">children park</div>
					  </div>
				
				</div>
			
				<div class="col-3 otherSevice">
				
					<img src="./img/o3.jpg" alt="Avatar" class="image">
					  <div class="overlay">
					    <div class="text">vehicle park</div>
					  </div>
				
				</div>
			
				<div class="col-3 otherSevice">
				
					 <img src="./img/o4.jpg" alt="Avatar" class="image">
					  <div class="overlay2">
					    <div class="text">best health vehicle</div>
					  </div>
				</div>
			
			
			
			</div>
		
		</div>
	
	<!--// other Service -->
	
	
	<!-- include footer -->
	<%@ include file = "footer.jsp"  %>
	
	
	<!-- jquery script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/editdata.js"></script>




	<!-- when click the book log icon show the modal -->
	<script>
	    $('.blmodal').on('click', function(e){
	      e.preventDefault();
	      $('#bookingLogModal').modal('show');
	    });
  	</script>

	
	
	<!-- delete booking -->
	<script>
	
	function getBookIDForDelete(cid) {
			
			Swal.fire({
				
				  title: 'Are you sure?',
				  text: "Do you want to cancel this booking!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, cancel it!'
			
			}).then((result) => {
				if (result.isConfirmed) {
					
					$.ajax({
						
						//goto jsp page
						url : "bookingDeleteServlet",
						type: 'POST',
						data: {cId: cid},
						success: function (data, textStatus, jqXHR) {
							
							 Swal.fire('Cancel Done!', '', 'success')
							 .then((result) => {
									
									if (result.isConfirmed) {
						  				
										
											if(data.trim() == "done"){
											
													window.location="userHome.jsp"
												
											}else{
												new swal(data);
												
											}
							   
											
										}
									});
							
						}
						
					});//ajax end
					
					
				} 
				
										
			});//swal end
			
		}//fun end
		
	
	</script>
	
	

	<!-- Carousel -->
	<script>
	
	
		$('.carousel').carousel({
			  interval: 3000
			})
	
	</script>
	

</body>
</html>