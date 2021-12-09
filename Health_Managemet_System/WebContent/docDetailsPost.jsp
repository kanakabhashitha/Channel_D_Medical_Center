


<%@page import="java.io.PrintWriter"%>
<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.Doctors"%>
<%@page import="java.util.List"%>

<div class="row">


	<%
	
	//if we want to show loader 1sec, then container sleep using thread
	Thread.sleep(1000);
	
		//get the value from jsp page
		int cId = Integer.parseInt(request.getParameter("catid"));
		System.out.println(cId);
	
	    List<Doctors> docDetails = null;
	
		//if cid equal to 0, all data fectch
		if(cId==0){
			
			//create list and get the data with the help of getAllDocDettails method
			 docDetails = doctorDButill.getAllDocDetails();
		
		}else{		//if cid greter than 0, get value according to the value
			
			//get data by cid
			 docDetails= doctorDButill.getDetailsByCategoryId(cId);
		}
		
		//check the docters availability in catagory
		if(docDetails.size()==0){
			
			//if list array is emplty, then show this
			out.println("<h3 class='display-3 text-center mt-4'>No specialist doctors are availabel here...</h3>");
			
		}
		
	
		//assing the value usin foreach loop
		for(Doctors d:docDetails){
			
			%>
			
				<div class="col-md-6" >
				
					<!-- card -->
					<div class="card mb-4" style="width: 20rem; margin-left: 70px;">
				
						<img class="card-img-top" src="proPics/<%= d.getImage() %>" alt="Card image cap">
						
						<div class="card-body">
							
							<h3>Dr. <%= d.getName() %></h3>
							<p><%= d.getDescription() %></p>
							
						</div>
						
						<div class="card-footer primary-background">
							
							<a href="doctorProfile.jsp?docID=<%= d.getDid() %>" class="btn btn-outline-light btn-sm">View Profile</a>
						
						</div>
					
					</div>
				
				
				</div>
				
		
			<%
		}
	
	%>


</div>
