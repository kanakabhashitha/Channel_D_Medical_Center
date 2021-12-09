<%@page import="com.medical.dao.patientDButill"%>
<%@page import="com.medical.entities.patient"%>
<%@page import="com.medical.entities.bookConfirm"%>
<%@page import="com.medical.dao.bookingManagementDButill"%>
<%@page import="com.medical.entities.bookingManagement"%>
<%@page import="com.medical.dao.timeManagementDButill"%>
<%@page import="com.medical.entities.timeManagement"%>
<%@page import="com.medical.entities.docCategory"%>
<%@page import="javax.swing.text.html.HTML"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.Doctors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Admin Panel</title>
	
	<!-- boostrap cdn -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	<link rel="stylesheet" href="css/headerStyle.css" type="text/css"/>
	<link rel="stylesheet" href="css/admincss.css" type="text/css"/>
	
	
	<!-- font awasome icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!--font awesom CDN-->
    <script src="https://kit.fontawesome.com/2a0f6dfc30.js" crossorigin="anonymous"></script>
    
 	<!-- date and time picker css -->
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <!-- pdf js link -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    
	
</head>
<body>


	<!-- include header -->
 	<header>

        <!--contaner-->
        <div class="container mb-3">

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
                        <a href="#" class="px-2" data-toggle="modal" data-target="#profile-model"> <span> <i class="fas fa-user-circle"></i> </span>  Admin Panel</a>
                        <a href="logout.jsp" class="px-1"> <span><i class="fas fa-sign-out-alt"></i></span> Logout !</a>
                    </p>
                </div>

            </div>

        </div> <!--/contaner-->

	</header>

	<!--// include header -->

	
	<div class="container" style="max-width: 5000px">
		
		<div class="tab adminTab">
		  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">User Management</button>
		  <button class="tablinks" onclick="openCity(event, 'docMgnt')">Doctor Management</button>
		  <button class="tablinks" onclick="openCity(event, 'catManement')">Doctors Category Management</button>
		  <button class="tablinks" onclick="openCity(event, 'timeManagement')">Doctors Schedule Management</button>
		  <button class="tablinks" onclick="openCity(event, 'bookingMngt')">Booking Management 
		  <span class="ml-1"> <i class="far fa-bell fa-2x"></i> </span> 
		  <span style=" position: absolute; border-radius: 50%; background: red;color: white; padding: 2px 5px; margin-left: -9px">
		  <% 
		  ArrayList<bookingManagement> b = bookingManagementDButill.getAllBookingDetails(); 
		  out.print(b.size()); %></span> </button>
			
		
		</div>
		
		
		<!-- user management -->
		<div id="London" class="tabcontent border-light">
		
			<div class="container mt-3">
				
			<button type="button" onclick="allUsersReport()" class="btn btn-outline-light primary-background" id="#"  > <span><i class="fas fa-print"></i> </span>  Generate Report</button>
						
				<div class="float-right" style="display: inline-block;">
					  <form class="form-inline" id="searchDate" action="userReportGenarateByDate.jsp" method="post">
   						 	
   						 	<div class="form-group">
   						 		<label for="regStartDate" style="margin-right:10px;">From </label>						
								<input name="regStartDate" type="date" class="form-control" id="#"  placeholder="Enter Date" required="required">
							</div>

   						 	<div class="form-group">
   						 		<label for="regEndDate" style="margin-right:10px; margin-left: 10px">To </label>						
								<input name="regEndDate" type="date" class="form-control" id="#"  placeholder="Enter Date" required="required">
							</div>
							
    					 <button class="btn btn-primary my-2 my-sm-0" style="margin-left: 20px" type="submit">Sorting</button>
  					  </form>		
				</div>			
										
			</div>
			
			
		  
		  <div class="container mt-3" id="userTable"> 
		  <table class="table" >
		  
		  
		  		<!-- logo area -->
		  		<div class="container row" style="margin-bottom: 20px; margin-top: 30px; display: none" id="userEnable">
		  					  			
		  			<div class="col-4">
		  				<div style="color: #0077c2">
							<i class="fab fa-medrt fa-6x"></i>
						</div>
						
						 <div style="margin-top: 10px; margin-bottom: 20px; color: #0077c2; font-weight: bold;">
                    		<h4>Chanel D Medical Center</h4>
                		 </div>
		  			</div>
		  			
		  			<div class="col-8">

				  	<h3 style="margin-top: 100px; font-weight: bold;">Users Report</h3>

		  			</div>
		  		
		  		</div>
		  		<!-- //logo area -->
				  	
				<thead class="primary-background text-white " style="font-weight: bold;">
					<tr>
						<th scope="col">Patient ID</th>
						<th scope="col"> Image</th>
						<th scope="col"> Name</th>
						<th scope="col">Age</th>
						<th scope="col">Address</th>
						<th scope="col">Gender</th>
						<th scope="col">Email</th>
						<th scope="col">Password</th>
						<th scope="col">RegDate&Time</th>
					</tr>
				</thead>
						  
						  <tbody>					    
						   						      
						      
								<%
									ArrayList<patient> pDetails = patientDButill.getAllPatientdetails();
								
									for(patient pd:pDetails){
									%>	
										<tr style="font-weight: bold;">
											      
											      <td><%= pd.getPid() %></td>
											      <td><img class="img-thumbnail" src="proPics/<%= pd.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
											      <td><%= pd.getName() %></td>
											      <td><%= pd.getAge() %></td>
											      <td><%= pd.getAddress() %></td>
											      <td><%= pd.getGender() %></td>
											      <td><%= pd.getEmail() %></td>
											      <td><input type="password"  value="<%= pd.getPassword() %>" readonly="readonly" style="border: none;"> </td>
											      <td><%= pd.getRegDate() %></td>
																				      
										</tr>
					
									<%	
									}
								%>

							 </tbody>
					</table>
					
			</div>
		</div>
		<!-- //user management -->
		
		
		
		<!-- doctor Management -->
		<div id="docMgnt" class="tabcontent border-light" >
		  	
		  	<div class="container mt-3 mb-3">
		  	
				<!--  <a href="addDoctors.jsp" type="button" class="btn btn-outline-light primary-background ">++ Add Doctors ++</a> -->
					
				<button type="button" class="btn btn-outline-light primary-background"  data-toggle="modal" data-target="#addDoc" >++ Add Doctors ++</button>
		 	 	<button type="button" class="btn btn-outline-light primary-background ml-2" onclick="allDoctorsReport()" id="#"  > <span><i class="fas fa-print"></i> </span>  Generate Report</button> 
		 	 	
		 	 	<div class="float-right" style="display: inline-block;">
					  <form class="form-inline" id="sortDetails" action="doctorReportGenarate.jsp" method="post">
   						 	
   						 	<div class="form-group">
							
								<select name="doctorSpecies" class="form-control" id="doctorSpecies">
								<option value="0">Select Doctor Category</option>
														      
									<!-- get doc category details -->
									<%
														      	
										//get all category details via array list
										ArrayList<docCategory> docCatlistforSort =  doctorDButill.getAllDeoctorsCategory();
														      	
											//crate foreach loop and assign the value into option
											for(docCategory cs:docCatlistforSort){
											%>
												<option value="<%= cs.getDcid() %>"><%= cs.getName() %></option>
											<% 
											}
									 %>
														      
								</select>
							</div>
							
    					 <button class="btn btn-primary my-2 my-sm-0" style="margin-left: 20px" type="submit">Sorting</button>
  					  </form>		
					</div>
		  	
		  	</div>
		  	
			  	
		  	<!-- doc list doctor -->
		  	<div class="container mt-3 mb-3" id="docTable">
		  	
			<!-- logo area -->
		  		<div class="container row" style="margin-bottom: 20px; margin-top: 30px; display:none " id="doctorEnable">
		  					  			
		  			<div class="col-4">
		  				<div style="color: #0077c2">
							<i class="fab fa-medrt fa-6x"></i>
						</div>
						
						 <div style="margin-top: 10px; margin-bottom: 20px; color: #0077c2; font-weight: bold;">
                    		<h4>Chanel D Medical Center</h4>
                		 </div>
		  			</div>
		  			
		  			<div class="col-8">

				  	<h3 style="margin-top: 100px; font-weight: bold;">Doctors Report</h3>

		  			</div>
		  		
		  		</div>
		  		<!-- //logo area -->
		  	
		  			<!-- admin table -->
				  	<table class="table" style="display: " id="docAminTable">
				  	
						  <thead class="primary-background text-white " style="font-weight: bold;">
						    <tr>
						      <th scope="col">ID</th>
						      <th scope="col">Image</th>
						      <th scope="col">Category Name</th>
						      <th scope="col">Name</th>
						      <th scope="col">Description</th>
						      <th scope="col">Hospital</th>
						      <th scope="col">Email</th>
						      <th scope="col">Contact</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  
						  <tbody>					    
						   
						      
						      
								<%
									List<Doctors> docDetails = doctorDButill.getAllDocDetails();
								
									for(Doctors doc:docDetails){
									%>	
																   <tr style="font-weight: bold;">
											      
											      <td><%= doc.getDid() %></td>
											      <td><img class="img-thumbnail" src="proPics/<%= doc.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
											      <%
											      	List<docCategory> dcs = doctorDButill.getCategoryNameByCategoryID(doc.getCatid());
											      	for(docCategory dx:dcs){
											      		%>
											      			<td><%= dx.getName() %></td>
											      		<%
											      	}
											      %>
											      <td><%= doc.getName() %></td>
											      <td><%= doc.getDescription() %></td>
											      <td><%= doc.getHospital() %></td>
											      <td><%= doc.getEmail() %></td>
											      <td><%= doc.getPhone() %></td>
											      
											      <td>
											      	<div class="container text-center mr-4">
											      		
											      		<a href="#EditModel"  
											      		
											      		data-id="<%= doc.getDid() %>" 
											      		data-pro= "proPics/<%= doc.getImage() %>"
											      		data-name="<%= doc.getName() %>" 
											      		data-description="<%= doc.getDescription() %>"
											      		data-hospital="<%= doc.getHospital() %>"
											      		data-email="<%= doc.getEmail() %>"
											      		data-phone="<%= doc.getPhone() %>"
											      		data-reg="<%= doc.getRegDate() %>"
											      		data-Def="<%= doc.getImage() %>"									      		
											      		
											      		class="btn btn-warning" type="button" data-toggle="modal" data-target="#EditModel"><i class="fas fa-pen"></i></a>
											   											  
											      		<a href="#" onclick="getDocID(<%= doc.getDid() %>)" class="btn btn-danger " type="button"><i class="far fa-trash-alt"></i></a>
																				      	
											      	</div>
											      </td>
											      
																			      
											   </tr>
					
									<%	
									}
								%>

							 </tbody>
					</table>
		  			<!-- //admin table -->



		  			<!-- report table -->
				  	<table class="table" style="display:none " id="docPrintTable">
				  	
						  <thead class="primary-background text-white " style="font-weight: bold;">
						    <tr>
						      <th scope="col">ID</th>
						      <th scope="col">Image</th>
						      <th scope="col">Category Name</th>
						      <th scope="col">Name</th>
						      <th scope="col">Description</th>
						      <th scope="col">Hospital</th>
						      <th scope="col">Email</th>
						      <th scope="col">Contact</th>
						   
						    </tr>
						  </thead>
						  
						  <tbody>					    
						   
						      
						      
								<%
								
									for(Doctors doc:docDetails){
									%>	
																   <tr style="font-weight: bold;">
											      
											      <td><%= doc.getDid() %></td>
											      <td><img class="img-thumbnail" src="proPics/<%= doc.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
											      <%
											      	List<docCategory> dcs = doctorDButill.getCategoryNameByCategoryID(doc.getCatid());
											      	for(docCategory dx:dcs){
											      		%>
											      			<td><%= dx.getName() %></td>
											      		<%
											      	}
											      %>
											      <td><%= doc.getName() %></td>
											      <td><%= doc.getDescription() %></td>
											      <td><%= doc.getHospital() %></td>
											      <td><%= doc.getEmail() %></td>
											      <td><%= doc.getPhone() %></td>
														      
																			      
											   </tr>
					
									<%	
									}
								%>

							 </tbody>
					</table>
		  			<!-- //report table -->
		  	
		  	
		  	</div>
		  	<!-- end of  doctor list -->
						  
		</div> 
		<!-- end of doctor management -->
		
			
				
		
		<!-- category management -->
			<div id="catManement" class="tabcontent border-light">
			
				<div class="container mt-3">
				
					<button type="button" class="btn btn-outline-light primary-background"  data-toggle="modal" data-target="#docCat" >++ Add Doctor Category ++</button>
					<button type="button" class="btn btn-outline-light primary-background ml-2" onclick="generateCategoryReort()" id="#"  > <span><i class="fas fa-print"></i> </span>  Generate Report</button>	
										
				</div>
				
				
				<!-- doc category list  -->
			  	<div class="container mt-3 mb-3" id="docCatTable">
			  	
			  	<!-- logo area -->
		  		<div class="container row" style="margin-bottom: 20px; margin-top: 30px; display:none " id="catEnable">
		  					  			
		  			<div class="col-4">
		  				<div style="color: #0077c2">
							<i class="fab fa-medrt fa-6x"></i>
						</div>
						
						 <div style="margin-top: 10px; margin-bottom: 20px; color: #0077c2; font-weight: bold;">
                    		<h4>Chanel D Medical Center</h4>
                		 </div>
		  			</div>
		  			
		  			<div class="col-8">

				  	<h3 style="margin-top: 100px; font-weight: bold;">Category Report</h3>

		  			</div>
		  		
		  		</div>
		  		<!-- //logo area -->
			  		
			  		<!-- admin table -->
			  		<table class="table" style="display: " id="catAdminTable" >
				
						<thead class="primary-background text-white " style="font-weight: bold;">
							<tr>
								<th scope="col">Category ID</th>
								<th scope="col">Category name</th>
								<th class="text-center" scope="col">Action</th>
								      
							</tr>
						</thead>
						
						<tbody>
													
							<%
								
							ArrayList<docCategory> docCat = doctorDButill.getAllDeoctorsCategory();
									
								for(docCategory dcat:docCat){
										
									%>
										<tr style="font-weight: bold;">
																				
											<td><%= dcat.getDcid() %></td>
											<td><%= dcat.getName() %></td>
											
											<td>
												
												<div class="container text-center">
												
													<a href="#editDocCat" 
													
														data-dcid="<%= dcat.getDcid() %>"
														data-name="<%= dcat.getName() %>"
														
													class="btn btn-warning mr-2" type="button" data-toggle="modal" data-target="#editDocCat" ><i class="fas fa-pen"></i></a>
													<a href="#" onclick="getDocCatId(<%= dcat.getDcid() %>)" class="btn btn-danger " type="button" ><i class="far fa-trash-alt"></i></a>
												
												</div>
											
											</td>
																			
										</tr>
									<% 
									}
								
								%>
						
						</tbody>	
					
					</table>
					<!-- //admin table -->  	
	
	
			  		<!-- report table -->
			  		<table class="table" style="display:none " id="catTableReport">
				
						<thead class="primary-background text-white " style="font-weight: bold;">
							<tr>
								<th scope="col">Category ID</th>
								<th scope="col">Category name</th>
								      
							</tr>
						</thead>
						
						<tbody>
													
							<%
									
								for(docCategory dcat:docCat){
										
									%>
										<tr style="font-weight: bold;">
																				
											<td><%= dcat.getDcid() %></td>
											<td><%= dcat.getName() %></td>
											
																			
										</tr>
									<% 
									}
								
								%>
						
						</tbody>	
					
					</table>
					<!-- //report table -->  	
			  	
			  	
			  	</div> <!-- end of doc cat list -->
				
			</div><!-- /category management end -->
			
			
		<!-- time management  -->
			
			<div id="timeManagement" class="tabcontent border-light">
			  
				<div class="container mt-3 mb-3">
				
					<button type="button" class="btn btn-outline-light primary-background"  data-toggle="modal" data-target="#setTimeModal" >++ Set Time Schedule ++</button>
					<button type="button" class="btn btn-outline-light primary-background ml-2" onclick="allScheduleReport()" id="#"  > <span><i class="fas fa-print"></i> </span>  Generate Report</button>
						
					<div class="float-right" style="display: inline-block;">
					  <form class="form-inline" id="sortTimeDetails" action="timeScheduleReportGenarate.jsp" method="post">
   						 	
   						 	<div class="form-group">
							
								<select name="dayCategory" class="form-control" id="dayCategory">
																						      
									<option selected disabled>--select day type--</option>					      						   
									<option value="weekday">Weekday</option>
									<option value="weekend">Weekend</option>
									<option value="special day">Special Day</option>
														      
								</select>
							</div>
							
    					 <button class="btn btn-primary my-2 my-sm-0" style="margin-left: 20px" type="submit">Sorting</button>
  					  </form>		
					</div>	
						
								
				</div>
			
			
				<!-- time details -->
				<div class="container" id="timeTable">
				
				<!-- logo area -->
		  		<div class="container row" style="margin-bottom: 20px; margin-top: 30px; display:none " id="timeEnable">
		  					  			
		  			<div class="col-4">
		  				<div style="color: #0077c2">
							<i class="fab fa-medrt fa-6x"></i>
						</div>
						
						 <div style="margin-top: 10px; margin-bottom: 20px; color: #0077c2; font-weight: bold;">
                    		<h4>Chanel D Medical Center</h4>
                		 </div>
		  			</div>
		  			
		  			<div class="col-8">

				  	<h3 style="margin-top: 100px; font-weight: bold;">Doctors Schedule Report</h3>

		  			</div>
		  		
		  		</div>
		  		<!-- //logo area -->
					
					<!-- admin table -->
					<table class="table" style="display: " id="tableAdmin">
				
						<thead class="primary-background text-white " style="font-weight: bold;">
							<tr>
								<th scope="col">TID</th>
								<th scope="col">Doctor Image</th>
								<th scope="col">Doctor Name</th>
								<th scope="col">Available Date</th>
								<th scope="col">From</th>
								<th scope="col">To</th>
								<th scope="col">Day Type </th>
								<th class="text-center" scope="col">Action</th>
								      
							</tr>
						</thead>
						
						<tbody>
													
							<%
								
							ArrayList<timeManagement> time = timeManagementDButill.getAllDeoctorsTimedetails();
									
								for(timeManagement td:time){
										
									%>
										<tr style="font-weight: bold;">
										
											<%	
												int did = td.getDocId();
												Doctors doc = timeManagementDButill.getDocDetailsByDocId(did);
											%>
											
											<td><%= td.getTid() %></td>									
											<td><img class="img-thumbnail" src="proPics/<%= doc.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
											<td><%= doc.getName() %></td>
											<td><%= td.getDate() %></td>
											<td><%= td.getStartTime() %></td>
											<td><%= td.getEndTime() %></td>
											<td><%= td.getDayType() %></td>
											
											<td>
												
												<div class="container text-center">
												
													<a href="#editTimeModal" 
													
														data-tcid="<%= td.getTid() %>"
														data-image="proPics/<%= doc.getImage() %>"
														data-dname="<%= doc.getName() %>"
														data-gdate="<%= td.getDate() %>"
														data-gstime="<%= td.getStartTime() %>"
														data-getime="<%= td.getEndTime() %>"
														data-daytype="<%= td.getDayType() %>"
														data-docid ="<%= doc.getDid() %>"
														
													class="btn btn-warning mr-2" type="button" data-toggle="modal" data-target="#editTimeModal"><i class="fas fa-pen"></i></a>
													<a href="#" onclick="getTimtableId(<%= td.getTid() %>)" class="btn btn-danger " type="button" ><i class="far fa-trash-alt"></i></a>
												
												</div>
											
											</td>
																			
										</tr>
									<% 
									}
								
								%>
						
						</tbody>	
					
					</table>	
					<!-- //admin table -->
					
					
					<!-- print table -->
					<table class="table" style="display:none " id="tableprint">
				
						<thead class="primary-background text-white " style="font-weight: bold;">
							<tr>
								<th scope="col">TID</th>
								<th scope="col">Doctor Image</th>
								<th scope="col">Doctor Name</th>
								<th scope="col">Available Date</th>
								<th scope="col">From</th>
								<th scope="col">To</th>
								<th scope="col">Day Type </th>
								      
							</tr>
						</thead>
						
						<tbody>
													
							<%
								
							for(timeManagement td:time){
										
									%>
										<tr style="font-weight: bold;">
										
											<%	
												int did = td.getDocId();
												Doctors doc = timeManagementDButill.getDocDetailsByDocId(did);
											%>
											
											<td><%= td.getTid() %></td>									
											<td><img class="img-thumbnail" src="proPics/<%= doc.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
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
					<!-- //print table -->
					
					
					
				</div>
				<!-- //time details -->
			
			</div>
			
			<!-- //end of time management -->
			
		<!-- booking management -->
			<div id="bookingMngt" class="tabcontent border-light">
			  
			<div class=" container mt-3">
			
			  <nav>
			  <div class="nav nav-tabs" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active " style="font-weight: bold;" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">New Booking</a>
			    <a class="nav-item nav-link" style="font-weight: bold;" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Confirmed Booking</a>
			  </div>
			</nav>
			
			
			<div class="tab-content" id="nav-tabContent">
			  
			  <!-- before confirmation -->
			  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			  
			  	
			  		<div class="container mt-4">
			  	
			  	
			  			<table class="table" >
			  			
				
							<thead class="primary-background text-white " style="font-weight: bold;">
								<tr>
									<th scope="col">Booking ID</th>
									<th scope="col">Doctor ID</th>
									<th scope="col">Patient ID</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Contact Number</th>
									<th scope="col">Booking Date</th>
									<th class="text-center" scope="col">Action</th>
									      
								</tr>
							</thead>
							
							<tbody>
														
								<%
									
								ArrayList<bookingManagement> book = bookingManagementDButill.getAllBookingDetails();
										
									for(bookingManagement bk:book){
											
										%>
											<tr style="font-weight: bold;">
																					
												<td><%= bk.getbId() %></td>
												<td><%= bk.getDocId() %></td>
												<td><%= bk.getpId() %></td>
												<td><%= bk.getDocName() %></td>
												<td><%= bk.getpName() %></td>
												<td><%= bk.getPhone() %></td>
												<td><%= bk.getBookDateTime() %></td>
												
												<td>
													
													<div class="container text-center mr-4">
													
														<a href="#" onclick="getBookIDFroConfirm(<%= bk.getbId() %>)" class="btn btn-success mr-2" type="button" > <span><i class="fas fa-check"></i></span> Confirm </a>
														<a href="#" onclick="getBookIDForDelete(<%= bk.getbId() %>)" class="btn btn-danger " type="button" ><span><i class="far fa-times-circle"></i></span>Reject</a>
													
													</div>
												
												</td>
												
												
												
																				
											</tr>
												
											
										<% 
										}
									
									
									%>
									

							</tbody>	
						
					</table>
			  	
			  		</div>	
			  			  
			  			<%
										
							if(book.size()==0){
											
								//if list array is emplty, then show this
								out.println("<h3 class='display-3 text-center mt-4'>No booking are availabel here...</h3>");
									
							}
										
						%>
			  
			  </div>
			  <!-- //before confirmation -->
			  
			  
			  <!-- after confirmation -->
			  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			  
			  <div class="container mt-3">
				
				<button type="button" class="btn btn-outline-light primary-background" onclick="allBokkinDetails()" id="#"  > <span><i class="fas fa-print"></i> </span>  Generate Report</button>
				
				<div class="float-right" style="display: inline-block;">
				  <form class="form-inline" id="searchDate" action="bookingReportGenarateByDate.jsp" method="post">
   						 	
   					 	<div class="form-group">
   					 		<label for="bookStartDate" style="margin-right:10px;">From </label>						
							<input name="bookStartDate" type="text" class="form-control" id="datepicker5"  placeholder="MM/DD/YYYY" required="required">
						</div>

   					 	<div class="form-group">
   					 		<label for="bookEndDate" style="margin-right:10px; margin-left: 10px">To </label>						
							<input name="bookEndDate" type="text" class="form-control" id="datepicker6"  placeholder="MM/DD/YYYY" required="required">
						</div>
							
    				 <button class="btn btn-primary my-2 my-sm-0" style="margin-left: 20px" type="submit">Sorting</button>
  				  </form>		
				</div>
										
			 </div>
			  
			  	<div class="container mt-4" id="bookingTable">
			  	
			  	
			  	<!-- logo area -->
		  		<div class="container row" style="margin-bottom: 20px; margin-top: 30px; display:none " id="bookEnable">
		  					  			
		  			<div class="col-4">
		  				<div style="color: #0077c2">
							<i class="fab fa-medrt fa-6x"></i>
						</div>
						
						 <div style="margin-top: 10px; margin-bottom: 20px; color: #0077c2; font-weight: bold;">
                    		<h4>Chanel D Medical Center</h4>
                		 </div>
		  			</div>
		  			
		  			<div class="col-8">

				  	<h3 style="margin-top: 100px; font-weight: bold;">Booking Report</h3>

		  			</div>
		  		
		  		</div>
		  		<!-- //logo area -->
			  	
			  			<!-- admin table -->
			  			<table class="table" style="display: " id="bookAdmin">
				
							<thead class="primary-background text-white " style="font-weight: bold;">
								<tr>
									<th scope="col">Confirm ID</th>
									<th scope="col">Booking ID</th>
									<th scope="col">Doctor ID</th>
									<th scope="col">Patient ID</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Contact Number</th>
									<th scope="col">Booking Date</th>
									<th class="text-center" scope="col">Action</th>
									      
								</tr>
							</thead>
							
							<tbody>
														
								<%
									
								ArrayList<bookConfirm> bookConf = bookingManagementDButill.getAllConfirmBookingDetails();
										
									for(bookConfirm bkc:bookConf){
											
										%>
											<tr style="font-weight: bold;">
																					
												<td><%= bkc.getcId() %></td>
												<td><%= bkc.getbId() %></td>
												<td><%= bkc.getDocId() %></td>
												<td><%= bkc.getpId() %></td>
												<td><%= bkc.getDocName() %></td>
												<td><%= bkc.getpName() %></td>
												<td><%= bkc.getPhone() %></td>
												<td><%= bkc.getBookDateTime() %></td>
												
												<td>
													
													<div class="container text-center mr-4">
													
														<a href="#bookingModal"
														
															data-cid="<%= bkc.getcId() %>"
															data-bid="<%= bkc.getbId() %>"
															data-did="<%= bkc.getDocId() %>"
															data-pid="<%= bkc.getpId() %>"
															data-docname="<%= bkc.getDocName() %>"
															data-pname="<%= bkc.getpName() %>"
															data-phone="<%= bkc.getPhone() %>"
															data-bdate="<%= bkc.getBookDateTime() %>"
														
														 class="btn btn-warning mr-2" type="button" data-toggle="modal" data-target="#bookingModal"><i class="fas fa-pen"></i></a>
														<a href="#" onclick="getBookIDForDelete(<%= bkc.getcId() %>)" class="btn btn-danger " type="button" ><i class="far fa-trash-alt"></i></a>
													
													</div>
												
												</td>
																				
											</tr>
										<% 
										}
									
									%>
							
							</tbody>	
						
						</table>
			  			<!-- //admin table -->



			  			<!-- print table -->
			  			<table class="table" style="display:none " id="bookprint">
				
							<thead class="primary-background text-white " style="font-weight: bold;">
								<tr>
									<th scope="col">Confirm ID</th>
									<th scope="col">Booking ID</th>
									<th scope="col">Doctor ID</th>
									<th scope="col">Patient ID</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Patient Name</th>
									<th scope="col">Contact Number</th>
									<th scope="col">Booking Date</th>
								
									      
								</tr>
							</thead>
							
							<tbody>
														
								<%
									
										
									for(bookConfirm bkc:bookConf){
											
										%>
											<tr style="font-weight: bold;">
																					
												<td><%= bkc.getcId() %></td>
												<td><%= bkc.getbId() %></td>
												<td><%= bkc.getDocId() %></td>
												<td><%= bkc.getpId() %></td>
												<td><%= bkc.getDocName() %></td>
												<td><%= bkc.getpName() %></td>
												<td><%= bkc.getPhone() %></td>
												<td><%= bkc.getBookDateTime() %></td>
												
																				
											</tr>
										<% 
										}
									
									%>
							
							</tbody>	
						
						</table>
			  			<!-- //print table -->
			  	
			  	
			  		</div>		  
			  
			  </div>
			  <!-- //after confirmation -->
			  
			</div>
			  	
			  
			 </div>
			  
			</div>
			<!-- //booking management -->


	</div>		
	
	
	
	
	
	
<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->	
	<!-- All model of admin panel -->
	
	
	<!-- add doctor -->
		  	
		  		<div class="container">
		  		
		  			<!-- Modal addDoc -->
						<div class="modal fade" id="addDoc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header primary-background text-white">
						        <h5 class="modal-title " style="font-weight: bold;" id="exampleModalLabel">Add Doctors</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body " style="font-weight: bold;">
						      
						      	
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
													  
															     
														      <div class="modal-footer">
														        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
														        <button id="saveBtn" type="submit" class="btn btn-primary">Add Doctor</button>
														      </div>
																		  
													</form>
																	        
						      </div>
						 						      
						    </div>
						  </div>
						</div> <!-- model end -->
		  					  		
		  		</div>
		  	
		  	<!-- end of add doctor -->
	
	
	
	
	<!-- edit model  doctor  -->
	
			<!-- Modal -->
			<div class="modal fade"  id="EditModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Edit Doctor Profile</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      
			      <div class="modal-body">
			      
			      <!-- poster -->
			      <div id="poster_details">
					
					<div class="container text-center mb-3">
						<img class="img-thumbnail"  alt="Card image cap" id="my_image" style="width: 300px; height: 300px">
					</div>
					
					<form id="editDocProPic" action="doctorPhotoUpdate" method="post" enctype="multipart/form-data">
						<table class="table">
							<tbody>
							
							<tr style="display: none">
						      <th scope="row">Doctor ID</th>
						      <td> <input name="d_id" type="number" class="form-control" id="d_id"  value="d_id" readonly="readonly"> </td>
						      
						    </tr>
						     
						      <th scope="row">Select Photo</th>
						      <td> <input name="my_image" type="file" class="form-control" ></td>
					
							</tbody>
						</table>
						
						<div class="container">
						
							<button id="saveBtn" type="submit" class="btn btn-outline-primary float-right">Save</button>
						
						</div>			
		      		
						
					</form>
										 
		     	</div>
			      		      
			    <div id="edit_details" style="display: none;">
			        
			      	<form id="editDocDetails" action="editDoctorDetailsServlet" method="post" enctype="multipart/form-data">
			      	
			      	
			      	
			        <table class="table">
			        
			        	<tbody>
			        	<tr>
						    <th scope="row">Doctor ID</th>
						    <td> <input name="d_id" type="text" class="form-control" id="d_id" readonly="readonly" value=" d_id"> </td>
						      
						</tr>
			        
			        	<tr>
			        		<th>Doctor Name</th>
			        		<td><input name="d_name" type="text" class="form-control" id="d_name"  value="d_name"></td>
			        	
			        	</tr>
			        	
			        	<tr>	
			        		<th>Description</th>
			        		<td><textarea name="d_des" rows="3" cols="5" class="form-control" id="d_des" value="d_des" ></textarea></td>
			        	</tr>
				
			        	<tr>	
			        		<th>Email</th>
			        		<td><input name="d_email" type="text" class="form-control" id="d_email"  value="d_email"></td>
			        	
			        	</tr>
				
			        	<tr>	
			        		<th>Working Place</th>
			        		<td><input name="d_hospital" type="text" class="form-control" id="d_hospital"  value="d_hospital"></td>
			        	
			        	</tr>
				
			        	<tr>	
			        		<th>Contact</th>
			        		<td><input name="d_phone" type="number" class="form-control" id="d_phone"  value="d_phone"></td>
			        	
			        	</tr>
				
			        	<tr>	
			        		<th>Reg Dtae</th>
			        		<td><input name="d_reg" type="text" class="form-control" readonly="readonly" id="d_reg"  value="d_reg"></td>
			        	
			        	</tr>
							
			
			        
			     		</tbody>
			      		
			      	</table>	
			      		        
			      <div class="container">
			        <button id="saveBtn" type="submit" class="btn btn-outline-primary float-right">Save changes</button>
			      </div>
			     </form>
			     
			     </div>
			    </div>  
			      
			  <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button id="edit_button" type="button" class="btn btn-primary">Edit Details</button>
		      </div>
			      
			    </div>
			  </div>
		</div> 
		<!-- end of doc edit model -->
		
		
		
		<!-- add category -->
		<!-- Modal -->
			<div class="modal fade" id="docCat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white" style="font-weight: bold;">
			        <h5 class="modal-title " id="exampleModalLabel">Add Doctor Category</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" style="font-weight: bold;">
						
						<form id="addDocCat" action="addDocCategoeryServlet" method="post">
				
							<div class="form-group">
								<label for="catName">Doctor Category Name</label>
								<input name="catName" type="text" class="form-control" id="catName"  placeholder="Enter doctor Category Name" required="required">
								<small id="emailHelp" class="form-text text-muted">Cannot add already available category</small>
							 </div>
						
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="submit" class="btn btn-primary">Add category</button>
						      </div>
						
						</form>		        
	
			      </div>
			    </div>
			  </div>
			</div><!-- end model -->
				

	<!-- doc category edit -->
	<div class="container">
	
		<!-- Modal -->
			<div class="modal fade" id="editDocCat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white" style="font-weight: bold;">
			        <h5 class="modal-title" id="exampleModalLabel">Edit Doctor Category</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      
			       
				       <form id="editDocCategory" action="editDocCategoryServlet" method="post" enctype="multipart/form-data"> 
				       
					       	<table class="table" style="font-weight: bold;">
					        
					        	<tbody>
					        	<tr>
								    <th scope="row">Category ID</th>
								     <td><input name="c_id" type="text" class="form-control" readonly="readonly" id="c_id"  value="c_id"></td>
								</tr>
					        
					        	<tr>
					        		<th>Category Name</th>
					        		<td> <input name="c_name" type="text" class="form-control" id="c_name"  value="c_name"></td>
					        	
					        	</tr>
					        	       
					     		</tbody>
					      		
					      	</table>	
				       
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					       		<button type="submit" class="btn btn-primary">Save changes</button>
					      	</div>
					       
				       
				       </form>
				       	
				   </div>
				 </div>
			  </div>
			</div> <!-- modal end -->
	
	</div> <!-- end of doc cat edit -->

	

	<!-- add time -->
	
		<div class="container">
		
			<!-- Modal -->
			<div class="modal fade" id="setTimeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white" style="font-weight: bold;">
			        <h5 class="modal-title" id="exampleModalLabel">Set Date & Time</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" style="font-weight: bold;">
			      
			      
			      	<form id="setTimeMngt" action="addTimeServlet" method="post" enctype="multipart/form-data">
			      	
			      		
							<div class="form-group">
								<label for="setDate">Set Date</label>
								<input name="setDate" type="text" class="form-control" id="datepicker"  placeholder="MM/DD/YYYY" required="required">
							</div>
							
							<div class="form-group">
								<label for="setTimeStart">From</label>
								<input name="setTimeStart" type="text" class="form-control" id="timepicker"  placeholder="HH:MM" required="required">
							</div>

							<div class="form-group">
								<label for="setTimeEnd">To</label>
								<input name="setTimeEnd" type="text" class="form-control" id="timepicker3"  placeholder="HH:MM" required="required">
							</div>
							 
 							<div class="form-group">
								<label for="dayType"> Day Type</label>
								<select name="dayType" class="form-control" id="dayType" required="required">
									
									<option selected disabled>--select day type--</option>					      						   
									<option value="weekday">Weekday</option>
									<option value="weekend">Weekend</option>
									<option value="special day">Special Day</option>
															    
								</select>
							</div>

							<div class="form-group">
								<label for="docName"> Doctor Name</label>
									<select name="docName" class="form-control" id="docName" required="required">
										<option selected disabled>--select doctor name--</option>
														      
											<!-- get doc details -->
											<%
														      	
												//get all doctors details via  list
												List<Doctors> getDocDetails = doctorDButill.getAllDocDetails();
														      	
												//crate foreach loop and assign the value into option
												for(Doctors doc:getDocDetails){
												%>
													<option value="<%= doc.getDid() %>"><%= doc.getName() %></option>
												<% 
												}
												%>			      
								 </select>
							</div>
														  
														  
					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button type="submit" class="btn btn-primary">Save changes</button>
					      </div>
				
			      	</form>
			        
			      </div>
			    </div>
			  </div>
			</div>
		
		</div>

	<!-- end of add time -->


	<!-- edit time management -->
	
		<div class="container">

			<!-- Modal -->
			<div class="modal fade" id="editTimeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">Update Time Schedule</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      

			      
			      <div class="modal-body">
			        
			        			      
			        
			   		<div class="container text-center">					
					
					<img alt="@d_image" id="d_image"  style="max-width:150px; border-radius:50%; ">
					<br>
					<h4 class="mt-3 mb-3 font-weight-bold">Doctor Schedule</h4>
					
					</div>
	
			      		
			      
			      		<form id="editTimeDetails" action="editTmeTableDetailsServlet" method="post" enctype="multipart/form-data"> 
				       
					       	<table class="table" style="font-weight: bold;">
					        
					        	<tbody>
					        	<tr>
								    <th scope="row">Time ID</th>
								     <td>
								     	<input name="t_id" type="text" class="form-control"  id="t_id" readonly="readonly" value="t_id">
								     	<input name="t_docId" type="hidden" class="form-control"  id="t_docId"  value="t_docId">
								     </td>
								</tr>
					        
					        	<tr>
					        		<th>Doctor Name</th>
					        		<td> <input name="d_name" type="text" class="form-control" id="d_name"  value="d_name" readonly="readonly"></td>
					        	
					        	</tr>
					        
					        	<tr>
					        		<th>Available Date</th>
					        		<td> <input name="t_date" type="text" class="form-control" id="datepicker2"  value="datepicker2"></td>
					        	
					        	</tr>
					        	
					        	<tr>
					        		<th>From</th>
					        		<td> <input name="s_time" type="text" class="form-control" id="timepicker2" value="timepicker2" ></td>
					        	
					        	</tr>
					        	
					        	<tr>
					        		<th>To</th>
					        		<td> <input name="e_time" type="text" class="form-control" id="timepicker4" value="timepicker4" ></td>
					        	
					        	</tr>
					        						        	
					        	<tr>
					        	
					        		<td>
									
										<label for="dayType"> Day Type</label>
									</td>
									<td>
									<select name="dayType" class="form-control"  id="t_dayType" required="required">
										
										<option selected value="t_dayType"></option>					      						   
										<option value="weekday">Weekday</option>
										<option value="weekend">Weekend</option>
										<option value="special day">Special Day</option>
																    
									</select>
							
					        		</td>
					        	
					        	</tr>
					        	       
					     		</tbody>
					      		
					      	</table>	
				       
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					       		<button type="submit" class="btn btn-primary">Save changes</button>
					      	</div>
					       
				       
				       </form>
			      
			    </div>
			  </div>
			</div>
		</div>
	</div>
	<!-- //edit time management -->


	<!-- edit booking -->
	
	<div class="container">
	
	<!-- Modal -->
	<div class="modal fade" id="bookingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white">
	        <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Update Booking</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	        <form id="editbookingDetails" action="editbookingDetailsServlet" method="post" enctype="multipart/form-data"> 
				       
					       	<table class="table" style="font-weight: bold;">
					        
					        	<tbody>
					        	<tr>
								    <th scope="row">Confirm ID</th>
								     <td>
								     	<input name="c_id" type="text" class="form-control"  id="c_id" readonly="readonly" value="c_id">
								     </td>
								</tr>

					        	<tr>
								    <th scope="row">Book ID</th>
								     <td>
								     	<input name="b_id" type="text" class="form-control"  id="b_id" readonly="readonly" value="b_id">
								     </td>
								</tr>

					        	<tr>
								    <th scope="row">Doctor ID</th>
								     <td>
								     	<input name="d_id" type="text" class="form-control"  id="d_id" readonly="readonly" value="d_id">
								     </td>
								</tr>
					        
					        	<tr>
								    <th scope="row">Patient ID</th>
								     <td>
								     	<input name="p_id" type="text" class="form-control"  id="p_id" readonly="readonly" value="p_id">
								     </td>
								</tr>
					        
					        	<tr>
								    <th scope="row">Doctor Name</th>
								     <td>
								     	<input name="d_name" type="text" class="form-control"  id="d_name" readonly="readonly" value="d_name">
								     </td>
								</tr>
					        
					        	<tr>
								    <th scope="row">Patient Name</th>
								     <td>
								     	<input name="p_name" type="text" class="form-control"  id="p_name" readonly="readonly" value="p_name">
								     </td>
								</tr>
					        
					        	<tr>
								    <th scope="row">Contact Number</th>
								     <td>
								     	<input name="p_phone" type="text" class="form-control"  id="p_phone"  value="p_phone">
								     </td>
								</tr>
					        
					        	<tr>
								    <th scope="row">Booking Date</th>
								     <td>
								     	<input name="b_date" type="text" class="form-control"  id="b_date" readonly="readonly" value="b_date">
								     </td>
								</tr>
					        
			   
					     		</tbody>
					      		
					      	</table>	
				       
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					       		<button type="submit" class="btn btn-primary">Save changes</button>
					      	</div>
					       
				       
				       </form>
	        
	      </div>
	    </div>
	  </div>
	</div>
		
	
	</div>
	
	<!--// edit booking -->






<!-- jquery script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/adminPanel.js"></script>
	
	<!-- date and time picker js -->
	 <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
	
	 <!-- pdf --> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script type="text/javascript" src="js/report.js"></script>
	
	
	<!-- set date and time -->
    <script>
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>

   <script>
        $('#timepicker').timepicker();
    </script>

   <script>
        $('#timepicker3').timepicker();
    </script>
   <script>
        $('#timepicker4').timepicker();
    </script>




	<!-- set date and time 2 -->
    <script>
        $('#datepicker2').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>

   <script>
        $('#timepicker2').timepicker();
    </script>


	<!-- set date for search -->
    <script>
        $('#datepicker3').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>
    
     <script>
        $('#datepicker4').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>

     <script>
        $('#datepicker5').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>

     <script>
        $('#datepicker6').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>

</body>
</html>