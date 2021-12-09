<%@page import="com.medical.dao.bookingManagementDButill"%>
<%@page import="com.medical.entities.bookConfirm"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
 	String bookStartDate = request.getParameter("bookStartDate").toString();
 	String bookEndDate = request.getParameter("bookEndDate").toString();    
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
			<button type="button" class="btn btn-primary" onclick="generateBookingDetailsReport()" style="margin-left: 20px" > <span><i class="fas fa-print"></i> </span>  Generate Report</button>
					
		</div>

		<!-- user list user -->
		  	<div class="container mt-3 mb-3" id="printbookdetailsDetals">
		  	
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

				  	<h3 style="margin-top: 105px; font-weight: bold;">Booking Report [ From <%= bookStartDate %> To <%= bookEndDate %> ]</h3>

		  			</div>
		  		
		  		</div>
		  		<!-- //logo area -->
		  	
		  	
		  	
			  <table class="table" id="bookingTable">
				
				<thead class="primary-background text-white " id="tableShow" style="font-weight: bold; display:">
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
						  
						  <tbody>					    
											   			
						     <%						     
						     	List<bookConfirm> bc = bookingManagementDButill.getbookingDetailsBydate(bookStartDate, bookEndDate);
						     	
						     	for(bookConfirm b:bc){
						     		
						     		%>
						     		<tr style="font-weight: bold;">
																					
										<td><%= b.getcId() %></td>
										<td><%= b.getbId() %></td>
										<td><%= b.getDocId() %></td>
										<td><%= b.getpId() %></td>
										<td><%= b.getDocName() %></td>
										<td><%= b.getpName() %></td>
										<td><%= b.getPhone() %></td>
										<td><%= b.getBookDateTime() %></td>
																				
									</tr>
						     		
						     		<%
						     		
						     	}
						     	
						     	if(bc.size()==0){
						     		//if list array is emplty, then show this
									%>
										<script>    
										
											document.getElementById("tableShow").style.display = "none";
										
										</script>
										
										<div class="container text-center" >
	
											<img alt="error" src="./img/error.png" class="img-fluid" style="width: 500px; height: 450px; margin: 50px">
											<h3 class="display-3">Sorry ! something went wrong...</h3>
											<br>
											
											<h2>No Found Data From <%= bookStartDate %> To <%= bookEndDate %></h2>
											
										</div>
										
									
									<%
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
	
	<script type="text/javascript" src="js/report.js"></script>
	

</body>
</html>