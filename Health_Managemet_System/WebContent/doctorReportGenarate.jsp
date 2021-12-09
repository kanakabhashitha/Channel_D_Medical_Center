<%@page import="java.util.Optional"%>
<%@page import="com.medical.entities.docCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.Doctors"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
  	  //int sortData = Integer.parseInt(request.getParameter("doctorSpecies"));
  	  int sortData = Integer.parseInt(request.getParameter("doctorSpecies"));
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>generate report</title>
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


		  		<div class="container btn-area" style="background: #f2f2f2; margin-top: 20px; margin-bottom: 20px; padding: 20px;">
					
					<a href="adminPanel.jsp" type="button" class="btn btn-primary" ><span><i class="fas fa-chevron-left"></i></span> Go Back</a>
					<button type="button" class="btn btn-primary" onclick="getReportByDocCatgory()" style="margin-left: 20px" > <span><i class="fas fa-print"></i> </span>  Generate Report</button>
					

				</div>
				
			<!-- doc list doctor -->
		  	<div class="container mt-3 mb-3" id="printCatDetailsArea">
		  	
		  	<!-- logo area -->
		  		<div class="container row" style="margin-bottom: 30px">
		  					  			
		  			<div class="col-4">
		  				<div style="color: #0077c2">
							<i class="fab fa-medrt fa-6x"></i>
						</div>
						
						 <div style="margin-top: 10px; margin-bottom: 20px; color: #0077c2; font-weight: bold;">
                    		<h4>Chanel D Medical Center</h4>
                		 </div>
		  			</div>
		  			
		  			<div class="col-8">
				  		<%
				  			List<docCategory> dcs = doctorDButill.getCategoryNameByCategoryID(sortData);
				  			
				  			for(docCategory dx:dcs){
								%>
				  				<h2 style="margin-top: 100px; font-weight: bold;"><%= dx.getName() +"'s "%>Doctors Report</h2>
				  				<%
				  			}
				  		%>
				  	</div>
		  		
		  		</div>
		  		<!-- //logo area -->
		  	

		  	
				  	<table class="table" id="docTable">
				  	
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
						   			List<Doctors> getByCatId = doctorDButill.getDetailsByCategoryId(sortData);
						   			
						   			
						   			
						   			if(getByCatId.size() == 0){
										
										List<Doctors> docDetails = doctorDButill.getAllDocDetails();
									
										for(Doctors doc:docDetails){
										%>
											<tr style="font-weight: bold;">
												      
												      <td><%= doc.getDid() %></td>
												      <td><img class="img-thumbnail" src="proPics/<%= doc.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
												     	<%
												     	List<docCategory> dcx = doctorDButill.getCategoryNameByCategoryID(doc.getCatid());
											      		for(docCategory dx:dcx){
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
									
						   			}else{
						   				
						   				for(Doctors dcat:getByCatId){
						   				%>
						   				
						   				<tr style="font-weight: bold;">
												      
												      <td><%= dcat.getDid() %></td>
												      <td><img class="img-thumbnail" src="proPics/<%= dcat.getImage() %>" alt="Card image cap" id="imgProfile" style="width: 80px; height: 80px"></td>
												     													     	<%
											      		for(docCategory dx:dcs){
											      		%>
											      			<td><%= dx.getName() %></td>
											      		<%
											      		}
											      		%>
												      <td><%= dcat.getName() %></td>
												      <td><%= dcat.getDescription() %></td>
												      <td><%= dcat.getHospital() %></td>
												      <td><%= dcat.getEmail() %></td>
												      <td><%= dcat.getPhone() %></td>
												      										      
																				      
											</tr>						   				
						   				
						   				<%
						   				}
						   			}
						   		
						   		%>
						      
						      


							 </tbody>
					</table>
		  	
		  	
		  	
		  	</div>
		  	<!-- end of  doctor list -->
				
				
				
				
				
		<!-- jquery script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/adminPanel.js"></script>
	

	 <!-- pdf --> 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script type="text/javascript" src="js/report.js"></script>
	
	

</body>
</html>